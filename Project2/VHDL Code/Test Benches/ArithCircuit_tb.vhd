----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 11:47:10 AM
-- Design Name: 
-- Module Name: ArithCircuit_tb - Behavioral
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

entity ArithCircuit_tb is
--  Port ( );
end ArithCircuit_tb;

architecture Behavioral of ArithCircuit_tb is
Component ArithCircuit is
--  Port ( );
    Port(
        A : in std_logic_vector (15 downto 0); 
        B : in std_logic_vector (15 downto 0); 
        s0: in std_logic; 
        s1: in std_logic; 
        cin : in std_logic; 
        cout : out std_logic; 
        c_1out: out std_logic; 
        G_out : out std_logic_vector (15 downto 0) 
    ); 
end Component;

signal A : std_logic_vector (15 downto 0) := (others => '0');
signal B : std_logic_vector (15 downto 0) := (others => '0');
signal s0: std_logic;
signal s1: std_logic;
signal cin : std_logic;
signal cout : std_logic;
signal c_1out: std_logic;
signal G_out : std_logic_vector (15 downto 0) := (others => '0');  

begin
    uut : ArithCircuit Port Map (
        A => A,
        B => B,
        s0 => s0,
        s1 => s1, 
        cin => cin, 
        cout => cout, 
        c_1out => c_1out, 
        G_out => G_out
    ); 

stim_prcoess : process 
begin 
    A <= "0000000000000100"; 
    B <= "0000000000000001"; 
    s0 <= '0'; 
    s1 <= '0'; 
    cin <= '0'; 
    
    wait for 80ns; 
    
    s0 <= '1'; 
    
    wait for 80ns; 
    s0 <= '0'; 
    s1 <= '1';
    
    wait for 80ns; 
    s0 <= '1';
    wait for 80ns; 
end process;
end Behavioral;
