----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2018 11:47:23 AM
-- Design Name: 
-- Module Name: Extender - Behavioral
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

entity Extender is
--  Port ( );
    Port (
        Dr_Sb : in std_logic_vector (5 downto 0); 
        toPC : out std_logic_vector (15 downto 0)
    );
end Extender;

architecture Behavioral of Extender is
    signal temp : std_logic_vector (15 downto 0) := (others => '0'); 
    
begin
    temp(5 downto 0) <= Dr_Sb; 
    temp(15 downto 6) <= "0000000000";
    
    toPC <= temp after 1ns;

end Behavioral;
