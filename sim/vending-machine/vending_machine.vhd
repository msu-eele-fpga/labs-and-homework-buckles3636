library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.assert_pkg.all;
use work.print_pkg.all;
use work.tb_pkg.all;

entity vending_machine is
  port (
    clk      : in std_ulogic;
    rst      : in std_ulogic;
    nickel   : in std_ulogic;
    dime     : in std_ulogic;          
    dispense : out std_ulogic;         
    amount   : out natural range 0 to 15  
  );
end entity vending_machine;

architecture vending_machine_arch of vending_machine is

  type State_Type is (Cent0, Cent5, Cent10, Cent15);  -- State enumeration
  signal current_state, next_state : State_Type;                 -- Current state, initialized to Cent0

begin

  STATE_MEMORY : process(clk, rst) is
  begin
    if (rst = '1') then
      current_state <= Cent0;
    elsif (rising_edge(clk)) then
      current_state <= next_state;
    end if;
  end process;

  NEXT_STATE_LOGIC : process(current_state, nickel, dime) is
  begin
    case (current_state) is

      when Cent0 =>
        if (dime = '1') then
          next_state <= Cent10;  
        elsif (nickel = '1') then
          next_state <= Cent5;  
        else
          next_state <= Cent0;   
        end if;

      when Cent5 =>
        if (dime = '1') then
          next_state <= Cent15;
        elsif (nickel = '1') then
          next_state <= Cent10;  
        else
          next_state <= Cent5;   
        end if;

      when Cent10 =>
        if (dime = '1' or nickel = '1') then
          next_state <= Cent15;
        else
          next_state <= Cent10;  
        end if;

      when others => 
        next_state <= Cent0;
                
    end case;
  end process;

  OUTPUT_LOGIC : process(current_state, nickel, dime) is
  begin
    case (current_state) is

      when Cent15 =>
        dispense <= '1';
        amount <= 15;
        
      when Cent10 =>
        dispense <= '0';
        amount <= 10;        

      when Cent5 =>
        dispense <= '0';
        amount <= 5;

      when others => 
        dispense <= '0';
        amount <= 0;
                
    end case;
  end process;

end architecture;
