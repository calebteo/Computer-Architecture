----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2018 10:06:23 AM
-- Design Name: 
-- Module Name: MuxC_tb - Behavioral
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

entity MuxC_tb is
--  Port ( );
end MuxC_tb;

architecture Behavioral of MuxC_tb is
    Component MuxC
    Port(
         IR  : in std_logic_vector (7 downto 0); 
         NA : in std_logic_vector (7 downto 0);
         MC          : in std_logic; 
         toCar : out std_logic_vector (7 downto 0)
    );
    end Component;
    
    signal IR : std_logic_vector(7 downto 0) := (others => '0'); 
    signal NA : std_logic_vector(7 downto 0) := (others => '0'); 
    signal MC : std_logic;
    signal toCar : std_logic_vector(7 downto 0) := (others => '0'); 
    
begin
    uut : MuxC Port Map (
        IR => IR,
        NA => NA,
        MC => MC, 
        toCar => toCar
    );

stim_proc : process
begin
    IR <= "00000001"; 
    NA <= "00000010"; 
    MC <= '0'; 
    wait for 2ns; 
    MC <= '1'; 
    wait for 2ns; 
  
end process;
end Behavioral;
