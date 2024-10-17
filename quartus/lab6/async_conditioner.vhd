library ieee;
use ieee.std_logic_1164.all;

entity async_conditioner is
  generic
  (
    clk_period    : time;
    debounce_time : time
  );
  port
  (
    clk   : in std_logic;
    rst   : in std_logic;
    async : in std_logic;
    sync  : out std_logic
  );
end entity async_conditioner;

architecture rtl of async_conditioner is

  component synchronizer is
    port
    (
      clk   : in std_logic;
      async : in std_logic;
      sync  : out std_logic
    );
  end component;

  component debouncer is
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
  end component;

  component one_pulse is
    port
    (
      clk   : in std_logic;
      rst   : in std_logic;
      input : in std_logic;
      pulse : out std_logic
    );
  end component;

  signal N1 : std_logic := '0';
  signal N2 : std_logic := '0';
  signal int_sync : std_logic := '0';

begin

  SYNC1 : synchronizer
  port map
  (
    clk   => clk,
    async => async,
    sync  => N1
  );

  DEBOUNCE1 : debouncer
  generic map 
  (
  clk_period    => clk_period,
  debounce_time => debounce_time
  )
  port map
  (
  clk       => clk,
  rst       => rst,
  input     => N1,
  debounced => N2
  );

  ONEPULSE1 : one_pulse 
  port map
  (
  clk   => clk,
  rst   => rst,
  input => N2,
  pulse => int_sync
  );

  sync <= int_sync;

end architecture;