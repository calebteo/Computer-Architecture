----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2018 01:37:09 PM
-- Design Name: 
-- Module Name: PC_tb - Behavioral
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

entity PC_tb is
--  Port ( );
end PC_tb;

architecture Behavioral of PC_tb is
    Component PC
--  Port ( );
    Port ( 
        fromIR : in std_logic_vector (15 downto 0); 
        PL : in std_logic; 
        PI : in std_logic; 
        reset : in std_logic; 
        toMem : out std_logic_vector (15 downto 0)
    );  
    end Component;

signal fromIR : std_logic_vector (15 downto 0) := (others => '0'); 
signal PL : std_logic;
signal PI : std_logic;
signal reset : std_logic; 
signal toMem : std_logic_vector (15 downto 0) := (others => '0'); 

begin
    uut : PC Port Map (
        fromIR => fromIR,
        PL => PL, 
        PI => PI, 
        reset => reset,
        toMem => toMem
    );
    
    stim_proc : process
    begin
        fromIR <= "0000000000100111"; 
        PI <= '1'; 
        PL <= '0'; 
        wait for 4ns; 
        PL <= '1'; 
        PI <= '0';
        wait for 2ns; 
        PI <= '1';
        wait for 2ns; 
        
        reset <= '1'; 
        wait for 2ns; 
        reset <= '0';
        PL <= '0';
        PI <= '1';
        wait for 1ns;
        PI <= '0';
        wait for 1ns;
        PI <= '1';
        wait for 1ns;
        PI <= '0';
        wait for 1ns;
        PI <= '1';
        wait for 1ns;
        PI <= '0';
        wait for 1ns;        
        PI <= '1';
        wait for 1ns;
        PI <= '0';
        wait for 1ns;
        PI <= '1';
        wait for 1ns;
        PI <= '0';
        wait for 1ns;
        PI <= '1';
        wait for 1ns;
        PI <= '0';
        wait for 1ns;   
    end process;

end Behavioral;
