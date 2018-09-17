----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2018 11:06:26 AM
-- Design Name: 
-- Module Name: rippleAdder_tb - Behavioral
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

entity rippleAdder_tb is
--  Port ( );
end rippleAdder_tb;

architecture Behavioral of rippleAdder_tb is
    Component rippleAdder
    Port ( x : in std_logic_vector(15 downto 0);
            y : in std_logic_vector(15 downto 0); 
            c0 : in std_logic; 
            S : out std_logic_vector(15 downto 0); 
            Cout : out std_logic;
            C_1out : out std_logic);
    end Component;
    
    signal x : std_logic_vector (15 downto 0) := (others => '0'); 
    signal y : std_logic_vector (15 downto 0) := (others => '0'); 
    signal c0 : std_logic; 
    
    signal S : std_logic_vector (15 downto 0); 
    signal Cout : std_logic; 
    signal C_1out : std_logic; 
    
begin
    uut : rippleAdder Port Map (
        x => x,
        y => y, 
        c0 => c0,
        S => S,
        Cout => Cout,
        C_1out => C_1out
    );

stim_proc: process
begin
    x <= "0000000000000001"; 
    y <= "0000000000000001"; 
    c0 <= '0'; 
    
    wait for 50ns; 
    
    c0 <= '1'; 
    
    wait for 50ns; 
    
    x <= "0000000000000100"; 
    y <= "1111111111111110"; 
    c0 <= '0'; 
    
    wait for 50ns; 
    
    --c0 <= '1'; 
    
    --wait for 16ns; 
    
    --x <= "0000000000000010"; 
    
    --wait for 16ns; 
    
end process; 

end Behavioral;
