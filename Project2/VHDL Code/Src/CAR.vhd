----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2018 10:56:34 AM
-- Design Name: 
-- Module Name: CAR - Behavioral
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

entity CAR is
--  Port ( );
    Port ( 
        fromMuxC : in std_logic_vector (7 downto 0);
        fromMuxS : in std_logic;
        reset : in std_logic;  
        toControlM : out std_logic_vector (7 downto 0)
    );
end CAR;

architecture Behavioral of CAR is
    
    signal reset_value : std_logic_vector (7 downto 0) := (others => '0');
    
begin
    reset_value <= "11000000"; 
    process(reset,fromMuxS) 
        variable curr_CAR : std_logic_vector (7 downto 0); 
        variable curr_CAR_int : integer; 
        
    begin
        if (reset = '1') then curr_CAR := reset_value;
        elsif (fromMuxS = '1') then
            curr_CAR := fromMuxC;
        elsif (fromMuxS = '0') then 
            curr_CAR_int := conv_integer(curr_CAR); 
            curr_CAR_int := curr_CAR_int + 1; 
            curr_CAR := conv_std_logic_vector(curr_CAR_int, 8); 
            
        end if; 
        toControlM <= curr_CAR after 1ns; 
    end process;

end Behavioral;
