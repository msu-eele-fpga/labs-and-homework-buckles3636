library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_patterns_tb is
end entity led_patterns_tb;

architecture testbench of led_patterns_tb is

  constant CLK_PERIOD : time := 10 ms;

  component led_patterns is
    generic (
      system_clock_period : time
    );
    port (
      clk             : in std_ulogic;
      rst             : in std_ulogic;
      push_button     : in std_ulogic;
      switches        : in std_ulogic_vector(3 downto 0);
      hps_led_control : in boolean;
      base_period     : in unsigned(7 downto 0);
      led_reg         : in std_ulogic_vector(7 downto 0);
      led             : out std_ulogic_vector(7 downto 0)
    );
  end component;

  signal clk_tb             : std_ulogic                    := '0';
  signal rst_tb             : std_ulogic                    := '0';
  signal push_button_tb     : std_ulogic                    := '0';
  signal switches_tb        : std_ulogic_vector(3 downto 0) := "0000";
  signal hps_led_control_tb : boolean                       := false;
  signal led_tb             : std_ulogic_vector(7 downto 0) := "00000000";
  signal base_period_tb     : unsigned(7 downto 0) := "00000000";

begin

  DUT : led_patterns
  generic map(
    system_clock_period => CLK_PERIOD
  )
  port map
  (
    clk             => clk_tb,
    rst             => rst_tb,
    push_button     => push_button_tb,
    switches        => switches_tb,
    hps_led_control => hps_led_control_tb,
    base_period     => base_period_tb,
    led_reg         => "10101010",
    led             => led_tb
  );

  clk_gen : process is
  begin

    clk_tb <= not clk_tb;
    wait for CLK_PERIOD / 2;

  end process clk_gen;

  -- Create signal states
  async_stim : process is
  begin
    --Set Base Period
    base_period_tb <= "00001000";
    wait for 0.2 sec;

    --Reset 
    rst_tb <= '1';
    wait for 0.2 sec;
    rst_tb <= '0';
    wait for 0.2 sec; 

    --Test state 0
    switches_tb <= "0000";
    wait for 0.2 sec;
    push_button_tb <= '1';
    wait for 0.2 sec;
    push_button_tb <= '0';
    wait for 10 sec;

    --Test state 1
    switches_tb <= "0001";
    wait for 0.2 sec;
    push_button_tb <= '1';
    wait for 0.2 sec;
    push_button_tb <= '0';
    wait for 10 sec;

    --Test state 2
    switches_tb <= "0010";
    wait for 0.2 sec;
    push_button_tb <= '1';
    wait for 0.2 sec;
    push_button_tb <= '0';
    wait for 10 sec;

    --Test state 3
    switches_tb <= "0011";
    wait for 0.2 sec;
    push_button_tb <= '1';
    wait for 0.2 sec;
    push_button_tb <= '0';
    wait for 10 sec;

    --Test state 4
    switches_tb <= "0100";
    wait for 0.2 sec;
    push_button_tb <= '1';
    wait for 0.2 sec;
    push_button_tb <= '0';
    wait for 10 sec;

    --Test that system stays in currnet state if unkown state is selected
    switches_tb <= "1111";
    wait for 0.2 sec;
    push_button_tb <= '1';
    wait for 0.2 sec;
    push_button_tb <= '0';
    wait for 10 sec;

    --Test led output goes to register when HPS_LED is high
    hps_led_control_tb <= true;
    wait for 5 sec;

    wait;

  end process async_stim;

end architecture testbench;