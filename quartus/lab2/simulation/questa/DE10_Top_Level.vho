-- Copyright (C) 2024  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"

-- DATE "09/20/2024 23:29:25"

-- 
-- Device: Altera 5CSEBA6U23I7 Package UFBGA672
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	DE10_Top_Level IS
    PORT (
	FPGA_CLK1_50 : IN std_logic;
	FPGA_CLK2_50 : IN std_logic;
	FPGA_CLK3_50 : IN std_logic;
	KEY : IN std_logic_vector(1 DOWNTO 0);
	SW : IN std_logic_vector(3 DOWNTO 0);
	LED : OUT std_logic_vector(7 DOWNTO 0);
	Audio_Mini_GPIO_0 : INOUT std_logic_vector(33 DOWNTO 0);
	Audio_Mini_GPIO_1 : INOUT std_logic_vector(12 DOWNTO 0)
	);
END DE10_Top_Level;

-- Design Ports Information
-- FPGA_CLK1_50	=>  Location: PIN_V11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- FPGA_CLK2_50	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- FPGA_CLK3_50	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_AH16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[0]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[1]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[2]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[3]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[4]	=>  Location: PIN_AF26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[5]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[6]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[7]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[0]	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[1]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[2]	=>  Location: PIN_W12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[3]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[4]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[5]	=>  Location: PIN_AH13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[6]	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[7]	=>  Location: PIN_AH14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[8]	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[9]	=>  Location: PIN_AH3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[10]	=>  Location: PIN_AD5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[11]	=>  Location: PIN_AG14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[12]	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[13]	=>  Location: PIN_AE6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[14]	=>  Location: PIN_AD23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[15]	=>  Location: PIN_AE24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[16]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[17]	=>  Location: PIN_AD20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[18]	=>  Location: PIN_AC23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[19]	=>  Location: PIN_AC22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[20]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[21]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[22]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[23]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[24]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[25]	=>  Location: PIN_W14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[26]	=>  Location: PIN_Y18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[27]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[28]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[29]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[30]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[31]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[32]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_0[33]	=>  Location: PIN_AA11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_1[0]	=>  Location: PIN_AH26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_1[1]	=>  Location: PIN_AG23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_1[2]	=>  Location: PIN_AG24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_1[3]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_1[4]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_1[5]	=>  Location: PIN_AH23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_1[6]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_1[7]	=>  Location: PIN_AF22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_1[8]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_1[9]	=>  Location: PIN_AG20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_1[10]	=>  Location: PIN_AF21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_1[11]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Audio_Mini_GPIO_1[12]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_W24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF DE10_Top_Level IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_FPGA_CLK1_50 : std_logic;
SIGNAL ww_FPGA_CLK2_50 : std_logic;
SIGNAL ww_FPGA_CLK3_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_LED : std_logic_vector(7 DOWNTO 0);
SIGNAL \FPGA_CLK1_50~input_o\ : std_logic;
SIGNAL \FPGA_CLK2_50~input_o\ : std_logic;
SIGNAL \FPGA_CLK3_50~input_o\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[0]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[1]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[2]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[3]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[4]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[5]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[6]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[7]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[8]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[9]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[10]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[11]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[12]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[13]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[14]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[15]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[16]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[17]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[18]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[19]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[20]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[21]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[22]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[23]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[24]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[25]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[26]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[27]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[28]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[29]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[30]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[31]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[32]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_0[33]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_1[0]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_1[1]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_1[2]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_1[3]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_1[4]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_1[5]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_1[6]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_1[7]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_1[8]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_1[9]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_1[10]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_1[11]~input_o\ : std_logic;
SIGNAL \Audio_Mini_GPIO_1[12]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;

BEGIN

