library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_divider is
  generic
  (
    clk_period : time
  );
  port
  (
    clk         : in std_ulogic;
    rst         : in std_ulogic;
    base_period : in unsigned(7 downto 0); -- 8-bit base period in seconds (fixed-point 0000.0000)
    sub_clk     : out std_ulogic
  );
end entity;

architecture Behavioral of clock_divider is
  --------------------------------Important-Notes------------------------------
  --My method to slow down the clock without using expensive divison
  --1). Create a constant for the reciprocal of every clock value we might be using
  --2). Multiply base period by reciprocal
  --3). Truncate the 4 decimal bits off
  -----------------------------------------------------------------------------

  --Calulate recepricol of sub clock
  constant sub_clk_int : integer := (clk_period / 1 ns);
  constant sub_clk_rec : unsigned := to_unsigned(1000000000 / sub_clk_int, 27);
  
  --Signals used to calculate cycle limit 
  signal num_clock_cycles : unsigned(34 downto 0);
  signal count          : unsigned(30 downto 0) := (others => '0');
  signal count_limit    : unsigned(30 downto 0);
  
  signal int_sub_clk : std_ulogic; --Internal sub clock (to this script)

begin

  -- Process to calculate the cycle limit based on the base_period (without division)
  process (base_period)
  begin
    --Multiply to find number of clock cycles required
    num_clock_cycles <= (base_period * sub_clk_rec);
    --Truncate last 4 bits 
    count_limit <= num_clock_cycles(34 downto 4);
  end process;

  -- Sub clock process
  process (clk, rst)
  begin
    if rst = '1' then
      count <= (others => '0');
      int_sub_clk <= '0';
    elsif rising_edge(clk) then
      if count = count_limit then
        count <= (others => '0');
        int_sub_clk <= not int_sub_clk;
      else
        count <= count + 1;
      end if;
    end if;
  end process;
  
  sub_clk <= int_sub_clk;

end architecture;