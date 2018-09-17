----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2018 11:38:28 AM
-- Design Name: 
-- Module Name: fullAdder_tb - Behavioral
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

entity fullAdder_tb is
--  Port ( );
end fullAdder_tb;

architecture Behavioral of fullAdder_tb is
Component fullAdder is
--  Port ( );
    Port (In1, In2, c_in:in std_ulogic;
    sum, c_out:out std_ulogic );
end Component;

    signal In1, In2, c_in, sum, c_out : std_logic; 
    
begin
    uut : fullAdder Port Map (
        In1 => In1, 
        In2 => In2, 
        c_in => c_in,
        sum => sum,
        c_out => c_out
    ); 

    stim_process : process
    begin
        In1 <= '0';
        In2 <= '1'; 
        c_in <= '0'; 
        wait for 6ns;
        
        c_in <= '1'; 
        
        wait for 6ns; 
        
        In1 <= '0'; 
        In2 <= '0'; 
         
        wait for 6ns;  
        
        
    end process;
end Behavioral;
