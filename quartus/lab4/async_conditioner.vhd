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
    clk   : in std_ulogic;
    rst   : in std_ulogic;
    async : in std_ulogic;
    sync  : out std_ulogic
  );
end entity async_conditioner;

architecture rtl of async_conditioner is

  component synchronizer is
    port
    (
      clk   : in std_ulogic;
      async : in std_ulogic;
      sync  : out std_ulogic
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
      clk       : in std_ulogic;
      rst       : in std_ulogic;
      input     : in std_ulogic;
      debounced : out std_ulogic
    );
  end component;

  component one_pulse is
    port
    (
      clk   : in std_ulogic;
      rst   : in std_ulogic;
      input : in std_ulogic;
      pulse : out std_ulogic
    );
  end component;

  signal N1 : std_ulogic := '0';
  signal N2 : std_ulogic := '0';

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
  pulse => sync
  );

end architecture;