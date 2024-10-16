library ieee;
use ieee.std_logic_1164.all;

entity timed_counter is

  generic (
    clk_period : time;
    count_time : time
  );

  port (
    clk    : in std_logic;
    enable : in std_logic;
    done   : out boolean
  );

end entity timed_counter;
architecture timed_counter_arch of timed_counter is

  constant COUNTER_LIMIT : integer := integer(count_time / clk_period);
  signal index           : integer range COUNTER_LIMIT downto 0 := 0;

begin

  COUNTER : process (clk)
  begin
    if rising_edge(clk) then
      if (enable = '1') then
        index <= 0;
        done <= false;
      elsif index = COUNTER_LIMIT then
        done <= true;
      else
        index <= index + 1;
      end if;
    end if;
  end process;

end architecture;
