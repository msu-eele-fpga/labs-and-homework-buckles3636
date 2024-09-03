entity synchronizer is
  port (
    clk : in std_ulogic;
    async : in std_ulogic;
    sync : out std_ulogic
  );
end entity synchronizer;

architecture synchronizer_arch of entity synchronizer is

  signal Q1 : std_logic;

  process(clk)
  begin
    if rising_edge(clk) then
      Q1 <= async
      sync <= Q1
    end if;
  end process;

end architecture
