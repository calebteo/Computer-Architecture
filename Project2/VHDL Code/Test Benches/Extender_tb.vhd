----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2018 11:51:43 AM
-- Design Name: 
-- Module Name: Extender_tb - Behavioral
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

entity Extender_tb is
--  Port ( );
end Extender_tb;

architecture Behavioral of Extender_tb is
    Component Extender 
    Port (
        Dr_Sb : in std_logic_vector (5 downto 0); 
        toPC : out std_logic_vector (15 downto 0)
    );
    end Component; 

    signal Dr_Sb : std_logic_vector(5 downto 0) := (others => '0'); 
    signal toPC : std_logic_vector (15 downto 0):= (others => '0');

begin

    uut : Extender Port Map (
        Dr_Sb => Dr_Sb,
        toPC => toPC
    );

stim_proc : process
begin
    Dr_Sb <= "000111"; 
    wait for 2ns;
    Dr_Sb <= "111000";
    wait for 2ns;
    Dr_Sb <= "111111";
    wait for 2ns;
end process;
end Behavioral;
