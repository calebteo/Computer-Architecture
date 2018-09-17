----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2018 05:13:16 PM
-- Design Name: 
-- Module Name: MuxS - Behavioral
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

entity MuxS is
    Port ( 
        N : in std_logic; 
        Z : in std_logic; 
        V : in std_logic; 
        C : in std_logic;
        MS : in std_logic_vector(2 downto 0); 
        
        toCar : out std_logic
    );
end MuxS;

architecture Behavioral of MuxS is
    
    signal not_Z : std_logic; 
    signal not_C : std_logic;
    signal N_pass : std_logic;
    signal Z_pass : std_logic;
    signal V_pass : std_logic;
    signal C_pass : std_logic;
    signal value_one : std_logic; 
    signal value_zero : std_logic; 


begin
    not_Z <= (not Z); 
    not_C <= (not C); 
    value_one <= '1';
    value_zero <= '0';
    
    toCar <= value_zero after 1ns when MS = "000" else
             value_one  after 1ns when MS = "001" else
             C          after 1ns when MS = "010" else
             V          after 1ns when MS = "011" else 
             Z          after 1ns when MS = "100" else
             N          after 1ns when MS = "101" else
             not_C      after 1ns when MS = "110" else
             not_Z      after 1ns when MS = "111";
             --'0' after 1ns;  

end Behavioral;
