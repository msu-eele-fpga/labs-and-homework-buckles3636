-- SPDX-License-Identifier: MIT
-- Copyright (c) 2017 Ross K. Snider.  All rights reserved.
----------------------------------------------------------------------------
-- Description:  Top level VHDL file for the DE10-Nano
----------------------------------------------------------------------------
-- Author:       Ross K. Snider
-- Company:      Montana State University
-- Create Date:  September 1, 2017
-- Revision:     1.0
-- License: MIT  (opensource.org/licenses/MIT)
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.altera_primitives_components.all;

-----------------------------------------------------------
-- Signal Names are defined in the DE10-Nano User Manual
-- http://de10-nano.terasic.com
-----------------------------------------------------------
entity DE10_Top_Level is
  port
  (
    ----------------------------------------
    --  CLOCK Inputs
    --  See DE10 Nano User Manual page 23
    ----------------------------------------
    FPGA_CLK1_50 : in std_ulogic; --! 50 MHz clock input #1
    FPGA_CLK2_50 : in std_ulogic; --! 50 MHz clock input #2
    FPGA_CLK3_50 : in std_ulogic; --! 50 MHz clock input #3
    ----------------------------------------
    --  Push Button Inputs (KEY) 
    --  See DE10 Nano User Manual page 24
    --  The KEY push button inputs produce a '0' 
    --  when pressed (asserted)
    --  and produce a '1' in the rest (non-pushed) state
    --  a better label for KEY would be Push_Button_n 
    ----------------------------------------
    KEY : in std_ulogic_vector(1 downto 0); --! Two Pushbuttons (active low)
    ----------------------------------------
    --  Slide Switch Inputs (SW) 
    --  See DE10 Nano User Manual page 25
    --  The slide switches produce a '0' when
    --  in the down position 
    --  (towards the edge of the board)
    ----------------------------------------
    SW : in std_ulogic_vector(3 downto 0); --! Four Slide Switches 
    ----------------------------------------
    --  LED Outputs 
    --  See DE10 Nano User Manual page 26
    --  Setting LED to 1 will turn it on
    ----------------------------------------
    LED : out std_ulogic_vector(7 downto 0); --! Eight LEDs
    ----------------------------------------
    --  GPIO Expansion Headers (40-pin)
    --  See DE10 Nano User Manual page 27
    --  Pin 11 = 5V supply (1A max)
    --  Pin 29 - 3.3 supply (1.5A max)
    --  Pins 12, 30 GND
    --  Note: the DE10-Nano GPIO_0 & GPIO_1 signals
    --  have been replaced by
    --  Audio_Mini_GPIO_0 & Audio_Mini_GPIO_1
    --  since some of the DE10-Nano GPIO pins
    --  have been dedicated to the Audio Mini
    --  plug-in card.  The new signals 
    --  Audio_Mini_GPIO_0 & Audio_Mini_GPIO_1 
    --  contain the available GPIO.
    ----------------------------------------
    --GPIO_0 : inout std_logic_vector(35 downto 0);					--! The 40 pin header on the top of the board
    --GPIO_1 : inout std_logic_vector(35 downto 0);					--! The 40 pin header on the bottom of the board 
    Audio_Mini_GPIO_0 : inout std_ulogic_vector(33 downto 0); --! 34 available I/O pins on GPIO_0
    Audio_Mini_GPIO_1 : inout std_ulogic_vector(12 downto 0) --! 13 available I/O pins on GPIO_1 
  );
end entity DE10_Top_Level;

architecture DE10Nano_arch of DE10_Top_Level is

  --Constants for generics
  constant system_clock_period : time := 20 ns;
  constant base_period     : unsigned(7 downto 0) := "00001000";

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

  --Signals for LED patterns
  signal LED_S0, LED_S1, LED_S2, LED_S3, LED_S4 : std_ulogic_vector(6 downto 0);
  signal int_LED                                : std_ulogic_vector(6 downto 0);

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
    clk   => FPGA_CLK1_50,
    rst   => not KEY(1), --Process uses active high
    async => not KEY(0),
    sync  => pb_debounced
  );

  CD1 : clock_divider
  generic
  map (
  clk_period => system_clock_period
  )
  port
  map
  (
  clk         => FPGA_CLK1_50,
  rst         => not KEY(1), --Process uses active high
  base_period => base_period,
  sub_clk     => sub_clk
  );

  --Main State Process
  STATE_MEMORY : process (FPGA_CLK1_50, KEY(1)) is
  begin
    if (KEY(1) = '0') then
      current_state <= S0;
    elsif (rising_edge(FPGA_CLK1_50)) then
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
        int_LED <= LED_S0;
      when S1 =>
        int_LED <= LED_S1;
      when S2 =>
        int_LED <= LED_S2;
      when S3 =>
        int_LED <= LED_S3;
      when S4 =>
        int_LED <= LED_S4;
    end case;
  end process;

  --Led pattern processes
  LED_SHIFT_RIGHT : process (sub_clk, KEY(1))
  begin
    if KEY(1) = '0' then
      LED_S0 <= "1000000"; -- rst to initial pattern
    elsif rising_edge(sub_clk) then
      LED_S0 <= LED_S0(0) & LED_S0(6 downto 1); -- Shift right
    end if;
  end process;

  TWO_LED_SHIFT_LEFT : process (sub_clk, KEY(1))
  begin
    if KEY(1) = '0' then
      LED_S1 <= "0000011"; -- rst to initial pattern
    elsif rising_edge(sub_clk) then
      LED_S1 <= LED_S1(5 downto 0) & LED_S1(6); -- Shift left
    end if;
  end process;

  BINARY_UP_COUNTER : process (sub_clk, KEY(1))
    variable up_counter : unsigned(6 downto 0) := (others => '0'); -- 7-bit counter
  begin
    if KEY(1) = '0' then
      up_counter := (others => '0'); -- rst counter to zero
      LED_S2 <= (others     => '0'); -- Clear LEDs when rst
    elsif rising_edge(sub_clk) then
      up_counter := up_counter + 1; -- Increment the counter
      LED_S2 <= std_ulogic_vector(up_counter); -- Assign counter value to LEDs
    end if;
  end process;

  BINARY_DOWN_COUNTER : process (sub_clk, KEY(1))
    variable down_counter : unsigned(6 downto 0) := (others => '1'); -- 7-bit counter
  begin
    if KEY(1) = '0' then
      down_counter := (others => '1'); -- rst counter to max
      LED_S3 <= (others       => '0'); -- Clear LEDs when rst
    elsif rising_edge(sub_clk) then
      down_counter := down_counter - 1; -- Increment the counter
      LED_S3 <= std_ulogic_vector(down_counter); -- Assign counter value to LEDs
    end if;
  end process;

  LED_PONG : process (sub_clk, KEY(1))
  begin
    if KEY(1) = '0' then
      LED_S4 <= "1001001"; -- rst to initial pattern
    elsif rising_edge(sub_clk) then
      LED_S4 <= LED_S4(4) & LED_S4(6 downto 5) & '1' & LED_S4(1 downto 0) & LED_S4(2); --"crash" sides into each other
    end if;
  end process;

  LED(6 downto 0) <= int_LED;
  LED(7)          <= sub_clk;

end architecture DE10Nano_arch;