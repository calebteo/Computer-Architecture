----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2018 10:38:27 AM
-- Design Name: 
-- Module Name: rippleAdder - Behavioral
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

entity rippleAdder is
--  Port ( );
    Port(
        x : in std_logic_vector(15 downto 0);
        y : in std_logic_vector(15 downto 0); 
        c0 : in std_logic; 
        S : out std_logic_vector(15 downto 0); 
        Cout : out std_logic;
        C_1out : out std_logic);
        
end rippleAdder;

architecture Behavioral of rippleAdder is

    Component fullAdder is
    Port (In1, In2, c_in:in std_ulogic;
        sum, c_out:out std_ulogic );
    end Component;
    
    signal tmp : std_logic_vector (15 downto 0) := (others => '0'); 
    signal c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15 : std_logic; 
    --constant gate_delay: Time := 1 ns;
begin
    fullAdder00: fullAdder Port Map (
        In1 => x(0),
        In2 => y(0),
        c_in => c0,
        sum => tmp(0),
        c_out => c1 
    ); 
    fullAdder01: fullAdder Port Map (
        In1 => x(1),
        In2 => y(1),
        c_in => c1,
        sum => tmp(1),
        c_out => c2 
    );
    fullAdder02: fullAdder Port Map (
        In1 => x(2),
        In2 => y(2),
        c_in => c2,
        sum => tmp(2),
        c_out => c3 
    ); 
    fullAdder03: fullAdder Port Map (
        In1 => x(3),
        In2 => y(3),
        c_in => c3,
        sum => tmp(3),
        c_out => c4 
    );
        
    fullAdder04: fullAdder Port Map (
         In1 => x(4),
         In2 => y(4),
         c_in => c4,
         sum => tmp(4),
         c_out => c5 
     );
     fullAdder05: fullAdder Port Map (
         In1 => x(5),
         In2 => y(5),
         c_in => c5,
         sum => tmp(5),
         c_out => c6
     );
     fullAdder06: fullAdder Port Map (
         In1 => x(6),
         In2 => y(6),
         c_in => c6,
         sum => tmp(6),
         c_out => c7 
     );
     fullAdder07: fullAdder Port Map (
         In1 => x(7),
         In2 => y(7),
         c_in => c7,
         sum => tmp(7),
         c_out => c8 
     );
    fullAdder08: fullAdder Port Map (
         In1 => x(8),
         In2 => y(8),
         c_in => c8,
         sum => tmp(8),
         c_out => c9 
     ); 
     fullAdder09: fullAdder Port Map (
         In1 => x(9),
         In2 => y(9),
         c_in => c9,
         sum => tmp(9),
         c_out => c10 
     );
     fullAdder10: fullAdder Port Map (
         In1 => x(10),
         In2 => y(10),
         c_in => c10,
         sum => tmp(10),
         c_out => c11 
     ); 
     fullAdder11: fullAdder Port Map (
         In1 => x(11),
         In2 => y(11),
         c_in => c11,
         sum => tmp(11),
         c_out => c12 
     );
         
     fullAdder12: fullAdder Port Map (
          In1 => x(12),
          In2 => y(12),
          c_in => c12,
          sum => tmp(12),
          c_out => c13 
      );
      fullAdder13: fullAdder Port Map (
          In1 => x(13),
          In2 => y(13),
          c_in => c13,
          sum => tmp(13),
          c_out => c14
      );
      fullAdder14: fullAdder Port Map (
          In1 => x(14),
          In2 => y(14),
          c_in => c14,
          sum => tmp(14),
          c_out => c15 
      );
      fullAdder15: fullAdder Port Map (
          In1 => x(15),
          In2 => y(15),
          c_in => c15,
          sum => tmp(15),
          c_out => Cout 
      );    
      C_1out <= c15; 
      S <= tmp; 

end Behavioral;
