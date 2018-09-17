----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 11:44:30 AM
-- Design Name: 
-- Module Name: Shifter16Bit - Behavioral
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

entity Shifter16Bit is
--  Port ( );
    Port (
        s0 : in std_logic; 
        s1 : in std_logic;
        d_Vector : in std_logic_vector(15 downto 0); 
        y_Vector : out std_logic_vector(15 downto 0)
    ); 
end Shifter16Bit;

architecture Behavioral of Shifter16Bit is
    Component Shifter1Bit is 
    Port( 
        s0 : in std_logic;
        s1 : in std_logic;
        d0, d1, d15 : in std_logic; 
        y  : out std_logic
        ); 
    end Component; 
    signal tmp : std_logic_vector (15 downto 0) := (others => '0'); 
begin
    Shifter1Bit00 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1, 
        d0 => d_Vector(0),
        d1 => d_Vector(1),
        d15 => '0',      
        y => tmp(0)
    );
    Shifter1Bit01 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1,
        d0 => d_Vector(1),
        d1 => d_Vector(2),
        d15 => d_Vector(0),      
        y => tmp(1)
);
    Shifter1Bit02 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1, 
        d0 => d_Vector(2),
        d1 => d_Vector(3),
        d15 => d_Vector(1),
        y => tmp(2)
    ); 
    Shifter1Bit03 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1,
        d0 => d_Vector(3),
        d1 => d_Vector(4),
        d15 => d_Vector(2),
        y => tmp(3)
    ); 
    Shifter1Bit04 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1, 
        d0 => d_Vector(4),
        d1 => d_Vector(5),
        d15 => d_Vector(3),
        y => tmp(4)
    ); 
    Shifter1Bit05 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1, 
        d0 => d_Vector(5),
        d1 => d_Vector(6),
        d15 => d_Vector(4), 
        y => tmp(5)
    ); 
    Shifter1Bit06 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1, 
        d0 => d_Vector(6),
        d1 => d_Vector(7),
        d15 => d_Vector(5), 
        y => tmp(6)
    ); 
    Shifter1Bit07 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1, 
        d0 => d_Vector(7),
        d1 => d_Vector(8),
        d15 => d_Vector(6), 
        y => tmp(7)
    ); 
    Shifter1Bit08 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1, 
        d0 => d_Vector(8),
        d1 => d_Vector(9),
        d15 => d_Vector(7), 
        y => tmp(8)
    ); 
    Shifter1Bit09 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1, 
        d0 => d_Vector(9),
        d1 => d_Vector(10),
        d15 => d_Vector(8),
        y =>tmp(9)
    );
    Shifter1Bit10 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1, 
        d0 => d_Vector(10),
        d1 => d_Vector(11),
        d15 => d_Vector(9),
        y => tmp(10)
    ); 
    Shifter1Bit11 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1, 
        d0 => d_Vector(11),
        d1 => d_Vector(12),
        d15 => d_Vector(10),
        y => tmp(11)
    ); 
    Shifter1Bit12 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1, 
        d0 => d_Vector(12),
        d1 => d_Vector(13),
        d15 => d_Vector(11), 
        y => tmp(12)
    ); 
    Shifter1Bit13 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1, 
        d0 => d_Vector(13),
        d1 => d_Vector(14),
        d15 => d_Vector(12),
        y => tmp(13)
    ); 
    Shifter1Bit14 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1, 
        d0 => d_Vector(14),
        d1 => d_Vector(15),
        d15 => d_Vector(13),
        y => tmp(14)
    ); 
    Shifter1Bit15 : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1,  
        d0 => d_Vector(15),
        d1 => '0',
        d15 => d_Vector(14),
        y => tmp(15)
    );  
    
    y_Vector <= tmp; 
    
end Behavioral;
