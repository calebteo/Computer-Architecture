----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 11:20:39 AM
-- Design Name: 
-- Module Name: Mux_Arith - Behavioral
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

entity Mux_Arith is
--  Port ( );
    Port( 
        s0 : in std_logic;
        s1 : in std_logic;
        B  : in std_logic_vector (15 downto 0); 
        Y  : out std_logic_vector (15 downto 0)
    ); 
end Mux_Arith;

architecture Behavioral of Mux_Arith is

begin
    Y <= "0000000000000000" after 1ns when s1 = '0' and s0 = '0' else 
         B after 1ns when s1 = '0' and s0 = '1' else 
         (not B) after 1ns when s1 = '1' and s0 = '0' else 
         "1111111111111111" after 1ns when s1 = '1' and s0 = '1' else 
         "0000000000000000" after 1ns; 

end Behavioral;
