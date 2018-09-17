----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2018 05:14:15 PM
-- Design Name: 
-- Module Name: logic16 - Behavioral
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

entity logic16 is
--  Port ( );
    Port ( 
        A_vector : in std_logic_vector (15 downto 0); 
        B_vector : in std_logic_vector (15 downto 0);
        S0 : in std_logic; 
        S1 : in std_logic; 
        G_vector : out std_logic_vector(15 downto 0)
    ); 
end logic16;

architecture Behavioral of logic16 is

    Component logicCircuit is
    Port( 
            A : in std_logic; 
            B : in std_logic;
            S0 : in std_logic; 
            S1 : in std_logic; 
            G : out std_logic
        );
    end Component; 
begin
    logicCircuit00 : logicCircuit Port Map (
        A => A_vector(0), 
        B => B_vector(0), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(0)
    ); 
    logicCircuit01 : logicCircuit Port Map (
        A => A_vector(1), 
        B => B_vector(1), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(1)
    );    
    logicCircuit02 : logicCircuit Port Map (
        A => A_vector(2), 
        B => B_vector(2), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(2)
    );    
    logicCircuit03 : logicCircuit Port Map (
        A => A_vector(3), 
        B => B_vector(3), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(3)
    );  
    logicCircuit04 : logicCircuit Port Map (
        A => A_vector(4), 
        B => B_vector(4), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(4)
    );
    logicCircuit05 : logicCircuit Port Map (
        A => A_vector(5), 
        B => B_vector(5), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(5)
    );
    logicCircuit06 : logicCircuit Port Map (
        A => A_vector(6), 
        B => B_vector(6), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(6)
    );    
     logicCircuit07 : logicCircuit Port Map (
        A => A_vector(7), 
        B => B_vector(7), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(7)
    );
    logicCircuit08 : logicCircuit Port Map (
        A => A_vector(8), 
        B => B_vector(8), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(8)
    );
    logicCircuit09 : logicCircuit Port Map (
        A => A_vector(9), 
        B => B_vector(9), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(9)
    );
    logicCircuit10 : logicCircuit Port Map (
        A => A_vector(10), 
        B => B_vector(10), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(10)
    );    
    logicCircuit11 : logicCircuit Port Map (
        A => A_vector(11), 
        B => B_vector(11), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(11)
    );    
    logicCircuit12 : logicCircuit Port Map (
        A => A_vector(12), 
        B => B_vector(12), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(12)
    );    
    logicCircuit13 : logicCircuit Port Map (
        A => A_vector(13), 
        B => B_vector(13), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(13)
    );    
    logicCircuit14 : logicCircuit Port Map (
        A => A_vector(14), 
        B => B_vector(14), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(14)
    );
    logicCircuit15 : logicCircuit Port Map (
        A => A_vector(15), 
        B => B_vector(15), 
        S0 => S0, 
        S1 => S1, 
        G => G_vector(15)
    );
    
                           
end Behavioral;
