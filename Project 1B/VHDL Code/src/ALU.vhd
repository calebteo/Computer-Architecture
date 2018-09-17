----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 04:27:43 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
--  Port ( );
    Port (
        A : in std_logic_vector (15 downto 0); 
        B : in std_logic_vector (15 downto 0); 
        G : in std_logic_vector (3 downto 0); 
        V : out std_logic;
        C : out std_logic; 
        out_Vector : out std_logic_vector (15 downto 0)
    
    ); 
end ALU;

architecture Behavioral of ALU is
    Component ArithCircuit is 
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
    Component logic16 is 
    Port ( 
        A_vector : in std_logic_vector (15 downto 0); 
        B_vector : in std_logic_vector (15 downto 0);
        S0 : in std_logic; 
        S1 : in std_logic; 
        G_vector : out std_logic_vector(15 downto 0)
    ); 
    end Component;
    
    Component Mux2_1 is
    --  Port ( );
        Port( 
             s0_Vector  : in std_logic_vector (15 downto 0); 
             s1_Vector  : in std_logic_vector (15 downto 0);
             s          : in std_logic; 
             out_Vector : out std_logic_vector (15 downto 0) 
        );
    end Component;
    
    signal carry_out : std_logic; 
    signal carry_out_1 : std_logic;
    signal Arith_out : std_logic_vector (15 downto 0) := (others => '0'); 
    signal log_out   : std_logic_vector (15 downto 0) := (others => '0'); 
    
begin
    ArithCircuit0 : ArithCircuit Port Map (
        A => A,
        B => B,
        s0 => G(1),
        s1 => G(2),
        cin => G(0),
        cout => carry_out,
        c_1out => carry_out_1,
        G_out => Arith_out
    );
    
    logic16_0 : logic16 Port Map (
        A_vector => A,
        B_vector => B, 
        S0 => G(1),
        S1 => G(2),
        G_vector => log_out
    ); 
    
    Mux2_10 : Mux2_1 Port Map (
        s0_Vector => Arith_out,
        s1_Vector => log_out,
        s => G(3),
        out_Vector => out_Vector
    ); 
    
    C <= carry_out;
    V <= (carry_out xor carry_out_1) after 1ns; 
    
end Behavioral;
