----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2018 06:20:06 PM
-- Design Name: 
-- Module Name: InstructionRegister - Behavioral
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

            ---NEED TO UPDATE---

entity InstructionRegister is
--  Port ( );
    Port ( 
        fromM : in std_logic_vector(15 downto 0);
        IL : in std_logic; 
        opCode : out std_logic_vector (6 downto 0); 
        DR     : out std_logic_vector (2 downto 0); 
        SA     : out std_logic_vector (2 downto 0); 
        SB     : out std_logic_vector (2 downto 0)
    
    ); 
end InstructionRegister;

architecture Behavioral of InstructionRegister is
    
begin
    --process (IL) 
    --begin 
    --    if (IL = '1') then 
    --        opCode <= fromM(15 downto 9); 
    --    end if; 
    --end process;
    
    opCode <= fromM(15 downto 9) after 1ns when IL = '1'; 
    DR <= fromM(8 downto 6) after 1ns when IL = '1'; 
    SA <= fromM(5 downto 3) after 1ns when IL = '1'; 
    SB <= fromM(2 downto 0) after 1ns when IL = '1';
    
end Behavioral;
