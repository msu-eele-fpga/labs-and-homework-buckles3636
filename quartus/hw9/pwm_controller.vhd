library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm_controller is
  generic (
    CLK_PERIOD : time;
    W_PERIOD : integer;     -- Width for period
    F_PERIOD : integer;     -- Fractional bits for period
    W_DUTY_CYCLE : integer; -- Width for duty cycle 
    F_DUTY_CYCLE : integer  -- Fractional bits for duty cycle
  );
  port (
    clk        : in  std_logic;
    rst        : in  std_logic;
    period     : in  unsigned(W_PERIOD - 1 downto 0);
    duty_cycle : in  unsigned(W_DUTY_CYCLE - 1 downto 0);
    output     : out std_logic
  );
end entity pwm_controller;


architecture rtl of pwm_controller is
  --------------------------------Important-Notes------------------------------
  --My method for pwm generator without using division (Code should automaticly adjust to any clock time and floating point input format)
  --1). Create a constant for the reciprocal of the clock during compile time
  --2). Multiply period by reciprocal to get number of clock cycles 
  --3). Truncate fractional bits off to get an integer to count to
  --4). Multiply duty cycle by number of clock cycles to get the number of cycles to stay high
  -----------------------------------------------------------------------------

  --Calulate recepricol of sub clock
  constant sub_clk_int : integer := (CLK_PERIOD / 1 ns);
  constant sub_clk_rec : unsigned := to_unsigned(1000000000 / sub_clk_int, 27);
  
  --Signals used to calculate cycle limit 
  signal period_num_clock_cycles : unsigned(W_PERIOD + 26 downto 0) := (others => '0');
  signal period_count_limit    : unsigned(W_PERIOD + 26 - F_PERIOD downto 0) := (others => '0');

  signal duty_num_clock_cycles : unsigned(W_PERIOD + 26 - F_PERIOD + W_DUTY_CYCLE downto 0) := (others => '0');
  signal duty_count_limit    : unsigned(W_PERIOD + 26 - F_PERIOD + W_DUTY_CYCLE - F_DUTY_CYCLE downto 0) := (others => '0');

  signal count          : unsigned(34 downto 0) := (others => '0');
  
  signal int_sub_clk : std_logic := '0'; --Internal sub clock (to this script)

begin

  --Multiply to find number of clock cycles required
  period_num_clock_cycles <= (period * sub_clk_rec);
  --Truncate fractional bits 
  period_count_limit <= period_num_clock_cycles(W_PERIOD + 26 downto F_PERIOD);
 
  -- Multiply to find the clock cycles needed for the pulse
  duty_num_clock_cycles <= (period_count_limit * duty_cycle);
  -- Trancate fractional bits
  duty_count_limit <= duty_num_clock_cycles(W_PERIOD + 26 - F_PERIOD + W_DUTY_CYCLE downto F_DUTY_CYCLE);


  -- Sub clock process
  process (clk, rst)
  begin
    if rst = '1' then
      count <= (others => '0');
      int_sub_clk <= '0';
    elsif rising_edge(clk) then
      -- If duty cycle is 1.0 or greater
      if duty_count_limit = 0 then
        int_sub_clk <= '0';
      -- If duty cycle is 0 
      elsif duty_count_limit >= period_count_limit then
        int_sub_clk <= '1';
      elsif count >= period_count_limit then
        count <= (others => '0');
        int_sub_clk <= '1';
      elsif count >= duty_count_limit then
        count <= count + 1;
        int_sub_clk <= '0';
      else
        count <= count + 1;
      end if;
    end if;
  end process;
  
  output <= int_sub_clk;

end architecture;
