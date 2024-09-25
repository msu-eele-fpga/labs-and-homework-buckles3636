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
  constant system_clock_period : time                 := 20 ns;
  constant base_period         : unsigned(7 downto 0) := "00001000";

  --Instantiate led patterns
  component led_patterns is
    generic
    (
      system_clock_period : time
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
  end component;

begin
  LEDP1 : led_patterns
  generic
  map (
  system_clock_period => system_clock_period
  )
  port map
  (
    clk => FPGA_CLK1_50,
    rst => not KEY(1),
    push_button => not KEY(0),
    switches => SW(3 downto 0),
    hps_led_control => false,
    base_period => base_period,
    led_reg => "11111111",
    led => LED(7 downto 0)
  );

end architecture DE10Nano_arch;