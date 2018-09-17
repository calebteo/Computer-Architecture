----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2018 11:15:36 AM
-- Design Name: 
-- Module Name: CAR_tb - Behavioral
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

entity CAR_tb is
--  Port ( );
end CAR_tb;

architecture Behavioral of CAR_tb is
    Component CAR 
    Port ( 
        fromMuxC : in std_logic_vector (7 downto 0);
        fromMuxS : in std_logic;
        reset : in std_logic;
        toControlM : out std_logic_vector (7 downto 0)
    );
    end Component;
    
    signal fromMuxC : std_logic_vector(7 downto 0) := (others => '0'); 
    signal fromMuxS : std_logic; 
    signal reset    : std_logic; 
    signal toControlM : std_logic_vector(7 downto 0) := (others => '0');
    
begin
    uut : CAR Port Map (
        fromMuxC => fromMuxC,
        fromMuxS => fromMuxS,
        reset => reset,
        toControlM => toControlM
    );

stim_proc : process 
begin
    fromMuxC <= "00000111"; 
    fromMuxS <= '0';
    
    wait for 2ns; 
    
    fromMuxS <= '1'; 
    wait for 2ns;
    reset <= '1';
    fromMuxS <= '0'; 
    wait for 2ns;
    --reset <= '0'; 
    fromMuxS <= '1'; 
    wait for 2ns;
    
end process;

end Behavioral;
