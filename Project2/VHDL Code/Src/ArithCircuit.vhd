----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 11:16:25 AM
-- Design Name: 
-- Module Name: ArithCircuit - Behavioral
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

entity ArithCircuit is
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
end ArithCircuit;

architecture Behavioral of ArithCircuit is
Component rippleAdder is
--  Port ( );
    Port(
        x : in std_logic_vector(15 downto 0);
        y : in std_logic_vector(15 downto 0); 
        c0 : in std_logic; 
        S : out std_logic_vector(15 downto 0); 
        Cout : out std_logic;
        C_1out : out std_logic);
        
end Component;

Component Mux_Arith is
--  Port ( );
    Port( 
        s0 : in std_logic;
        s1 : in std_logic;
        B  : in std_logic_vector (15 downto 0); 
        Y  : out std_logic_vector (15 downto 0)
    ); 
end Component;

signal new_y : std_logic_vector (15 downto 0) := (others => '0'); 
signal output : std_logic_vector (15 downto 0) := (others => '0'); 

begin
    Mux_Arith00 : Mux_Arith Port Map (
        s0 => s0,
        s1 => s1, 
        B => B, 
        Y => new_y
    ); 
    
    rippleAdder00 : rippleAdder Port Map (
        x => A, 
        y => new_y, 
        c0 => cin,
        S => output,
        Cout => cout, 
        C_1out => c_1out
    ); 
    
    G_out <= output;
    
end Behavioral;
