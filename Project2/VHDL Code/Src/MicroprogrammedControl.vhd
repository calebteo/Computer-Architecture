----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2018 03:34:35 PM
-- Design Name: 
-- Module Name: MicroprogrammedControl - Behavioral
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

entity MicroprogrammedControl is
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
end MicroprogrammedControl;

architecture Behavioral of MicroprogrammedControl is
    Component Extender  
    Port (
        Dr_Sb : in std_logic_vector (5 downto 0); 
        toPC : out std_logic_vector (15 downto 0)
    );
    end Component;
    
    Component PC 
    Port ( 
        fromIR : in std_logic_vector (15 downto 0); 
        PL : in std_logic; 
        PI : in std_logic; 
        reset : in std_logic; 
        toMem : out std_logic_vector (15 downto 0)
    );  
    end Component;
    
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
    
    Component MuxC
    Port(
         IR  : in std_logic_vector (7 downto 0); 
         NA : in std_logic_vector (7 downto 0);
         MC          : in std_logic; 
         toCar : out std_logic_vector (7 downto 0)
    );
    end Component;
    
    Component MuxS 
    Port ( 
        N : in std_logic; 
        Z : in std_logic; 
        V : in std_logic; 
        C : in std_logic;
        MS : in std_logic_vector(2 downto 0); 
        
        toCar : out std_logic
    );
    end Component;
    
    Component CAR 
    Port ( 
        fromMuxC : in std_logic_vector (7 downto 0);
        fromMuxS : in std_logic;
        reset : in std_logic;  
        toControlM : out std_logic_vector (7 downto 0)
    );
    end Component;
    
    Component ControlMem
    Port (
        MW : out std_logic;
        MM : out std_logic;
        RW : out std_logic;
        MD : out std_logic;
        FS : out std_logic_vector(4 downto 0);
        MB : out std_logic;
        TB : out std_logic;
        TA : out std_logic;
        TD : out std_logic;
        PL : out std_logic;
        PI : out std_logic;
        IL : out std_logic;
        MC : out std_logic;
        MS : out std_logic_vector(2 downto 0);
        NA : out std_logic_vector(7 downto 0);
        IN_CAR : in std_logic_vector(7 downto 0)
    );
    end Component;
    
    signal temp_Dr, 
           temp_Sa, 
           temp_Sb,
           temp_MS : std_logic_vector (2 downto 0) := (others => '0'); 
           
    signal temp_toPC : std_logic_vector (15 downto 0) := (others => '0');
    
    signal temp_PI,
           temp_PL,
           temp_IL,
           temp_MC,
           selCar : std_logic; 
           
    signal temp_opcode,
           temp_NA,
           MUXC_out,
           CAR_out : std_logic_vector(7 downto 0) := (others => '0'); 
   
begin

    Extender00 : Extender Port Map (
        Dr_Sb(5 downto 3) => temp_Dr,
        Dr_Sb(2 downto 0) => temp_Sb,
        toPC => temp_toPC
    ); 
    
    PC0 : PC Port Map (
        fromIR => temp_toPC, 
        PI => temp_PI, 
        PL => temp_PL,
        reset => reset,
        toMem => PC_out
    );

    InstructionRegister00 : InstructionRegister Port Map (
        fromM => DataMem, 
        IL => temp_IL,
        opcode => temp_opcode (6 downto 0),
        DR => temp_Dr,
        SA => temp_Sa,
        SB => temp_Sb
    ); 
    
    MuxC00 : MuxC Port Map (
        IR => temp_opcode,
        NA => temp_NA,
        MC => temp_MC,
        toCar => MUXC_out
    );
    
    MuxS00 : MuxS Port Map (
        N => N,
        Z => Z,
        V => V,
        C => C,
        MS => temp_MS,
        toCar => selCar
    );

    CAR00 : CAR Port Map (
        fromMuxC => MUXC_out,
        fromMuxS => selCar,
        reset => reset,
        toControlM => CAR_out
    ); 

    ControlMem00 : ControlMem Port Map (
        MW => MW, 
        MM => MM, 
        RW => RW, 
        MD => MD, 
        FS => FS, 
        MB => MB,
        TB => TB_SB(3),
        TA => TA_SA(3),
        TD => TD_DR(3),
        PL => temp_PL,
        PI => temp_PI,
        IL => temp_IL,
        MC => temp_MC,
        MS => temp_MS,
        NA => temp_NA,
        IN_CAR => CAR_out
    );
    
    temp_opcode(7) <= '0'; 
    TD_DR (2 downto 0) <= temp_Dr;
    TA_SA (2 downto 0) <= temp_Sa; 
    TB_SB (2 downto 0) <= temp_Sb; 

end Behavioral;
