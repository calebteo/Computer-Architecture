----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 02:38:45 PM
-- Design Name: 
-- Module Name: Shifter16Bit_tb - Behavioral
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

entity Shifter16Bit_tb is
--  Port ( );
end Shifter16Bit_tb;

architecture Behavioral of Shifter16Bit_tb is

Component Shifter16Bit is 
    Port (
    s0 : in std_logic; 
    s1 : in std_logic;
    d_Vector : in std_logic_vector(15 downto 0); 
    y_Vector : out std_logic_vector(15 downto 0)
); 
end Component;

signal s0 : std_logic; 
signal s1 : std_logic; 
signal d_Vector : std_logic_vector(15 downto 0) := (others => '0'); 
signal y_Vector : std_logic_vector(15 downto 0) := (others => '0'); 

begin
    utt : Shifter16Bit Port Map(
        s0 => s0,
        s1 => s1, 
        d_Vector => d_Vector,
        y_Vector => y_Vector
    ); 

stim_proc : process
begin
    d_Vector <= "1000000000000000"; 
    s0 <= '0'; 
    s1 <= '0'; 
    
    wait for 5ns; 
    
    s0 <= '1'; 
    
    wait for 5ns;
    
    s0 <= '0'; 
    s1 <= '1'; 
    
    wait for 5ns; 
    
    s0 <= '1';
    
    wait for 5ns; 
end process; 

end Behavioral;
