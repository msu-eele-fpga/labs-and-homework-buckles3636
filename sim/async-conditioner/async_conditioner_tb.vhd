library ieee;
use ieee.std_logic_1164.all;

entity async_conditioner_tb is
end entity async_conditioner_tb;

architecture testbench of async_conditioner_tb is

  constant CLK_PERIOD : time := 20 ns;

  component async_conditioner is
    port
    (
      clk   : in std_ulogic;
      rst   : in std_ulogic;
      async : in std_ulogic;
      sync  : out std_ulogic
    );
  end component async_conditioner;

  signal clk_tb        : std_ulogic := '0';
  signal rst_tb        : std_ulogic := '0';
  signal async_tb      : std_ulogic := '0';
  signal sync_tb       : std_ulogic := '0';
  signal sync_expected : std_ulogic := '0';

begin

  dut : component async_conditioner
    port map
    (
      clk   => clk_tb,
      rst   => rst_tb,
      async => async_tb,
      sync  => sync_tb
    );

    clk_gen : process is
    begin

      clk_tb <= not clk_tb;
      wait for CLK_PERIOD / 2;

    end process clk_gen;

    -- Create the asynchronous signal
    async_stim : process is
    begin

      async_tb <= '0';
      wait for 8 * CLK_PERIOD;

      async_tb <= '1';
      wait for 8 * CLK_PERIOD;

      async_tb <= '0';
      wait for 8 * CLK_PERIOD;

      async_tb <= '1';
      wait for 8 * CLK_PERIOD;

      async_tb <= '0';
      wait for 8 * CLK_PERIOD;

      wait;

    end process async_stim;

    -- Create the expected synchronized output waveform
    expected_sync : process is
    begin

      sync_expected <= '0';
      wait for 11 * CLK_PERIOD;

      sync_expected <= '1';
      wait for 1 * CLK_PERIOD;

      sync_expected <= '0';
      wait for 15 * CLK_PERIOD;

      sync_expected <= '1';
      wait for 1 * CLK_PERIOD;

      sync_expected <= '0';
      wait for 12 * CLK_PERIOD;

      wait;

    end process expected_sync;

    check_output : process is

      variable failed : boolean := false;

    begin

      for i in 0 to 39 loop

        assert sync_expected = sync_tb
        report "Error for clock cycle " & to_string(i) & ":" & LF & "sync = " & to_string(sync_tb) & " sync_expected  = " & to_string(sync_expected)
          severity warning;

        if sync_expected /= sync_tb then
          failed := true;
        end if;

        wait for CLK_PERIOD;

      end loop;

      if failed then
        report "tests failed!"
          severity failure;
      else
        report "all tests passed!";
      end if;

      std.env.finish;

    end process check_output;

  end architecture testbench;