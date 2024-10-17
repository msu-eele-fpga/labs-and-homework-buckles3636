library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity one_pulse is
  port
  (
    clk   : in std_logic;
    rst   : in std_logic;
    input : in std_logic;
    pulse : out std_logic 
  );
end entity one_pulse;

architecture rtl of one_pulse is

  signal prev : std_logic;
  signal int_pulse : std_logic;

begin

  process (clk, rst)

  begin

    if (rst = '1') then
      int_pulse <= '0';
      prev  <= '0';

    elsif (rising_edge(clk)) then
      if (int_pulse = '1') then --if pulse was on  last cycle, turn it off
        int_pulse <= '0';
      elsif (prev = '0' and input = '1') then --if input goes from low to high turn on pulse
        int_pulse <= '1';
      end if;

      prev <= input; --set prev so it is the previous value every clock

    end if;

  end process;
  
  pulse <= int_pulse;

end architecture;