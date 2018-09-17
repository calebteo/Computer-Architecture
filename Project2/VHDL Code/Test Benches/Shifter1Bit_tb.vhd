----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2018 11:41:08 AM
-- Design Name: 
-- Module Name: Shifter1Bit_tb - Behavioral
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

entity Shifter1Bit_tb is
--  Port ( );
end Shifter1Bit_tb;

architecture Behavioral of Shifter1Bit_tb is
    Component Shifter1Bit is
--  Port ( );
    Port( 
        s0 : in std_logic;
        s1 : in std_logic;
        d0, d1, d15 : in std_logic; 
        y  : out std_logic
    );
    end Component;
    
    signal s0, s1, d0, d1, d15, y: std_logic;
     
begin
    uut : Shifter1Bit Port Map (
        s0 => s0,
        s1 => s1, 
        d0 => d0, 
        d1 => d1, 
        d15 => d15, 
        y => y
    );

stim_process : process
begin
    s0 <= '0'; 
    s1 <= '0'; 
    d0 <= '1'; 
    d1 <= '0';
    d15 <= '0'; 
    
    wait for 1ns; 
    
    s0 <= '1'; 
    s1 <= '0';
    
    wait for 1ns; 
    
    s0 <= '0'; 
    s1 <= '1'; 
    wait for 1ns; 
    
end process; 
end Behavioral;
