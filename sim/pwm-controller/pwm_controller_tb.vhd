library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm_controller_tb is
end entity pwm_controller_tb;

architecture rtl of pwm_controller_tb is
  signal clk        : std_logic := '0';
  signal rst        : std_logic := '1';
  signal period     : unsigned(30 downto 0) := "0000000010000000000000000000000"; -- 125ms
  signal duty_cycle : unsigned(11 downto 0) :=  "000000000000"; -- 0%
  signal pwm_out    : std_logic;

begin
  -- Instantiate the DUT
  DUT: entity work.pwm_controller
    generic map (
      CLK_PERIOD => 1000 ns
    )
    port map (
      clk        => clk,
      rst        => rst,
      period     => period,
      duty_cycle => duty_cycle,
      output     => pwm_out
    );

  -- Clock process
  process
  begin
    clk <= '0';
    wait for 500 ns;
    clk <= '1';
    wait for 500 ns;
  end process;

  -- Testbench process
  process
  begin
    -- Tests at 125ms period
    wait for 5 ms;
    rst <= '1';
    wait for 5 ms;
    rst <= '0';
    wait for 500 ms;
    duty_cycle <= "001000000000"; -- 25% Duty
    wait for 500 ms;
    duty_cycle <= "010000000000"; -- 50% duty
    wait for 500 ms;
    duty_cycle <= "110000000000"; -- 150% duty (Should show as 100%)
    wait for 500 ms;

    -- Repeat tests at 62.5ms period
    period <= "0000000000100000000000000000000"; -- 62.5ms 
    duty_cycle <= "001000000000"; -- 25% Duty
    wait for 500 ms;
    duty_cycle <= "010000000000"; -- 50% duty
    wait for 500 ms;
    duty_cycle <= "110000000000"; -- 150% duty (Should show as 100%)
    wait for 500 ms;
    

  end process;
end architecture;
