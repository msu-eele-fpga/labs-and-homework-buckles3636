library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity debouncer is
  generic
  (
    clk_period    : time;
    debounce_time : time
  );
  port
  (
    clk       : in std_logic;
    rst       : in std_logic;
    input     : in std_logic;
    debounced : out std_logic
  );
end entity debouncer;

architecture rtl of debouncer is

  constant clk_cycles : integer := integer(debounce_time / clk_period); --number of clock cycles output needs to be locked
  signal count : integer range clk_cycles downto 0 := 0; --internal counter
  signal int_debounced : std_logic;

begin

  process (clk, rst)

  begin
    if (rst = '1') then --if reset pulled high then set output and internl count to 0
      count     <= 0;
      int_debounced <= '0';

    elsif (rising_edge(clk)) then
      if (count = 0) then --if the internal counter is zero that means the output is able to change
        if (int_debounced /= input) then --changes output to input and then starts lockout timer
          int_debounced <= input;
          count     <= 1;
        end if;
      elsif (count < (clk_cycles - 1)) then --output is locked until this internal counter reaches 0
        count <= count + 1;
      else
        count <= 0; --sets counter to 0 to indicate output is once again able to change
      end if;
    end if;

  end process;

  debounced <= int_debounced;

end architecture;