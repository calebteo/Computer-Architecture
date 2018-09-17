----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 05:03:08 PM
-- Design Name: 
-- Module Name: FunctionUnit_tb - Behavioral
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

entity FunctionUnit_tb is
--  Port ( );
end FunctionUnit_tb;

architecture Behavioral of FunctionUnit_tb is
Component FunctionUnit is
--  Port ( );
    Port( 
        A : in std_logic_vector (15 downto 0); 
        B : in std_logic_vector (15 downto 0); 
        FS : in std_logic_vector (4 downto 0);
        V : out std_logic; 
        C : out std_logic; 
        N : out std_logic; 
        Z : out std_logic; 
        output : out std_logic_vector (15 downto 0) 
    ); 
end Component;

    signal A : std_logic_vector (15 downto 0) := (others => '0'); 
    signal B : std_logic_vector (15 downto 0) := (others => '0'); 
    signal FS: std_logic_vector (4 downto 0) := (others => '0'); 
    signal V : std_logic;
    signal C : std_logic;
    signal N : std_logic;
    signal Z : std_logic;
    signal output : std_logic_vector (15 downto 0) := (others => '0'); 
begin
    uut : FunctionUnit Port Map (
        A => A,
        B => B, 
        FS => FS,
        V => V, 
        C => C, 
        N => N,
        Z => Z, 
        output => output
    ); 

stim_process : process
begin
    A <= "0000000000000100"; 
    B <= "0000000000000010";
     
    FS <= "00000";    
    wait for 90ns; 

    FS <= "00001";
    wait for 90ns; 
    
    FS <= "00010";
    wait for 90ns; 
    
    FS <= "00011"; 
    wait for 90ns; 
    
    FS <= "00100"; 
    wait for 90ns; 
    
    FS <= "00101";
    wait for 90ns; 
    
    FS <= "00110";
    wait for 90ns; 
    
    FS <= "00111";
    wait for 90ns; 
    
    FS <= "01000"; 
    wait for 90ns; 
    
    FS <= "01010";
    wait for 90ns; 
    
    FS <= "01100";
    wait for 90ns; 
    
    FS <= "01110";
    wait for 90ns;
    
    FS <= "10000";
    wait for 90ns;
    
    FS <= "10100";
    wait for 90ns;
    
    FS <= "11000";
    wait for 90ns;
    
    
end process;

end Behavioral;
