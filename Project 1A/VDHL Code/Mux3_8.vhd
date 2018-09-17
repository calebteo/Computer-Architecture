----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2018 11:02:52 AM
-- Design Name: 
-- Module Name: Mux3_8 - Behavioral
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

entity Mux3_8 is
--  Port ( );
    port ( In0 : in std_logic_vector(15 downto 0);
    In1 : in std_logic_vector(15 downto 0);
    s : in std_logic;
    Z : out std_logic_vector(15 downto 0));

end Mux3_8;

architecture Behavioral of Mux3_8 is
begin
    Z <= In0 after 5 ns when s='0' else
         In1 after 5 ns when s='1'else
         "0000000000000000" after 5 ns;
end Behavioral;
