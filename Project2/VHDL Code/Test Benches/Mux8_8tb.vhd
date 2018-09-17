----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2018 11:08:34 AM
-- Design Name: 
-- Module Name: Mux8_8tb - Behavioral
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

entity Mux8_8tb is
--  Port ( );
end Mux8_8tb;
    
architecture Behavioral of Mux8_8tb is
    
    Component Mux8_8
    PORT(
         s0 : IN  std_logic;
         s1 : IN std_logic;
         s2 : IN std_logic; 
         sT : IN std_logic; 
         in0 : IN  std_logic_vector(15 downto 0);
         in1 : IN  std_logic_vector(15 downto 0);
         in2 : IN  std_logic_vector(15 downto 0);
         in3 : IN  std_logic_vector(15 downto 0);
         in4 : IN  std_logic_vector(15 downto 0);
         in5 : IN  std_logic_vector(15 downto 0);
         in6 : IN  std_logic_vector(15 downto 0);
         in7 : IN  std_logic_vector(15 downto 0);
         in8 : IN std_logic_vector (15 downto 0); 
         z : OUT  std_logic_vector(15 downto 0)
        );
    end Component; 
    
    signal s0 : std_logic; 
    signal s1 : std_logic;
    signal s2 : std_logic;
    signal sT : std_logic; 
    signal in0 : std_logic_vector(15 downto 0) := (others => '0');
    signal in1 : std_logic_vector(15 downto 0) := (others => '0');
    signal in2 : std_logic_vector(15 downto 0) := (others => '0');
    signal in3 : std_logic_vector(15 downto 0) := (others => '0');
    signal in4 : std_logic_vector(15 downto 0) := (others => '0');
    signal in5 : std_logic_vector(15 downto 0) := (others => '0');
    signal in6 : std_logic_vector(15 downto 0) := (others => '0');
    signal in7 : std_logic_vector(15 downto 0) := (others => '0');
    signal in8 : std_logic_vector(15 downto 0) := (others => '0');
    signal z : std_logic_vector(15 downto 0);
    
    
begin

    uut: Mux8_8 PORT MAP (
        s0 => s0,
        s1 => s1,
        s2 => s2,
        sT => sT,
        in0 => in0,
        in1 => in1,
        in2 => in2,
        in3 => in3,
        in4 => in4,
        in5 => in5,
        in6 => in6,
        in7 => in7,
        in8 => in8,
        z => z
    );
    stim_proc: process 
    begin 
        in0 <= "0000000000000000"; 
        in1 <= "0000000000000001";
        in2 <= "0000000000000010";
	    in3 <= "0000000000000100";
	    in4 <= "0000000000001000";
        in5 <= "0000000000010000"; 
        in6 <= "0000000000100000"; 
        in7 <= "0000000001000000"; 
        in8 <= "0000000010000000"; 
        sT <= '0';
        
        wait for 10ns; 
        s0 <= '0'; 
        s1 <= '0'; 
        s2 <= '0'; 
    
        wait for 10ns; 
        s0 <= '0'; 
        s1 <= '0'; 
        s2 <= '1';
        
        wait for 10ns;
        s0 <= '0';
        s1 <= '1';
        s2 <= '0';
        
        wait for 10ns;
        s0 <= '0';
        s1 <= '1';
        s2 <= '1';
     
        wait for 10ns;
        s0 <= '1';
        s1 <= '0';
        s2 <= '0';
        
        wait for 10ns;
        s0 <= '1';
        s1 <= '0';
        s2 <= '1';
       
        wait for 10ns;
        s0 <= '1';
        s1 <= '1';
        s2 <= '0';
      
        wait for 10ns;
        s0 <= '1';
        s1 <= '1';
        s2 <= '1';
        
        wait for 10ns; 
        sT <= '1';
        wait for 10ns;
    end process;

end Behavioral;
