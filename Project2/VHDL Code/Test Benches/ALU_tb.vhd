----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 11:07:58 AM
-- Design Name: 
-- Module Name: ALU_tb - Behavioral
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

entity ALU_tb is
--  Port ( );
end ALU_tb;

architecture Behavioral of ALU_tb is
    Component ALU is
--  Port ( );
    Port (
        A : in std_logic_vector (15 downto 0); 
        B : in std_logic_vector (15 downto 0); 
        G : in std_logic_vector (3 downto 0); 
        V : out std_logic;
        C : out std_logic; 
        out_Vector : out std_logic_vector (15 downto 0)
    
    ); 
end Component;

signal A : std_logic_vector (15 downto 0) := (others => '0'); 
signal B : std_logic_vector (15 downto 0) := (others => '0'); 
signal G : std_logic_vector (3 downto 0) := (others => '0'); 
signal V : std_logic;
signal C : std_logic;
signal out_Vector : std_logic_vector (15 downto 0) := (others => '0'); 

begin
    uut : ALU Port Map (
        A => A,
        B => B,
        G => G, 
        V => V, 
        C => C,
        out_Vector => out_Vector
    );

stim_proess : process
begin
    A <= "0000000000000010";
    B <= "0000000000000001";
    G <= "0000"; 
    
    wait for 80ns; 
    
    G <= "0001"; 
    
    wait for 80ns; 
    
    G <= "0010";

    wait for 80ns; 
    
    G <= "0011"; 

    wait for 80ns; 
    
    G <= "0100"; 

    wait for 80ns; 
    
    G <= "0101"; 
    
    wait for 80ns; 
    
    G <= "0110"; 
    
    wait for 80ns; 
    
    G <= "0111"; 
        
    wait for 80ns; 
    
    G <= "1000"; 

    wait for 80ns; 
    
    G <= "1010"; 
    
    wait for 80ns; 
    
    G <= "1100"; 
    
    wait for 80ns; 
    
    G <= "1110"; 
    
    wait for 80ns;
end process; 
end Behavioral;
