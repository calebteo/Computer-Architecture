----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 11:24:04 AM
-- Design Name: 
-- Module Name: Shifter1Bit - Behavioral
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

entity Shifter1Bit is
--  Port ( );
    Port( 
        s0 : in std_logic;
        s1 : in std_logic;
        d0, d1, d15 : in std_logic; 
        y  : out std_logic
    );
end Shifter1Bit;

architecture Behavioral of Shifter1Bit is

begin
    y <= d0 after 1ns when s1 = '0' and s0 = '0' else
         d1 after 1ns when s1 = '0' and s0 = '1' else
         d15 after 1ns when s1 = '1' and s0 = '0' else
         '0' after 1ns;
end Behavioral;