ww_FPGA_CLK1_50 <= FPGA_CLK1_50;
ww_FPGA_CLK2_50 <= FPGA_CLK2_50;
ww_FPGA_CLK3_50 <= FPGA_CLK3_50;
ww_KEY <= KEY;
ww_SW <= SW;
LED <= ww_LED;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X89_Y8_N22
\LED[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[0]~input_o\,
	devoe => ww_devoe,
	o => ww_LED(0));

-- Location: IOOBUF_X89_Y9_N39
\LED[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[1]~input_o\,
	devoe => ww_devoe,
	o => ww_LED(1));

-- Location: IOOBUF_X89_Y9_N5
\LED[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[2]~input_o\,
	devoe => ww_devoe,
	o => ww_LED(2));

-- Location: IOOBUF_X89_Y9_N22
\LED[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[3]~input_o\,
	devoe => ww_devoe,
	o => ww_LED(3));

-- Location: IOOBUF_X89_Y4_N79
\LED[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LED(4));

-- Location: IOOBUF_X89_Y4_N96
\LED[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LED(5));

-- Location: IOOBUF_X89_Y8_N5
\LED[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LED(6));

-- Location: IOOBUF_X89_Y9_N56
\LED[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LED(7));

-- Location: IOOBUF_X40_Y0_N2
\Audio_Mini_GPIO_0[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(0));

-- Location: IOOBUF_X38_Y81_N36
\Audio_Mini_GPIO_0[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(1));

-- Location: IOOBUF_X40_Y0_N19
\Audio_Mini_GPIO_0[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(2));

-- Location: IOOBUF_X32_Y81_N19
\Audio_Mini_GPIO_0[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(3));

-- Location: IOOBUF_X38_Y81_N53
\Audio_Mini_GPIO_0[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(4));

-- Location: IOOBUF_X60_Y0_N53
\Audio_Mini_GPIO_0[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(5));

-- Location: IOOBUF_X34_Y0_N76
\Audio_Mini_GPIO_0[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(6));

-- Location: IOOBUF_X62_Y0_N53
\Audio_Mini_GPIO_0[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(7));

-- Location: IOOBUF_X26_Y0_N93
\Audio_Mini_GPIO_0[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(8));

-- Location: IOOBUF_X36_Y0_N36
\Audio_Mini_GPIO_0[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(9));

-- Location: IOOBUF_X8_Y0_N36
\Audio_Mini_GPIO_0[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(10));

-- Location: IOOBUF_X60_Y0_N36
\Audio_Mini_GPIO_0[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(11));

-- Location: IOOBUF_X82_Y0_N59
\Audio_Mini_GPIO_0[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(12));

-- Location: IOOBUF_X8_Y0_N53
\Audio_Mini_GPIO_0[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(13));

-- Location: IOOBUF_X76_Y0_N2
\Audio_Mini_GPIO_0[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(14));

-- Location: IOOBUF_X82_Y0_N42
\Audio_Mini_GPIO_0[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(15));

-- Location: IOOBUF_X40_Y81_N2
\Audio_Mini_GPIO_0[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(16));

-- Location: IOOBUF_X70_Y0_N19
\Audio_Mini_GPIO_0[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(17));

-- Location: IOOBUF_X84_Y0_N19
\Audio_Mini_GPIO_0[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(18));

-- Location: IOOBUF_X84_Y0_N2
\Audio_Mini_GPIO_0[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(19));

-- Location: IOOBUF_X89_Y4_N62
\Audio_Mini_GPIO_0[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(20));

-- Location: IOOBUF_X89_Y8_N56
\Audio_Mini_GPIO_0[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(21));

-- Location: IOOBUF_X68_Y0_N2
\Audio_Mini_GPIO_0[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(22));

-- Location: IOOBUF_X32_Y0_N19
\Audio_Mini_GPIO_0[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(23));

-- Location: IOOBUF_X68_Y0_N19
\Audio_Mini_GPIO_0[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(24));

-- Location: IOOBUF_X60_Y0_N2
\Audio_Mini_GPIO_0[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(25));

