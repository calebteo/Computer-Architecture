----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 04:44:52 PM
-- Design Name: 
-- Module Name: FunctionUnit - Behavioral
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

entity FunctionUnit is
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
end FunctionUnit;

architecture Behavioral of FunctionUnit is
    Component ALU is
    Port (
        A : in std_logic_vector (15 downto 0); 
        B : in std_logic_vector (15 downto 0); 
        G : in std_logic_vector (3 downto 0); 
        V : out std_logic;
        C : out std_logic; 
        out_Vector : out std_logic_vector (15 downto 0)
    
    ); 
    end Component;
    
    Component Mux2_1 is
    Port(
        s0_Vector  : in std_logic_vector (15 downto 0); 
        s1_Vector  : in std_logic_vector (15 downto 0);
        s          : in std_logic; 
        out_Vector : out std_logic_vector (15 downto 0) 
        );
    end Component;
    
    Component Shifter16Bit is
    Port (
        s0 : in std_logic; 
        s1 : in std_logic;
        d_Vector : in std_logic_vector(15 downto 0); 
        y_Vector : out std_logic_vector(15 downto 0)
    ); 
    end Component;
    
    signal alu_out : std_logic_vector (15 downto 0) := (others => '0'); 
    signal shifter_out : std_logic_vector (15 downto 0) := (others => '0'); 
begin
    ALU00 : ALU Port Map (
        A => A,
        B => B, 
        G => FS(3 downto 0), 
        V => V, 
        C => C, 
        out_Vector => alu_out
    );
    
    Shifter16Bit00 : Shifter16Bit Port Map (
        s0 => FS(2), 
        s1 => FS(3),
        d_Vector => B,
        y_Vector => shifter_out
    );
     
    Mux2_100 : Mux2_1 Port Map (
        s0_Vector => alu_out,
        s1_Vector => shifter_out,
        s => FS(4),
        out_Vector => output 
    );
    
    Z <= '1' after 1ns when alu_out = "0000000000000000" else
         '0' after 1ns;
    N <= '1' after 1ns when alu_out(15) = '1' else
         '0' after 1ns;     
end Behavioral;
