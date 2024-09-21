library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_patterns is
  generic
  (
    system_clock_period : time := 20 ns
  );
  port
  (
    clk             : in std_ulogic;
    rst             : in std_ulogic;
    push_button     : in std_ulogic;
    switches        : in std_ulogic_vector(3 downto 0);
    hps_led_control : in boolean;
    base_period     : in unsigned(7 downto 0);
    led_reg         : in std_ulogic_vector(7 downto 0);
    led             : out std_ulogic_vector(7 downto 0)
  );
end entity led_patterns;

architecture rtl of led_patterns is

  --Defining main states 
  type State_Type is (S0, S1, S2, S3, S4);
  signal current_state, next_state : State_Type;

  --Signals to use timed counter
  signal counter_enable : boolean;
  signal counter_done   : boolean;

  --Sub clock signal for patterns
  signal sub_clk : std_ulogic;

  --Signals to debounce button
  signal pb_debounced : std_ulogic;

  --Signals for led patterns
  signal led_S0, led_S1, led_S2, led_S3, led_S4 : std_ulogic_vector(6 downto 0);
  signal int_led : std_ulogic_vector(6 downto 0);

  --Define Componets
  component clock_divider is
    generic
    (
      clk_period : time
    );
    port
    (
      clk         : in std_ulogic;
      rst         : in std_ulogic;
      base_period : in unsigned(7 downto 0);
      sub_clk     : out std_ulogic
    );
  end component;

  component async_conditioner is
    generic
    (
      clk_period    : time;
      debounce_time : time
    );
    port
    (
      clk   : in std_ulogic;
      rst   : in std_ulogic;
      async : in std_ulogic;
      sync  : out std_ulogic
    );
  end component;

begin

  --Instantiate Components
  ASYNC : async_conditioner
  generic
  map (
  clk_period    => system_clock_period,
  debounce_time => 10 ms
  )
  port map
  (
    clk   => clk,
    rst   => rst,
    async => push_button,
    sync  => pb_debounced
  );

  CD1 : clock_divider
  generic
  map (
  clk_period => system_clock_period
  )
  port map 
  (
  clk         => clk,
  rst         => rst,
  base_period => base_period,
  sub_clk     => sub_clk
  );

  --Main State Process
  STATE_MEMORY : process (clk, rst) is
  begin
    if (rst = '1') then
      current_state <= S0;
    elsif (rising_edge(clk)) then
      if (pb_debounced = '1') then
        current_state <= next_state;
      end if;
    end if;
  end process;

  NEXT_STATE_LOGIC : process (current_state) is
  begin
    case (current_state) is
      when S0 =>
        next_state <= S1;
      when S1 =>
        next_state <= S2;
      when S2 =>
        next_state <= S3;
      when S3 =>
        next_state <= S4;
      when S4 =>
        next_state <= S0;
    end case;
  end process;

  OUTPUT_LOGIC : process (current_state) is
  begin
    case (current_state) is
      when S0 =>
        int_led <= led_S0;
      when S1 =>
        int_led <= led_S1;
      when S2 =>
        int_led <= led_S2;
      when S3 =>
        int_led <= led_S3;
      when S4 =>
        int_led <= led_S4;
    end case;
  end process;

  --Led pattern processes
  LED_SHIFT_RIGHT : process (sub_clk, rst)
  begin
    if rst = '1' then
      led_S0 <= "1000000"; -- rst to initial pattern
    elsif rising_edge(sub_clk) then
      led_S0 <= led_S0(0) & led_S0(6 downto 1); -- Shift right
    end if;
  end process;

  TWO_LED_SHIFT_LEFT : process (sub_clk, rst)
  begin
    if rst = '1' then
      led_S1 <= "0000011"; -- rst to initial pattern
    elsif rising_edge(sub_clk) then
      led_S1 <= led_S1(5 downto 0) & led_S1(6); -- Shift left
    end if;
  end process;

  BINARY_UP_COUNTER : process (sub_clk, rst)
    variable up_counter : unsigned(6 downto 0) := (others => '0'); -- 7-bit counter
  begin
    if rst = '1' then
      up_counter := (others => '0'); -- rst counter to zero
      led_S2 <= (others     => '0'); -- Clear LEDs when rst
    elsif rising_edge(sub_clk) then
      up_counter := up_counter + 1; -- Increment the counter
      led_S2 <= std_ulogic_vector(up_counter); -- Assign counter value to LEDs
    end if;
  end process;

  BINARY_DOWN_COUNTER : process (sub_clk, rst)
    variable down_counter : unsigned(6 downto 0) := (others => '1'); -- 7-bit counter
  begin
    if rst = '1' then
      down_counter := (others => '1'); -- rst counter to max
      led_S3 <= (others       => '0'); -- Clear LEDs when rst
    elsif rising_edge(sub_clk) then
      down_counter := down_counter - 1; -- Increment the counter
      led_S3 <= std_ulogic_vector(down_counter); -- Assign counter value to LEDs
    end if;
  end process;

  LED_PONG : process (sub_clk, rst)
  begin
    if rst = '1' then
      led_S4 <= "1001001"; -- rst to initial pattern
    elsif rising_edge(sub_clk) then
      led_S4 <= led_S4(4) & led_S4(6 downto 5) & '1' & led_S4(2) & led_S4(1 downto 0); --"crash" sides into each other
    end if;
  end process;
  
  led(6 downto 0) <= int_led;
  led(7) <= sub_clk;
  
end architecture;