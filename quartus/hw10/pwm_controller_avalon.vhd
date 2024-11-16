library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm_controller_avalon is
  port (
    clk : in std_logic;
    rst : in std_logic;
    -- avalon memory-mapped slave interface
    avs_read      : in std_logic;
    avs_write     : in std_logic;
    avs_address   : in std_logic_vector(1 downto 0);
    avs_readdata  : out std_logic_vector(31 downto 0);
    avs_writedata : in std_logic_vector(31 downto 0);
    -- external I/O; export to top-level
    pwm_out       : out std_logic_vector(2 downto 0) -- To pin header for oscope
  );
end entity pwm_controller_avalon;

architecture rtl of pwm_controller_avalon is

  --System Clock Period
  constant system_clock_period : time := 20 ns;
  constant W_PERIOD : integer := 31;
  constant F_PERIOD : integer := 25;
  constant W_DUTY_CYCLE : integer := 12;
  constant F_DUTY_CYCLE : integer := 11;

  --Register signals
  signal period : std_logic_vector(31 downto 0) := (23 => '1', others => '0');
  signal duty_cycle_red     : std_logic_vector(31 downto 0) := (10 => '1', others => '0');
  signal duty_cycle_green   : std_logic_vector(31 downto 0) := (10 => '1', others => '0');
  signal duty_cycle_blue    : std_logic_vector(31 downto 0) := (10 => '1', others => '0');

  --Instanciate LED Patterns
  component pwm_controller is
  generic (
    CLK_PERIOD : time;
    W_PERIOD : integer;     -- Width for period
    F_PERIOD : integer;     -- Fractional bits for period
    W_DUTY_CYCLE : integer; -- Width for duty cycle 
    F_DUTY_CYCLE : integer  -- Fractional bits for duty cycle
  );
  port (
    clk        : in  std_logic;
    rst        : in  std_logic;
    period     : in  unsigned(W_PERIOD - 1 downto 0);
    duty_cycle : in  unsigned(W_DUTY_CYCLE - 1 downto 0);
    pwm_out    : out std_logic
  );
  end component;

begin

  --Instantiate Red Driver
  PWMRED : pwm_controller
  generic
  map (
    CLK_PERIOD => system_clock_period,
    W_PERIOD => W_PERIOD,     
    F_PERIOD => F_PERIOD,     
    W_DUTY_CYCLE => W_DUTY_CYCLE,  
    F_DUTY_CYCLE => F_DUTY_CYCLE
  )
  port map
  (
    clk => clk,
    rst => rst,
	 period => unsigned(period)(W_PERIOD - 1 downto 0),
    duty_cycle => unsigned(duty_cycle_red)(W_DUTY_CYCLE - 1 downto 0),
    pwm_out => pwm_out(0)
  );
  
    --Instantiate Green Driver
  PWMGREEN : pwm_controller
  generic
  map (
    CLK_PERIOD => system_clock_period,
    W_PERIOD => W_PERIOD,     
    F_PERIOD => F_PERIOD,     
    W_DUTY_CYCLE => W_DUTY_CYCLE,  
    F_DUTY_CYCLE => F_DUTY_CYCLE
  )
  port map
  (
    clk => clk,
    rst => rst,
	 period => unsigned(period)(W_PERIOD - 1 downto 0),
    duty_cycle => unsigned(duty_cycle_green)(W_DUTY_CYCLE - 1 downto 0),
    pwm_out => pwm_out(1)
  );
  
    --Instantiate Blue Driver
  PWMBLUE : pwm_controller
  generic
  map (
    CLK_PERIOD => system_clock_period,
    W_PERIOD => W_PERIOD,     
    F_PERIOD => F_PERIOD,     
    W_DUTY_CYCLE => W_DUTY_CYCLE,  
    F_DUTY_CYCLE => F_DUTY_CYCLE
  )
  port map
  (
    clk => clk,
    rst => rst,
	 period => unsigned(period)(W_PERIOD - 1 downto 0),
    duty_cycle => unsigned(duty_cycle_blue)(W_DUTY_CYCLE - 1 downto 0),
    pwm_out => pwm_out(2)
  );

  --Process to read avalon registers
  avalon_register_read : process (clk)
  begin
    if rising_edge(clk) and avs_read = '1' then
      case avs_address is
        when "00" => avs_readdata   <= period;
        when "01" => avs_readdata   <= duty_cycle_red;
		  when "10" => avs_readdata   <= duty_cycle_green;
		  when "11" => avs_readdata   <= duty_cycle_blue;
        when others => avs_readdata <= (others => '0'); -- return zeros for unused registers
      end case;
    end if;
  end process;

  --Process to write  avalon registers
  avalon_register_write : process (clk, rst)
  begin
    if rst = '1' then
      period <= (23 => '1', others => '0');
      duty_cycle_red   <= (10 => '1', others => '0');
		duty_cycle_green <= (10 => '1', others => '0');
		duty_cycle_blue  <= (10 => '1', others => '0');
    elsif rising_edge(clk) and avs_write = '1' then
      case avs_address is
        when "00"   => period <= avs_writedata(31 downto 0);
        when "01"   => duty_cycle_red  <= avs_writedata(31 downto 0);
		  when "10"   => duty_cycle_green  <= avs_writedata(31 downto 0);
		  when "11"   => duty_cycle_blue  <= avs_writedata(31 downto 0);
        when others => null; -- ignore writes to unused registers
      end case;
    end if;
  end process;

end architecture;