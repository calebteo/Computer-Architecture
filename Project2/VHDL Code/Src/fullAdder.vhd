----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2018 10:33:53 AM
-- Design Name: 
-- Module Name: fullAdder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fullAdder is
--  Port ( );
    Port (In1, In2, c_in:in std_ulogic;
    sum, c_out:out std_ulogic );
end fullAdder;

architecture Behavioral of fullAdder is
signal s1,s2,s3: std_ulogic;
constant gate_delay: Time := 1 ns;

begin
    s1 <= (In1 xor In2) after gate_delay;
    s2 <= (c_in and s1) after gate_delay;
    s3 <= (In1 and In2) after gate_delay;
    sum <= (s1 xor c_in) after gate_delay;
    c_out <= (s2 or s3) after gate_delay;

end Behavioral;
