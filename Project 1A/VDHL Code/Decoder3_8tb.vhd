----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2018 03:21:18 PM
-- Design Name: 
-- Module Name: Decoder3_8tb - Behavioral
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

entity Decoder3_8tb is
--  Port ( );
end Decoder3_8tb;

architecture Behavioral of Decoder3_8tb is

    Component Decoder3_8
    port(A0, A1, A2: in std_logic;
        D0, D1, D2, D3, D4, D5, D6, D7: out std_logic
        );
    end Component;

    signal A0 : std_logic; 
    signal A1 : std_logic;
    signal A2 : std_logic; 
    signal D0 : std_logic; 
    signal D1 : std_logic; 
    signal D2 : std_logic; 
    signal D3 : std_logic; 
    signal D4 : std_logic; 
    signal D5 : std_logic; 
    signal D6 : std_logic; 
    signal D7 : std_logic; 
    
begin
    uut: Decoder3_8 PORT MAP (
        A0 => A0,
        A1 => A1,
        A2 => A2, 
        D0 => D0,
        D1 => D1,
        D2 => D2,
        D3 => D3, 
        D4 => D4,
        D5 => D5,
        D6 => D6,
        D7 => D7
    );

stim_proc : process 
begin
    A0 <= '0';
    A1 <= '0'; 
    A2 <= '0'; 
    
    wait for 10ns; 
    
    A0 <= '1';
    A1 <= '0'; 
    A2 <= '0'; 
    
    wait for 10ns; 
    
    A0 <= '0';
    A1 <= '1'; 
    A2 <= '0'; 
    
    wait for 10ns; 
    
    A0 <= '1';
    A1 <= '1'; 
    A2 <= '0'; 
    
    wait for 10ns; 
    
    A0 <= '0';
    A1 <= '0'; 
    A2 <= '1'; 
    
    wait for 10ns; 
    
    A0 <= '1';
    A1 <= '0'; 
    A2 <= '1'; 
    
    wait for 10ns; 
    
    A0 <= '0';
    A1 <= '1'; 
    A2 <= '1'; 
    
    wait for 10ns; 
    
    A0 <= '1';
    A1 <= '1'; 
    A2 <= '1'; 
    
    wait for 10ns;
end process;

end Behavioral;
