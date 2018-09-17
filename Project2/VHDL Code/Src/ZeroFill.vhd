----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2018 08:51:22 PM
-- Design Name: 
-- Module Name: ZeroFill - Behavioral
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

entity ZeroFill is
--  Port ( );
    Port (
        TB_SB : in std_logic_vector (2 downto 0); 
        Zeroed : out std_logic_vector (15 downto 0)
    );
end ZeroFill;

architecture Behavioral of ZeroFill is
    signal temp : std_logic_vector (15 downto 0) := (others => '0'); 
    
begin
    temp(2 downto 0) <= TB_SB; 
    temp(15 downto 3) <= "0000000000000";
    
    Zeroed <= temp after 1ns;

end Behavioral;

