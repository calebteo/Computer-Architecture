----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2018 11:03:26 AM
-- Design Name: 
-- Module Name: Decoder3_8 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder3_8 is
--  Port ( );
    port(A0, A1, A2: in std_logic;
    D0, D1, D2, D3, D4, D5, D6, D7: out std_logic);
end Decoder3_8;

architecture Behavioral of Decoder3_8 is

begin
    D0 <= (not A0) and (not A1) and (not A2) after 5ns;
    D1 <= A0 and (not A1) and (not A2) after 5ns; 
    D2 <= (not A0) and A1 and (not A2) after 5ns; 
    D3 <= A0 and A1 and (not A2) after 5ns; 
    D4 <= (not A0) and (not A1) and A2 after 5ns;
    D5 <= A0 and (not A1) and A2 after 5ns; 
    D6 <= (not A0) and A1 and A2 after 5ns;
    D7 <= A0 and A1 and A2 after 5ns; 

end Behavioral;
