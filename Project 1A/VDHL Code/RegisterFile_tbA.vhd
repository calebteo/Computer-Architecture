----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2018 03:20:13 PM
-- Design Name: 
-- Module Name: RegisterFile_tbA - Behavioral
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile_tbA is
--  Port ( );
end RegisterFile_tbA;

architecture Behavioral of RegisterFile_tbA is
    COMPONENT RegisterFile
    PORT(
    src_s0 : in std_logic;
    src_s1 : in std_logic;
    src_s2 : in std_logic; 
    des_A0 : in std_logic;
    des_A1 : in std_logic;
    des_A2 : in std_logic;
    Clk : in std_logic;
    data_src : in std_logic;
    data : in std_logic_vector(15 downto 0);
    
    reg0 : out std_logic_vector(15 downto 0);
    reg1 : out std_logic_vector(15 downto 0);
    reg2 : out std_logic_vector(15 downto 0);
    reg3 : out std_logic_vector(15 downto 0);
    reg4 : out std_logic_vector(15 downto 0);
    reg5 : out std_logic_vector(15 downto 0);
    reg6 : out std_logic_vector(15 downto 0);
    reg7 : out std_logic_vector(15 downto 0)
    );
    END COMPONENT; 
    
    --INPUTS
    signal src_s0 : std_logic;
    signal src_s1 : std_logic;
    signal src_s2 : std_logic;
    signal des_A0 : std_logic;
    signal des_A1 : std_logic; 
    signal des_A2 : std_logic; 
    signal Clk : std_logic;
    signal data_src : std_logic; 
    signal data : std_logic_vector(15 downto 0) := (others => '0');
    
    --OUTPUTS
    signal reg0 : std_logic_vector(15 downto 0) := (others => '0');
    signal reg1 : std_logic_vector(15 downto 0) := (others => '0');
    signal reg2 : std_logic_vector(15 downto 0) := (others => '0');
    signal reg3 : std_logic_vector(15 downto 0) := (others => '0');
    signal reg4 : std_logic_vector(15 downto 0) := (others => '0');
    signal reg5 : std_logic_vector(15 downto 0) := (others => '0');
    signal reg6 : std_logic_vector(15 downto 0) := (others => '0');
    signal reg7 : std_logic_vector(15 downto 0) := (others => '0');
    
begin
    uut: RegisterFile PORT MAP (
        src_s0 => src_s0,
        src_s1 => src_s1,
        src_s2 => src_s2,
        des_A0 => des_A0,
        des_A1 => des_A1,
        des_A2 => des_A2,
        Clk => Clk, 
        data_src => data_src,
        data   => data,
        
        reg0 => reg0,
        reg1 => reg1,
        reg2 => reg2,
        reg3 => reg3,
        reg4 => reg4,
        reg5 => reg5,
        reg6 => reg6,
        reg7 => reg7
    );
    
    stim_proc: process
    
    begin 
        data <= "1111111100000000";
        data_src <= '0';
        src_s0 <= '0'; 
        src_s1 <= '0'; 
        src_s2 <= '0';
        des_A0 <= '0';
        des_A1 <= '0';
        des_A2 <= '0';
        Clk <= '0';
        wait for 5ns;
        Clk <= '1';
        wait for 5ns;  
        Clk <= '0';
        
        des_A0 <= '1';
        des_A1 <= '0';
        des_A2 <= '0';
        wait for 5ns;
        Clk <= '1'; 
        wait for 5ns;  
        Clk <= '0'; 
        
        des_A0 <= '0';
        des_A1 <= '1';
        des_A2 <= '0';
        wait for 5ns;
        Clk <= '1';
        wait for 5ns;  
        Clk <= '0'; 
                
        des_A0 <= '1';
        des_A1 <= '1';
        des_A2 <= '0';
        wait for 5ns;
        Clk <= '1'; 
        wait for 5ns;
        Clk <= '0';
        
        des_A0 <= '0';
        des_A1 <= '0';
        des_A2 <= '1';
        wait for 5ns;
        Clk <= '1'; 
        wait for 5ns;
        Clk <= '0'; 
        
        des_A0 <= '1';
        des_A1 <= '0';
        des_A2 <= '1';
        wait for 5ns;
        Clk <= '1';
        wait for 5ns;
        Clk <= '0'; 
                
        des_A0 <= '0';
        des_A1 <= '1';
        des_A2 <= '1';
        wait for 5ns;
        Clk <= '1';
        wait for 5ns; 
        Clk <= '0';
      
        des_A0 <= '1';
        des_A1 <= '1';
        des_A2 <= '1';
        wait for 5ns;
        Clk <= '1'; 
        wait for 5ns;
        Clk <= '0';            
        --wait for 10ns;
        
        wait for 10ns; 
        data <= "1010101010101010";
        wait for 5ns; 
        Clk <= '1'; 
        wait for 5ns;
        Clk <= '0'; 
        
        data<= "0000000000000000"; 
        
        des_A0 <= '0';
        des_A1 <= '0';
        des_A2 <= '0';
        wait for 5ns;  
        src_s0 <= '1'; 
        src_s1 <= '1'; 
        src_s2 <= '1';
        wait for 5ns;
        data_src <= '1'; 
        wait for 5ns; 
        Clk <= '1';
        wait for 5ns;
        Clk <= '0';
        
        wait for 20ns; 
    end process; 

end Behavioral;
