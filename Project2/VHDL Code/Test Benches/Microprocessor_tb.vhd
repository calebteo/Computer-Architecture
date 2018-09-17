----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2018 09:40:00 PM
-- Design Name: 
-- Module Name: Microprocessor_tb - Behavioral
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

entity Microprocessor_tb is
--  Port ( );
end Microprocessor_tb;

architecture Behavioral of Microprocessor_tb is

Component Microprocessor 
    Port ( 
        reset : in std_logic;
        Clock_Cycle : in std_logic
    );
end Component;

signal reset, Clock_Cycle : std_logic; 

begin

    uut : Microprocessor Port Map (
        reset => reset,
        Clock_Cycle => Clock_Cycle
    );

    Generate_Clock : process 
    begin
        Clock_Cycle <= '0'; 
        --reset <= '1';
        wait for 5ns; 
        Clock_Cycle <= '1'; 
        wait for 5ns;
    end process;

stim_proc : process
begin
    reset <= '1';
    wait for 10ns; 
    reset <= '0'; 
    wait;
end process;

end Behavioral;
