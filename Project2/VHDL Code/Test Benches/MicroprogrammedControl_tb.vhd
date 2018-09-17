----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2018 07:31:58 PM
-- Design Name: 
-- Module Name: MicroprogrammedControl_tb - Behavioral
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

entity MicroprogrammedControl_tb is
--  Port ( );
end MicroprogrammedControl_tb;

architecture Behavioral of MicroprogrammedControl_tb is

Component MicroprogrammedControl 
    Port (
    V     : in std_logic; 
    C     : in std_logic; 
    N     : in std_logic; 
    Z     : in std_logic; 
    DataMem : in std_logic_vector (15 downto 0); 
    reset : in std_logic; 
    
    PC_out : out std_logic_vector (15 downto 0); 
    TD_DR : out std_logic_vector (3 downto 0);
    TA_SA : out std_logic_vector (3 downto 0); 
    TB_SB : out std_logic_vector (3 downto 0); 
    MB    : out std_logic; 
    FS    : out std_logic_vector (4 downto 0); 
    MD    : out std_logic; 
    RW    : out std_logic; 
    MM    : out std_logic; 
    MW    : out std_logic
    );
end Component;

signal V, C, N, Z, reset, MB, MD, RW, MM, MW : std_logic; 
signal DataMem, PC_out : std_logic_vector ( 15 downto 0 ) := (others => '0'); 
signal TD_DR, TA_SA, TB_SB : std_logic_vector (3 downto 0 ) := (others => '0'); 
signal FS : std_logic_vector ( 4 downto 0 ) := (others => '0'); 

begin
    uut : MicroprogrammedControl Port Map (
        V => V, 
        C => C, 
        N => N,
        Z => Z, 
        DataMem => DataMem, 
        reset => reset,
        PC_out => PC_out, 
        TD_DR => TD_DR, 
        TA_SA => TA_SA,
        TB_SB => TB_SB,
        MB => MB,
        FS => FS,
        MD => MD, 
        RW => RW,
        MM => MM, 
        MW => MW
    ); 
    
    Generate_clock : process
    begin
        reset <= '0'; 
        wait for 100ns;
        reset <= '1';
        wait for 10ns;
    end process;

stim_process : process
begin
    DataMem <= X"0000";
    wait for 20ns;
    wait;
    --DataMem <= 
    
end process;    

end Behavioral;
