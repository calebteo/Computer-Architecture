----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2018 06:23:52 PM
-- Design Name: 
-- Module Name: datapath_tb - Behavioral
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

entity datapath_tb is
--  Port ( );
end datapath_tb;

architecture Behavioral of datapath_tb is

Component datapath is
--  Port ( );
    Port( 
        controlW : in std_logic_vector (16 downto 0); 
        constantIn : in std_logic_vector (15 downto 0); 
        dataIn : in std_logic_vector (15 downto 0); 
        clock : in std_logic; 
        addrOut : out std_logic_vector (15 downto 0); 
        dataOut : out std_logic_vector (15 downto 0) 
        
    );
end Component;

signal controlW : std_logic_vector (16 downto 0) := (others => '0'); 
signal constantIn : std_logic_vector (15 downto 0) := (others => '0'); 
signal dataIn : std_logic_vector (15 downto 0) := (others => '0'); 
signal clock : std_logic; 
signal addrOut : std_logic_vector (15 downto 0) := (others => '0'); 
signal dataOut : std_logic_vector (15 downto 0) := (others => '0'); 
Constant Clk_cycle : TIME := 10ns;

begin
    uut : dataPath Port Map (
        controlW => controlW, 
        constantIn => constantIn,
        dataIn => dataIn, 
        clock => clock, 
        addrOut => addrOut, 
        dataOut => dataOut
    );

    Generate_clock : process
    begin
        clock <= '0'; 
        wait for (Clk_cycle /2);
        clock <= '1'; 
        wait for (Clk_cycle/2); 
        
    end process;

stim_process : process
begin
    --controlW <= "10100000000110001";
    constantIn <= "1010101010101010"; 
    dataIn <= "0000000000000000";
    controlW <= "00000000000000011";
    
    wait for 100ns;
    
    dataIn <= "0000000000000001";
    controlW <= "00100000000000011";
    
    wait for 100ns;
    
    dataIn <= "0000000000000010";
    controlW <= "01000000000000011";
    
    wait for 100ns;
    
    dataIn <= "0000000000000011";
    controlW <= "01100000000000011";
    
    wait for 100ns;
    dataIn <= "0000000000000100";
    controlW <= "10000000000000011";
    
    wait for 100ns;
    
    dataIn <= "0000000000000101";
    controlW <= "10100000000000011";
    
    wait for 100ns;
    
    dataIn <= "0000000000000110";
    controlW <= "11000000000000011";
    
    wait for 100ns;
    
    dataIn <= "0000000000000111";
    controlW <= "11100000000000011";
    
    wait for 100ns;
    
    controlW <= "00000101000000010";            --AddrOut = 1 DataOut = 2
    
    wait for 100ns; 
    
    controlW <= "00001110000000010";            --AddrOut = 3 DataOut = 4
    
    wait for 100ns; 
    
    controlW <= "00010111000000010";            --AddrOut = 5 DataOut = 6
     
    wait for 100ns; 
     
    controlW <= "00011100000000010";            --AddrOut = 7 DataOut = 0
     
    wait for 100ns;
    
    controlW <= "00101001100010101"; 
    
    wait for 100ns;
    
    constantIn <= "0000000000100000";
    controlW <= "10000100010001001"; 
    wait;
end process;
end Behavioral;
