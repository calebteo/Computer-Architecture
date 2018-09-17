----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2018 05:01:27 PM
-- Design Name: 
-- Module Name: logicCircuit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity logicCircuit is
--  Port ( );
    Port( 
        A : in std_logic; 
        B : in std_logic;
        S0 : in std_logic; 
        S1 : in std_logic; 
        G : out std_logic
    ); 
end logicCircuit;

architecture Behavioral of logicCircuit is
    constant gate_delay : time := 1ns; 
begin
    G <= (A and B) after gate_delay when S1 = '0' and S0 = '0' else 
         (A or B ) after gate_delay when S1 = '0' and S0 = '1' else 
         (A xor B) after gate_delay when S1 = '1' and S0 = '0' else
         (not A  ) after gate_delay when S1 = '1' and S0 = '1' else
         '0' after gate_delay; 

end Behavioral;
