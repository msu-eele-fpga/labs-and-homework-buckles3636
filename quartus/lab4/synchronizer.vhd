library ieee;
use ieee.std_logic_1164.all;

entity synchronizer is
  port (
    clk : in std_ulogic;
    async : in std_ulogic;
    sync : out std_ulogic
  );
end entity synchronizer;

architecture rtl of synchronizer is

  signal Q1 : std_ulogic;
  signal int_sync : std_ulogic;

begin

  process(clk)
  begin
    if rising_edge(clk) then
      Q1 <= async;
      int_sync <= Q1;
    end if;
  end process;

  sync <= int_sync;

end architecture;