-- Location: IOOBUF_X89_Y6_N22
\Audio_Mini_GPIO_0[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(26));

-- Location: IOOBUF_X89_Y6_N5
\Audio_Mini_GPIO_0[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(27));

-- Location: IOOBUF_X89_Y25_N56
\Audio_Mini_GPIO_0[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(28));

-- Location: IOOBUF_X89_Y23_N39
\Audio_Mini_GPIO_0[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(29));

-- Location: IOOBUF_X8_Y0_N2
\Audio_Mini_GPIO_0[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(30));

-- Location: IOOBUF_X89_Y23_N56
\Audio_Mini_GPIO_0[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(31));

-- Location: IOOBUF_X56_Y0_N19
\Audio_Mini_GPIO_0[32]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(32));

-- Location: IOOBUF_X8_Y0_N19
\Audio_Mini_GPIO_0[33]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_0(33));

-- Location: IOOBUF_X84_Y0_N53
\Audio_Mini_GPIO_1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_1(0));

-- Location: IOOBUF_X78_Y0_N2
\Audio_Mini_GPIO_1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_1(1));

-- Location: IOOBUF_X80_Y0_N36
\Audio_Mini_GPIO_1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_1(2));

-- Location: IOOBUF_X76_Y0_N53
\Audio_Mini_GPIO_1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_1(3));

-- Location: IOOBUF_X74_Y0_N76
\Audio_Mini_GPIO_1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_1(4));

-- Location: IOOBUF_X78_Y0_N36
\Audio_Mini_GPIO_1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_1(5));

-- Location: IOOBUF_X89_Y4_N45
\Audio_Mini_GPIO_1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_1(6));

-- Location: IOOBUF_X74_Y0_N42
\Audio_Mini_GPIO_1[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_1(7));

-- Location: IOOBUF_X76_Y0_N19
\Audio_Mini_GPIO_1[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_1(8));

-- Location: IOOBUF_X72_Y0_N53
\Audio_Mini_GPIO_1[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_1(9));

-- Location: IOOBUF_X74_Y0_N59
\Audio_Mini_GPIO_1[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_1(10));

-- Location: IOOBUF_X70_Y0_N36
\Audio_Mini_GPIO_1[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_1(11));

-- Location: IOOBUF_X70_Y0_N53
\Audio_Mini_GPIO_1[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => Audio_Mini_GPIO_1(12));

