library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_patterns_avalon is
  port (
    clk : in std_ulogic;
    rst : in std_ulogic;
    -- avalon memory-mapped slave interface
    avs_read      : in std_logic;
    avs_write     : in std_logic;
    avs_address   : in std_logic_vector(1 downto 0);
    avs_readdata  : out std_logic_vector(31 downto 0);
    avs_writedata : in std_logic_vector(31 downto 0);
    -- external I/O; export to top-level
    push_button : in std_ulogic;
    switches    : in std_ulogic_vector(3 downto 0);
    led         : out std_ulogic_vector(7 downto 0)
  );
end entity led_patterns_avalon;

architecture rtl of led_patterns_avalon is

  --Register signals
  signal hps_led_control : std_logic_vector(31 downto 0) := (others => '0');
  signal base_period     : std_logic_vector(31 downto 0) := (others => '0');
  signal led_reg         : std_logic_vector(31 downto 0) := (others => '0');

begin

  --Process to read avalon registers
  avalon_register_read : process (clk)
  begin
    if rising_edge(clk) and avs_read = '1' then
      case avs_address is
        when "00" => avs_readdata   <= hps_led_control;
        when "01" => avs_readdata   <= base_period;
        when "10" => avs_readdata   <= led_reg;
        when others => avs_readdata <= (others => '0'); -- return zeros for unused registers
      end case;
    end if;
  end process;

  --Process to write  avalon registers
  avalon_register_write : process (clk, rst)
  begin
    if rst = '1' then
      hps_led_control  <= (others => '0'); 
      base_period <= (others => '0');
      led_reg <= (others => '0');
    elsif rising_edge(clk) and avs_write = '1' then
      case avs_address is
        when "00"   => hps_led_control <= avs_writedata(31 downto 0);
        when "01"   => base_period     <= avs_writedata(31 downto 0);
        when "10"   => led_reg         <= avs_writedata(31 downto 0);
        when others => null; -- ignore writes to unused registers
      end case;
    end if;
  end process;

end architecture;