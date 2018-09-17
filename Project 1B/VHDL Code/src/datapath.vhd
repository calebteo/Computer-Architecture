----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2018 06:03:31 PM
-- Design Name: 
-- Module Name: datapath - Behavioral
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

entity datapath is
--  Port ( );
    Port( 
        controlW : in std_logic_vector (16 downto 0); 
        constantIn : in std_logic_vector (15 downto 0); 
        dataIn : in std_logic_vector (15 downto 0); 
        clock : in std_logic; 
        addrOut : out std_logic_vector (15 downto 0); 
        dataOut : out std_logic_vector (15 downto 0) 
        
    );
end datapath;


architecture Behavioral of datapath is

Component RegisterFile is
--  Port ( );
    Port ( 
        Asrc_s0 : in std_logic;
        Asrc_s1 : in std_logic;
        Asrc_s2 : in std_logic; 
        Bsrc_s0 : in std_logic; 
        Bsrc_s1 : in std_logic; 
        Bsrc_s2 : in std_logic; 
        des_A0 : in std_logic;
        des_A1 : in std_logic;
        des_A2 : in std_logic;
        Clk : in std_logic;
        Write : in std_logic;
        data : in std_logic_vector(15 downto 0);
        
        A_out : out std_logic_vector(15 downto 0);
        B_out : out std_logic_vector(15 downto 0)
        );
                
end Component;

Component FunctionUnit is
--  Port ( );
    Port( 
        A : in std_logic_vector (15 downto 0); 
        B : in std_logic_vector (15 downto 0); 
        FS : in std_logic_vector (4 downto 0);
        V : out std_logic; 
        C : out std_logic; 
        N : out std_logic; 
        Z : out std_logic; 
        output : out std_logic_vector (15 downto 0) 
    ); 
end Component;

Component Mux2_1 is
--  Port ( );
    Port( 
         s0_Vector  : in std_logic_vector (15 downto 0); 
         s1_Vector  : in std_logic_vector (15 downto 0);
         s          : in std_logic; 
         out_Vector : out std_logic_vector (15 downto 0) 
    );
end Component;


    signal funcData : std_logic_vector (15 downto 0) := (others => '0');
    signal RegA_out : std_logic_vector (15 downto 0) := (others => '0'); 
    signal RegB_out : std_logic_vector (15 downto 0) := (others => '0'); 
    signal funcBIn : std_logic_vector (15 downto 0) := (others => '0'); 
    signal funcOut : std_logic_vector (15 downto 0) := (others => '0'); 

begin
    RegisterFile00 : RegisterFile Port Map (
        Asrc_s0 => controlW(11),
        Asrc_s1 => controlW(12),
        Asrc_s2 => controlW(13),
        Bsrc_s0 => controlW(8),
        Bsrc_s1 => controlW(9),
        Bsrc_s2 => controlW(10),
        des_A0 => controlW(14),
        des_A1 => controlW(15),
        des_A2 => controlW(16),
        Clk => clock, 
        Write => controlW(0), 
        data => funcData,
        A_out => RegA_out,
        B_out => RegB_out
    ); 
    
    Mux2_100: Mux2_1 Port Map (
        s0_Vector => RegB_out,
        s1_Vector => constantIn,
        s => controlW(7),
        out_Vector => funcBIn
    );
    
    FunctionUnit00 : FunctionUnit Port Map (
        A => RegA_out,
        B => funcBin,
        FS => controlW(6 downto 2), 
        output => funcOut
    ); 

    Mux2_101: Mux2_1 Port Map (
        s0_Vector => funcOut,
        s1_Vector => dataIn,
        s => controlW(1),
        out_Vector => funcData
    );

    dataOut <= funcBIn; 
    addrOut <= RegA_out; 
    
end Behavioral;
