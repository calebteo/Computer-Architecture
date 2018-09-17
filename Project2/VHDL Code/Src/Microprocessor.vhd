----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2018 08:39:56 PM
-- Design Name: 
-- Module Name: Microprocessor - Behavioral
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

entity Microprocessor is
--  Port ( );
    Port ( 
        reset : in std_logic;
        Clock_Cycle : in std_logic
    );
end Microprocessor;

architecture Behavioral of Microprocessor is

Component datapath is
    Port( 
    controlW : in std_logic_vector (16 downto 0); 
    constantIn : in std_logic_vector (15 downto 0); 
    dataIn : in std_logic_vector (15 downto 0); 
    clock : in std_logic; 
    TA_fromCont : in std_logic; 
    TB_fromCont : in std_logic; 
    TD_fromCont : in std_logic; 
    addrOut : out std_logic_vector (15 downto 0); 
    dataOut : out std_logic_vector (15 downto 0);
    CondFlags : out std_logic_vector (3 downto 0)
    );
end Component; 

Component Mem is 
    Port (
    Data_in : in std_logic_vector (15 downto 0); 
    MW      : in std_logic; 
    Addr_out : in std_logic_vector (15 downto 0);
    Data_out : out std_logic_vector (15 downto 0)
    );
end Component;

Component MicroprogrammedControl is
--  Port ( );
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

Component ZeroFill is 
    Port (
    TB_SB : in std_logic_vector (2 downto 0); 
    Zeroed : out std_logic_vector (15 downto 0)
    );

end Component;

Component Mux2_1 
     Port( 
        s0_Vector  : in std_logic_vector (15 downto 0); 
        s1_Vector  : in std_logic_vector (15 downto 0);
        s          : in std_logic; 
        out_Vector : out std_logic_vector (15 downto 0) 
   );
end Component;

signal temp_ZeroFillOut,
       toDataPath,
       MemOut,
       toMux_0,
       toDataIn,
       toDataAddr, 
       temp_PC_out : std_logic_vector (15 downto 0) := (others => '0');

signal temp_TA_SA,
       temp_TB_SB,
       temp_TD_DR,
       temp_CondFlag : std_logic_vector (3 downto 0) := (others => '0');
       
signal temp_RW,
       temp_MM,
       temp_MD,
       temp_MB,
       temp_MW : std_logic; 

signal temp_FS : std_logic_vector (4 downto 0) := (others => '0'); 

begin

    ZeroFill00 : ZeroFill Port Map (
        TB_SB => temp_TB_SB (2 downto 0),
        Zeroed => toDataPath
    );
    
    MuxM : Mux2_1 Port Map (
        s0_Vector => toMux_0,
        s1_Vector => temp_PC_out,
        s => temp_MM,
        out_Vector => toDataAddr 
    ); 

    dataPath00 : dataPath Port Map (
        controlW(0) => temp_RW,
        controlW(1) => temp_MD, 
        controlW(6 downto 2) => temp_FS,
        controlW(7) => temp_MB,
        controlW(10 downto 8) => temp_TA_SA(2 downto 0), 
        controlW(13 downto 11) => temp_TB_SB(2 downto 0), 
        controlW(16 downto 14) => temp_TD_DR(2 downto 0), 
        TA_fromCont => temp_TA_SA(3),
        TB_fromCont => temp_TB_SB(3),
        TD_fromCont => temp_TD_DR(3),
        constantIn => toDataPath,
        dataIn => MemOut,
        clock => Clock_cycle,
        addrOut => toMux_0,
        dataOut => toDataIn,
        CondFlags => temp_CondFlag
    );
    
    Mem00 : Mem Port Map (
        Data_in => toDataIn,
        MW => temp_MW,
        Addr_out => toDataAddr,
        Data_out => MemOut
    );
    
    MicroprogrammedControl00 : MicroprogrammedControl Port Map (
       V => temp_CondFlag(3),
       C => temp_CondFlag(2),
       N => temp_CondFlag(1),
       Z => temp_CondFlag(0),
       DataMem => MemOut,
       reset => reset,
       PC_out => temp_PC_out,
       TD_DR => temp_TD_DR,
       TA_SA => temp_TA_SA,
       TB_SB => temp_TB_SB,
       MB => temp_MB,
       FS => temp_FS,
       MD => temp_MD,
       RW => temp_RW,
       MM => temp_MM,
       MW => temp_MW
    );

end Behavioral;
