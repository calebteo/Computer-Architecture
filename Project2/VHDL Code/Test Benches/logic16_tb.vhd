----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2018 05:22:00 PM
-- Design Name: 
-- Module Name: logic16_tb - Behavioral
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

entity logic16_tb is
--  Port ( );
end logic16_tb;

architecture Behavioral of logic16_tb is
    Component logic16 is
    Port ( 
        A_vector : in std_logic_vector (15 downto 0); 
        B_vector : in std_logic_vector (15 downto 0);
        S0 : in std_logic; 
        S1 : in std_logic; 
        G_vector : out std_logic_vector(15 downto 0)
        );  
    end Component; 
    
    signal A_vector : std_logic_vector (15 downto 0) := (others => '0'); 
    signal B_vector : std_logic_vector (15 downto 0) := (others => '0');
    signal S0 : std_logic; 
    signal S1 : std_logic; 
    signal G_vector : std_logic_vector (15 downto 0); 
      
begin
    uut : logic16 Port Map (
        A_vector => A_vector, 
        B_vector => B_vector, 
        S0 => S0, 
        S1 => S1, 
        G_vector => G_vector
    ); 

stim_proc : process
begin
    A_vector <= "0000000000001111";
    B_vector <= "0000000011111111";
    S0 <= '0'; 
    S1 <= '0';
    
    wait for 1ns; 
    S0 <= '1'; 
    S1 <= '0'; 
    
    wait for 1ns; 
    S0 <= '0'; 
    S1 <= '1'; 
    
    wait for 1ns; 
    S0 <= '1'; 
    S1 <= '1'; 
    
    wait for 1ns; 
    

end process; 
end Behavioral;
