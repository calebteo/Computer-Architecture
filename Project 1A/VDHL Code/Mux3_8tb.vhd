----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2018 11:42:46 AM
-- Design Name: 
-- Module Name: Mux3_8tb - Behavioral
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

entity Mux3_8tb is
--  Port ( );
end Mux3_8tb;

architecture Behavioral of Mux3_8tb is
    
    Component Mux3_8
    PORT ( 
        In0 : in std_logic_vector(15 downto 0);
        In1 : in std_logic_vector(15 downto 0); 
        s : in std_logic;
        Z : out std_logic_vector(15 downto 0)
        );
    end Component; 
    
    signal In0 : std_logic_vector(15 downto 0); 
    signal In1 : std_logic_vector(15 downto 0); 
    signal s   : std_logic; 
    signal z   : std_logic_vector(15 downto 0); 
    
begin
    uut: Mux3_8 PORT MAP (
        In0 => In0, 
        In1 => In1,
        s => s,
        z => z
    );

    stim_proc: process
    begin 
    In0 <= "0000000011111111"; 
    In1 <= "1111111100000000";
    
    wait for 10ns; 
    
    s <= '0'; 
    wait for 10ns; 
    
    s <= '1'; 


    end process; 
end Behavioral;
