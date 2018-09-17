----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2018 05:38:32 PM
-- Design Name: 
-- Module Name: MuxS_tb - Behavioral
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

entity MuxS_tb is
--  Port ( );
end MuxS_tb;

architecture Behavioral of MuxS_tb is
    Component MuxS
    Port ( 
        N : in std_logic; 
        Z : in std_logic; 
        V : in std_logic; 
        C : in std_logic;
        MS : in std_logic_vector(2 downto 0); 
        
        toCar : out std_logic
    );
end Component;

signal N : std_logic; 
signal Z : std_logic; 
signal V : std_logic; 
signal C : std_logic; 
signal MS : std_logic_vector(2 downto 0) := (others => '0');
signal toCar : std_logic; 
   
begin
    uut : MuxS Port Map (
        N => N, 
        Z => Z, 
        V => V, 
        C => C, 
        MS => MS, 
        toCar => toCar
    );
    
    stim_proc: process
    begin
        N <= '0';
        Z <= '0';
        V <= '0';
        C <= '0';
        
        wait for 5ns; 
        MS <= "000"; 
        
        wait for 5ns; 
        MS <= "001"; 
        
        wait for 5ns; 
        MS <= "010"; 
        
        wait for 5ns; 
        MS <= "011"; 
        
        wait for 5ns; 
        MS <= "100"; 
        
        wait for 5ns; 
        MS <= "101"; 
        
        wait for 5ns; 
        MS <= "110"; 
        
        wait for 5ns; 
        MS <= "111"; 
        
        wait for 5ns; 
         
    end process; 

end Behavioral;
