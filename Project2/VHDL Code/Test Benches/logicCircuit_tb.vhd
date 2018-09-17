----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2018 11:39:55 AM
-- Design Name: 
-- Module Name: logicCircuit_tb - Behavioral
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

entity logicCircuit_tb is
--  Port ( );
end logicCircuit_tb;

architecture Behavioral of logicCircuit_tb is
    Component logicCircuit is
--  Port ( );
    Port( 
        A : in std_logic; 
        B : in std_logic;
        S0 : in std_logic; 
        S1 : in std_logic; 
        G : out std_logic
    ); 
    end Component;
    
    signal A, B, S0, S1, G : std_logic;
begin
    uut : logicCircuit Port Map (
        A => A, 
        B => B, 
        S0 => S0, 
        S1 => S1, 
        G => G
    );

stim_proces : process
begin
    A <= '0';
    B <= '0'; 
    S0 <= '0';
    S1 <= '0';
    wait for 1ns; 
    
    S0 <= '1'; 
    wait for 1ns; 
    
    S0 <= '0'; 
    S1 <= '1'; 
    wait for 1ns; 
    
    S0 <= '1'; 
    
    wait for 1ns; 
    
    A <= '1';
    B <= '0'; 
    S0 <= '0';
    S1 <= '0';
    wait for 1ns; 
    
    S0 <= '1'; 
    wait for 1ns; 
    
    S0 <= '0'; 
    S1 <= '1'; 
    wait for 1ns; 
    
    S0 <= '1'; 
    
    wait for 1ns; 
end process; 

end Behavioral;
