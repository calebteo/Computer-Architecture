----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2018 03:08:43 PM
-- Design Name: 
-- Module Name: Mem_tb - Behavioral
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

entity Mem_tb is
--  Port ( );
end Mem_tb;

architecture Behavioral of Mem_tb is
    Component Mem 
--  Port ( );
    Port (
        Data_in : in std_logic_vector (15 downto 0); 
        MW      : in std_logic; 
        Addr_out : in std_logic_vector (15 downto 0);
        Data_out : out std_logic_vector (15 downto 0)
    );
    end Component; 
    
    signal Data_in : std_logic_vector (15 downto 0) := (others => '0'); 
    signal MW : std_logic; 
    signal Addr_out : std_logic_vector (15 downto 0) := (others => '0'); 
    signal Data_out : std_logic_vector (15 downto 0) := (others => '0'); 
    
begin
    uut : Mem Port Map (
        Data_in => Data_in, 
        MW => MW, 
        Addr_out => Addr_out, 
        Data_out => Data_out
    ); 
    
    stim_proc : process 
    begin
        Data_in <= "1010101010101010";
        MW <= '0'; 
        Addr_out <= X"0000";
        wait for 1ns; 
         
        Addr_out <= X"0002"; 
        wait for 1ns; 
        
        Addr_out <= X"0010"; 
        MW <= '1'; 
        wait for 1ns;
        Data_in <= "0101010101010101"; 
        Addr_out <= X"0011"; 
        wait for 1ns; 
        
        MW <= '0'; 
        wait for 1ns; 
        Addr_out <= X"0010"; 
        wait for 1ns;
    end process;

end Behavioral;
