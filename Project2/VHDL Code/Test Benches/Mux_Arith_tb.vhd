----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 11:27:35 AM
-- Design Name: 
-- Module Name: Mux_Arith_tb - Behavioral
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

entity Mux_Arith_tb is
--  Port ( );
end Mux_Arith_tb;

architecture Behavioral of Mux_Arith_tb is
    Component Mux_Arith is
--  Port ( );
    Port( 
        s0 : in std_logic;
        s1 : in std_logic;
        B  : in std_logic_vector (15 downto 0); 
        Y  : out std_logic_vector (15 downto 0)
    ); 
end Component;
    
    signal s0 : std_logic;
    signal s1 : std_logic; 
    signal B  : std_logic_vector (15 downto 0) := (others => '0'); 
    signal Y  : std_logic_vector (15 downto 0) := (others => '0'); 
    
begin
    uut : Mux_Arith Port Map (
        s0 => s0,
        s1 => s1, 
        B => B, 
        Y => Y
    ); 
    
stim_process : process
begin
    s0 <= '0';
    s1 <= '0'; 
    B <= "0101010101010101";
    wait for 5ns; 
    
    s0 <= '1'; 
    wait for 5ns; 
    s0 <= '0'; 
    s1 <= '1'; 
    
    wait for 5ns; 
    s0 <= '1'; 
    
    wait for 5ns; 
    
end process; 
end Behavioral;
