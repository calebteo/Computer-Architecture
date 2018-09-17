----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 04:22:45 PM
-- Design Name: 
-- Module Name: Mux2_1 - Behavioral
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

entity Mux2_1 is
--  Port ( );
    Port( 
         s0_Vector  : in std_logic_vector (15 downto 0); 
         s1_Vector  : in std_logic_vector (15 downto 0);
         s          : in std_logic; 
         out_Vector : out std_logic_vector (15 downto 0) 
    );
end Mux2_1;

architecture Behavioral of Mux2_1 is
    
begin
    out_Vector <= s0_Vector after 1ns when s = '0' else
                  s1_Vector after 1ns when s = '1' else
                  "0000000000000000" after 1ns; 

end Behavioral;
