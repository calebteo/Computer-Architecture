----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2018 01:13:46 PM
-- Design Name: 
-- Module Name: ZeroFill_tb - Behavioral
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

entity ZeroFill_tb is
--  Port ( );
end ZeroFill_tb;

architecture Behavioral of ZeroFill_tb is
    Component ZeroFill 
    Port (
        TB_SB : in std_logic_vector (2 downto 0); 
        Zeroed : out std_logic_vector (15 downto 0)
    );
    end Component; 
    
    signal TB_SB : std_logic_vector ( 2 downto 0); 
    signal Zeroed : std_logic_vector (15 downto 0); 
    
begin
    uut : Zerofill Port Map (
        TB_SB => TB_SB,
        Zeroed => Zeroed
    );

stim_proc : process
begin
    TB_SB <= "001"; 
    wait for 5ns; 
    TB_SB <= "100";
    wait for 5ns;  
end process;

end Behavioral;
