----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2018 10:03:17 AM
-- Design Name: 
-- Module Name: MuxC - Behavioral
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

entity MuxC is
--  Port ( );
    Port(
         IR  : in std_logic_vector (7 downto 0); 
         NA : in std_logic_vector (7 downto 0);
         MC          : in std_logic; 
         toCar : out std_logic_vector (7 downto 0)
    );
end MuxC;

architecture Behavioral of MuxC is
    
begin
    toCar <= IR after 1ns when MC = '1' else
             NA after 1ns when MC = '0' else 
             "00000000" after 1ns; 

end Behavioral;
