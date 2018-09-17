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
            Asrc_s0 : in std_logic;
            Asrc_s1 : in std_logic;
            Asrc_s2 : in std_logic; 
            Bsrc_s0 : in std_logic; 
            Bsrc_s1 : in std_logic; 
            Bsrc_s2 : in std_logic; 
            des_A0 : in std_logic;
            des_A1 : in std_logic;
            des_A2 : in std_logic;
            Clk : in std_logic;
            Write : in std_logic;
            data : in std_logic_vector(15 downto 0);
            
            A_out : out std_logic_vector(15 downto 0);
            B_out : out std_logic_vector(15 downto 0)
            );
    END COMPONENT; 
    
    --INPUTS
    signal Asrc_s0 : std_logic;
    signal Asrc_s1 : std_logic;
    signal Asrc_s2 : std_logic;
    signal Bsrc_s0 : std_logic;
    signal Bsrc_s1 : std_logic;
    signal Bsrc_s2 : std_logic;
    signal des_A0 : std_logic;
    signal des_A1 : std_logic; 
    signal des_A2 : std_logic; 
    signal Clk : std_logic;
    signal Write : std_logic;
    signal data : std_logic_vector(15 downto 0) := (others => '0');
    
    --OUTPUTS
    signal A_out : std_logic_vector(15 downto 0) := (others => '0');
    signal B_out : std_logic_vector(15 downto 0) := (others => '0');
    
    Constant Clk_cycle : TIME := 10ns;
     
begin
    uut: RegisterFile PORT MAP (
        Asrc_s0 => Asrc_s0,
        Asrc_s1 => Asrc_s1,
        Asrc_s2 => Asrc_s2,
        Bsrc_s0 => Bsrc_s0,
        Bsrc_s1 => Bsrc_s1,
        Bsrc_s2 => Bsrc_s2,
        des_A0 => des_A0,
        des_A1 => des_A1,
        des_A2 => des_A2,
        Clk => Clk, 
        Write => Write,
        data   => data,
        
        A_out => A_out,
        B_out => B_out
    );
    
    Generate_clock : process
    begin
        Clk <= '0'; 
        wait for (Clk_cycle /2);
        Clk <= '1'; 
        wait for (Clk_cycle/2); 
        
    end process; 
    
    stim_proc: process
    begin 
        data <= "0000000000000000";
        Write <= '1'; 
        des_A0 <= '0';
        des_A1 <= '0';
        des_A2 <= '0'; 
        
        Asrc_s0 <= '0'; 
        Asrc_s1 <= '1';
        Asrc_s2 <= '0';
        Bsrc_s0 <= '1';
        Bsrc_s1 <= '1';
        Bsrc_s2 <= '1';
        
        wait for Clk_cycle;
        data <= "0000000000000001";
        des_A0 <= '1';
        des_A1 <= '0';
        des_A2 <= '0'; 
        
        wait for Clk_cycle;
        data <= "0000000000000010";
        des_A0 <= '0';
        des_A1 <= '1';
        des_A2 <= '0'; 
        
        wait for Clk_cycle; 
        data <= "0000000000000011";
        des_A0 <= '1';
        des_A1 <= '1';
        des_A2 <= '0'; 
        
        wait for Clk_cycle; 
        --Write <= '1'; 
        data <= "0000000000000100"; 
        des_A0 <= '0';
        des_A1 <= '0';
        des_A2 <= '1'; 
        
        wait for Clk_cycle;
        data <= "0000000000000101";
        des_A0 <= '1';
        des_A1 <= '0';
        des_A2 <= '1'; 
        
        wait for Clk_cycle; 
        data <= "0000000000000110";
        des_A0 <= '0';
        des_A1 <= '1';
        des_A2 <= '1'; 
        
        wait for Clk_cycle; 
        data <= "0000000000000111";
        des_A0 <= '1';
        des_A1 <= '1';
        des_A2 <= '1'; 
        
        wait for Clk_cycle; 
        
    end process; 

end Behavioral;