-- Location: IOIBUF_X89_Y25_N4
\SW[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: IOIBUF_X89_Y25_N21
\SW[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X89_Y23_N4
\SW[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X89_Y23_N21
\SW[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X32_Y0_N1
\FPGA_CLK1_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_FPGA_CLK1_50,
	o => \FPGA_CLK1_50~input_o\);

-- Location: IOIBUF_X56_Y0_N1
\FPGA_CLK2_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_FPGA_CLK2_50,
	o => \FPGA_CLK2_50~input_o\);

-- Location: IOIBUF_X32_Y81_N1
\FPGA_CLK3_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_FPGA_CLK3_50,
	o => \FPGA_CLK3_50~input_o\);

-- Location: IOIBUF_X64_Y0_N35
\KEY[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: IOIBUF_X64_Y0_N52
\KEY[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: IOIBUF_X40_Y0_N1
\Audio_Mini_GPIO_0[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(0),
	o => \Audio_Mini_GPIO_0[0]~input_o\);

-- Location: IOIBUF_X38_Y81_N35
\Audio_Mini_GPIO_0[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(1),
	o => \Audio_Mini_GPIO_0[1]~input_o\);

-- Location: IOIBUF_X40_Y0_N18
\Audio_Mini_GPIO_0[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(2),
	o => \Audio_Mini_GPIO_0[2]~input_o\);

-- Location: IOIBUF_X32_Y81_N18
\Audio_Mini_GPIO_0[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(3),
	o => \Audio_Mini_GPIO_0[3]~input_o\);

-- Location: IOIBUF_X38_Y81_N52
\Audio_Mini_GPIO_0[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(4),
	o => \Audio_Mini_GPIO_0[4]~input_o\);

-- Location: IOIBUF_X60_Y0_N52
\Audio_Mini_GPIO_0[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(5),
	o => \Audio_Mini_GPIO_0[5]~input_o\);

-- Location: IOIBUF_X34_Y0_N75
\Audio_Mini_GPIO_0[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(6),
	o => \Audio_Mini_GPIO_0[6]~input_o\);

-- Location: IOIBUF_X62_Y0_N52
\Audio_Mini_GPIO_0[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(7),
	o => \Audio_Mini_GPIO_0[7]~input_o\);

-- Location: IOIBUF_X26_Y0_N92
\Audio_Mini_GPIO_0[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(8),
	o => \Audio_Mini_GPIO_0[8]~input_o\);

-- Location: IOIBUF_X36_Y0_N35
\Audio_Mini_GPIO_0[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(9),
	o => \Audio_Mini_GPIO_0[9]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\Audio_Mini_GPIO_0[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(10),
	o => \Audio_Mini_GPIO_0[10]~input_o\);

-- Location: IOIBUF_X60_Y0_N35
\Audio_Mini_GPIO_0[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(11),
	o => \Audio_Mini_GPIO_0[11]~input_o\);

-- Location: IOIBUF_X82_Y0_N58
\Audio_Mini_GPIO_0[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(12),
	o => \Audio_Mini_GPIO_0[12]~input_o\);

-- Location: IOIBUF_X8_Y0_N52
\Audio_Mini_GPIO_0[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(13),
	o => \Audio_Mini_GPIO_0[13]~input_o\);

-- Location: IOIBUF_X76_Y0_N1
\Audio_Mini_GPIO_0[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(14),
	o => \Audio_Mini_GPIO_0[14]~input_o\);

-- Location: IOIBUF_X82_Y0_N41
\Audio_Mini_GPIO_0[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(15),
	o => \Audio_Mini_GPIO_0[15]~input_o\);

-- Location: IOIBUF_X40_Y81_N1
\Audio_Mini_GPIO_0[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(16),
	o => \Audio_Mini_GPIO_0[16]~input_o\);

-- Location: IOIBUF_X70_Y0_N18
\Audio_Mini_GPIO_0[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(17),
	o => \Audio_Mini_GPIO_0[17]~input_o\);

-- Location: IOIBUF_X84_Y0_N18
\Audio_Mini_GPIO_0[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(18),
	o => \Audio_Mini_GPIO_0[18]~input_o\);

-- Location: IOIBUF_X84_Y0_N1
\Audio_Mini_GPIO_0[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(19),
	o => \Audio_Mini_GPIO_0[19]~input_o\);

-- Location: IOIBUF_X89_Y4_N61
\Audio_Mini_GPIO_0[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(20),
	o => \Audio_Mini_GPIO_0[20]~input_o\);

-- Location: IOIBUF_X89_Y8_N55
\Audio_Mini_GPIO_0[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(21),
	o => \Audio_Mini_GPIO_0[21]~input_o\);

-- Location: IOIBUF_X68_Y0_N1
\Audio_Mini_GPIO_0[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(22),
	o => \Audio_Mini_GPIO_0[22]~input_o\);

-- Location: IOIBUF_X32_Y0_N18
\Audio_Mini_GPIO_0[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(23),
	o => \Audio_Mini_GPIO_0[23]~input_o\);

-- Location: IOIBUF_X68_Y0_N18
\Audio_Mini_GPIO_0[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(24),
	o => \Audio_Mini_GPIO_0[24]~input_o\);

-- Location: IOIBUF_X60_Y0_N1
\Audio_Mini_GPIO_0[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(25),
	o => \Audio_Mini_GPIO_0[25]~input_o\);

-- Location: IOIBUF_X89_Y6_N21
\Audio_Mini_GPIO_0[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(26),
	o => \Audio_Mini_GPIO_0[26]~input_o\);

-- Location: IOIBUF_X89_Y6_N4
\Audio_Mini_GPIO_0[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(27),
	o => \Audio_Mini_GPIO_0[27]~input_o\);

-- Location: IOIBUF_X89_Y25_N55
\Audio_Mini_GPIO_0[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(28),
	o => \Audio_Mini_GPIO_0[28]~input_o\);

-- Location: IOIBUF_X89_Y23_N38
\Audio_Mini_GPIO_0[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(29),
	o => \Audio_Mini_GPIO_0[29]~input_o\);

-- Location: IOIBUF_X8_Y0_N1
\Audio_Mini_GPIO_0[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(30),
	o => \Audio_Mini_GPIO_0[30]~input_o\);

-- Location: IOIBUF_X89_Y23_N55
\Audio_Mini_GPIO_0[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(31),
	o => \Audio_Mini_GPIO_0[31]~input_o\);

-- Location: IOIBUF_X56_Y0_N18
\Audio_Mini_GPIO_0[32]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(32),
	o => \Audio_Mini_GPIO_0[32]~input_o\);

-- Location: IOIBUF_X8_Y0_N18
\Audio_Mini_GPIO_0[33]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_0(33),
	o => \Audio_Mini_GPIO_0[33]~input_o\);

-- Location: IOIBUF_X84_Y0_N52
\Audio_Mini_GPIO_1[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_1(0),
	o => \Audio_Mini_GPIO_1[0]~input_o\);

-- Location: IOIBUF_X78_Y0_N1
\Audio_Mini_GPIO_1[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_1(1),
	o => \Audio_Mini_GPIO_1[1]~input_o\);

-- Location: IOIBUF_X80_Y0_N35
\Audio_Mini_GPIO_1[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_1(2),
	o => \Audio_Mini_GPIO_1[2]~input_o\);

-- Location: IOIBUF_X76_Y0_N52
\Audio_Mini_GPIO_1[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_1(3),
	o => \Audio_Mini_GPIO_1[3]~input_o\);

-- Location: IOIBUF_X74_Y0_N75
\Audio_Mini_GPIO_1[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_1(4),
	o => \Audio_Mini_GPIO_1[4]~input_o\);

-- Location: IOIBUF_X78_Y0_N35
\Audio_Mini_GPIO_1[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_1(5),
	o => \Audio_Mini_GPIO_1[5]~input_o\);

-- Location: IOIBUF_X89_Y4_N44
\Audio_Mini_GPIO_1[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_1(6),
	o => \Audio_Mini_GPIO_1[6]~input_o\);

-- Location: IOIBUF_X74_Y0_N41
\Audio_Mini_GPIO_1[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_1(7),
	o => \Audio_Mini_GPIO_1[7]~input_o\);

-- Location: IOIBUF_X76_Y0_N18
\Audio_Mini_GPIO_1[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_1(8),
	o => \Audio_Mini_GPIO_1[8]~input_o\);

-- Location: IOIBUF_X72_Y0_N52
\Audio_Mini_GPIO_1[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_1(9),
	o => \Audio_Mini_GPIO_1[9]~input_o\);

-- Location: IOIBUF_X74_Y0_N58
\Audio_Mini_GPIO_1[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_1(10),
	o => \Audio_Mini_GPIO_1[10]~input_o\);

-- Location: IOIBUF_X70_Y0_N35
\Audio_Mini_GPIO_1[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_1(11),
	o => \Audio_Mini_GPIO_1[11]~input_o\);

-- Location: IOIBUF_X70_Y0_N52
\Audio_Mini_GPIO_1[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Audio_Mini_GPIO_1(12),
	o => \Audio_Mini_GPIO_1[12]~input_o\);

-- Location: LABCELL_X42_Y17_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


