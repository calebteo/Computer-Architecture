----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2018 06:35:17 PM
-- Design Name: 
-- Module Name: InstructionRegister_tb - Behavioral
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

entity InstructionRegister_tb is
--  Port ( );
end InstructionRegister_tb;

architecture Behavioral of InstructionRegister_tb is
    Component InstructionRegister
    Port ( 
        fromM : in std_logic_vector(15 downto 0);
        IL : in std_logic; 
        opCode : out std_logic_vector (6 downto 0); 
        DR     : out std_logic_vector (2 downto 0); 
        SA     : out std_logic_vector (2 downto 0); 
        SB     : out std_logic_vector (2 downto 0)
    
    ); 
    end Component;

    signal fromM : std_logic_vector(15 downto 0) := (others => '0'); 
    signal IL : std_logic; 
    signal opCode : std_logic_vector(6 downto 0) := (others => '0');
    signal DR : std_logic_vector (2 downto 0) := (others => '0'); 
    signal SA : std_logic_vector (2 downto 0) := (others => '0');  
    signal SB : std_logic_vector (2 downto 0) := (others => '0'); 

begin
    uut : InstructionRegister Port Map (
        fromM => fromM,
        IL => IL,
        opCode => opCode,
        DR => DR,
        SA => SA,
        SB => SB
    );

stim_proc : process
begin
    fromM <= "1111111000000000"; 
    IL <= '0';
    
    wait for 5ns; 
    fromM <= "0000000000000001"; 
    wait for 5ns;
    IL <= '1';
    wait for 5ns; 
    fromM <= "1111111111111111";
    
    wait for 5ns;
end process;

end Behavioral;
