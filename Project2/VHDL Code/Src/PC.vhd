----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2018 12:51:59 PM
-- Design Name: 
-- Module Name: PC - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
--  Port ( );
    Port ( 
        fromIR : in std_logic_vector (15 downto 0); 
        PL : in std_logic; 
        PI : in std_logic; 
        reset : in std_logic; 
        toMem : out std_logic_vector (15 downto 0)
    );  
end PC;

architecture Behavioral of PC is
    
begin
    process ( reset, PL, PI)
        variable curr_PC : std_logic_vector(15 downto 0);
        variable curr_PC_int : integer;
        variable temp_inc_PC : STD_LOGIC_VECTOR(15 downto 0);
                
    begin
        if (reset = '1') then curr_PC := "0000000000000000"; 
        elsif ( PL = '1' ) then curr_PC := curr_PC + fromIR; 
        elsif (PI = '1') then 
                curr_PC_int := conv_integer(curr_PC); 
                curr_PC_int := curr_PC_int + 1; 
                curr_PC := conv_std_logic_vector(curr_PC_int, 16);
        end if;
    toMem <= curr_PC after 1ns; 
    end process;
      
end Behavioral;
