----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2018 03:33:36 PM
-- Design Name: 
-- Module Name: reg16tb - Behavioral
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

entity reg16tb is
--  Port ( );
end reg16tb;

architecture Behavioral of reg16tb is
    
    Component reg16
    port ( D : in std_logic_vector(15 downto 0);
            load, Clk : in std_logic;
            Q : out std_logic_vector(15 downto 0)
            );
    end component;

    signal D : std_logic_vector(15 downto 0) := (others => '0'); 
    signal load : std_logic; 
    signal Clk : std_logic; 
    signal Q : std_logic_vector(15 downto 0) := (others => '0'); 
    
    Constant Clk_cycle : TIME := 10ns; 
begin
    
    uut : reg16 PORT MAP (
        D => D,
        load => load, 
        Clk => Clk, 
        Q => Q 
    );
    
    Generate_clock : process
    begin
        Clk <= '0'; 
        wait for (Clk_cycle /2);
        Clk <= '1'; 
        wait for (Clk_cycle/2); 
        
    end process; 
    
    stim_proc : process
    begin
        D <= "0101010101010101";
        load <= '1'; 
        wait for (Clk_cycle); 
        D <= "0000000000000000"; 
        load <= '0'; 
        wait for (Clk_cycle); 
        load <= '1'; 
        wait for (Clk_cycle); 
         
        
    end process; 

end Behavioral;
