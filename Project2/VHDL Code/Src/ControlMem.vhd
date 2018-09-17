----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2018 01:56:09 PM
-- Design Name: 
-- Module Name: ControlMem - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ControlMem is
--  Port ( );
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
end ControlMem;

architecture Behavioral of ControlMem is
    type mem_array is array(0 to 255) of std_logic_vector (27 downto 0); 
    
begin
    memory_m : process(IN_CAR) 
        variable control_mem : mem_array := (
            --0 
            X"C020304", --0         --Stores value in Reg 0 = 0;
            X"C020304", --1         --Stores value in Reg 1 = 1; 
            X"C020304", --2         --Stores value in Reg 2 = 2; 
            X"C020304", --3         --Stores value in Reg 3 = 3;          
            X"C020304", --4         --Stores value in Reg 4 = 4; 
            X"C020304", --5         --Stores value in Reg 5 = 5; 
            X"C020304", --6         --Stores value in Reg 6 = 6; 
            X"C020304", --7         --Stores value in Reg 7 = 7; 
            X"C020224", --8         --ADI R[dr] = R[SA] + zf[SB]
            X"C000014", --9         --INC 
            X"C0000E4", --A         --NOT
            X"C000024", --B         --ADD
            X"0D0D00E", --C         --LDR1 R8 = M[R[SA]]
            X"C00000C", --D         --LDR2 R[SB] = R8
            X"0000000", --E
            X"0000000", --F
            
            --1
            X"0000000", --0
            X"0000000", --1
            X"0000000", --2
            X"0000000", --3
            X"0000000", --4
            X"0000000", --5
            X"0000000", --6
            X"0000000", --7
            X"0000000", --8
            X"0000000", --9
            X"0000000", --A
            X"0000000", --B
            X"0000000", --C
            X"0000000", --D
            X"0000000", --E
            X"0000000", --F
            
            --2 
            X"0000000", --0
            X"0000000", --1
            X"0000000", --2
            X"0000000", --3
            X"0000000", --4
            X"0000000", --5
            X"0000000", --6
            X"0000000", --7
            X"0000000", --8
            X"0000000", --9
            X"0000000", --A
            X"0000000", --B
            X"0000000", --C
            X"0000000", --D
            X"0000000", --E
            X"0000000", --F
            
            --3 
            X"0000000", --0
            X"0000000", --1
            X"0000000", --2
            X"0000000", --3
            X"0000000", --4
            X"0000000", --5
            X"0000000", --6
            X"0000000", --7
            X"0000000", --8
            X"0000000", --9
            X"0000000", --A
            X"0000000", --B
            X"0000000", --C
            X"0000000", --D
            X"0000000", --E
            X"0000000", --F
        
            --4 
            X"0000000", --0
            X"0000000", --1
            X"0000000", --2
            X"0000000", --3
            X"0000000", --4
            X"0000000", --5
            X"0000000", --6
            X"0000000", --7
            X"0000000", --8
            X"0000000", --9
            X"0000000", --A
            X"0000000", --B
            X"0000000", --C
            X"0000000", --D
            X"0000000", --E
            X"0000000", --F
            
            --5 
            X"0000000", --0
            X"0000000", --1
            X"0000000", --2
            X"0000000", --3
            X"0000000", --4
            X"0000000", --5
            X"0000000", --6
            X"0000000", --7
            X"0000000", --8
            X"0000000", --9
            X"0000000", --A
            X"0000000", --B
            X"0000000", --C
            X"0000000", --D
            X"0000000", --E
            X"0000000", --F
            
            --6 
            X"0000000", --0
            X"0000000", --1
            X"0000000", --2
            X"0000000", --3
            X"0000000", --4
            X"0000000", --5
            X"0000000", --6
            X"0000000", --7
            X"0000000", --8
            X"0000000", --9
            X"0000000", --A
            X"0000000", --B
            X"0000000", --C
            X"0000000", --D
            X"0000000", --E
            X"0000000", --F
            
            --7 
            X"0000000", --0
            X"0000000", --1
            X"0000000", --2
            X"0000000", --3
            X"0000000", --4
            X"0000000", --5
            X"0000000", --6
            X"0000000", --7
            X"0000000", --8
            X"0000000", --9
            X"0000000", --A
            X"0000000", --B
            X"0000000", --C
            X"0000000", --D
            X"0000000", --E
            X"0000000", --F 
            
            --8 
            X"0000000", --0
            X"0000000", --1
            X"0000000", --2
            X"0000000", --3
            X"0000000", --4
            X"0000000", --5
            X"0000000", --6
            X"0000000", --7
            X"0000000", --8
            X"0000000", --9
            X"0000000", --A
            X"0000000", --B
            X"0000000", --C
            X"0000000", --D
            X"0000000", --E
            X"0000000", --F
            
            --9
            X"0000000", --0
            X"0000000", --1
            X"0000000", --2
            X"0000000", --3
            X"0000000", --4
            X"0000000", --5
            X"0000000", --6
            X"0000000", --7
            X"0000000", --8
            X"0000000", --9
            X"0000000", --A
            X"0000000", --B
            X"0000000", --C
            X"0000000", --D
            X"0000000", --E
            X"0000000", --F
            
            --A 
            X"0000000", --0
            X"0000000", --1
            X"0000000", --2
            X"0000000", --3
            X"0000000", --4
            X"0000000", --5
            X"0000000", --6
            X"0000000", --7
            X"0000000", --8
            X"0000000", --9
            X"0000000", --A
            X"0000000", --B
            X"0000000", --C
            X"0000000", --D
            X"0000000", --E
            X"0000000", --F
            
            --B 
            X"0000000", --0
            X"0000000", --1
            X"0000000", --2
            X"0000000", --3
            X"0000000", --4
            X"0000000", --5
            X"0000000", --6
            X"0000000", --7
            X"0000000", --8
            X"0000000", --9
            X"0000000", --A
            X"0000000", --B
            X"0000000", --C
            X"0000000", --D
            X"0000000", --E
            X"0000000", --F
        
            --C 
            X"C10C002", --0
            X"0030000", --1
            X"0000000", --2
            X"0000000", --3
            X"0000000", --4
            X"0000000", --5
            X"0000000", --6
            X"0000000", --7
            X"0000000", --8
            X"0000000", --9
            X"0000000", --A
            X"0000000", --B
            X"0000000", --C
            X"0000000", --D
            X"0000000", --E
            X"0000000", --F
            
            --D 
            X"0000000", --0
            X"0000000", --1
            X"0000000", --2
            X"0000000", --3
            X"0000000", --4
            X"0000000", --5
            X"0000000", --6
            X"0000000", --7
            X"0000000", --8
            X"0000000", --9
            X"0000000", --A
            X"0000000", --B
            X"0000000", --C
            X"0000000", --D
            X"0000000", --E
            X"0000000", --F
            
            --E 
            X"0000000", --0
            X"0000000", --1
            X"0000000", --2
            X"0000000", --3
            X"0000000", --4
            X"0000000", --5
            X"0000000", --6
            X"0000000", --7
            X"0000000", --8
            X"0000000", --9
            X"0000000", --A
            X"0000000", --B
            X"0000000", --C
            X"0000000", --D
            X"0000000", --E
            X"0000000", --F
            
            --F 
            X"0000000", --0
            X"0000000", --1
            X"0000000", --2
            X"0000000", --3
            X"0000000", --4
            X"0000000", --5
            X"0000000", --6
            X"0000000", --7
            X"0000000", --8
            X"0000000", --9
            X"0000000", --A
            X"0000000", --B
            X"0000000", --C
            X"0000000", --D
            X"0000000", --E
            X"0000000"  --F               
        );

    variable addr : integer;
    variable control_out : std_logic_vector (27 downto 0);
    
    begin
        addr := conv_integer(IN_CAR);
        control_out := control_mem(addr);
        MW <= control_out(0);
        MM <= control_out(1);
        RW <= control_out(2);
        MD <= control_out(3);
        FS <= control_out(8 downto 4);
        MB <= control_out(9);
        TB <= control_out(10);
        TA <= control_out(11);
        TD <= control_out(12);
        PL <= control_out(13);
        PI <= control_out(14);
        IL <= control_out(15);
        MC <= control_out(16);
        MS <= control_out(19 downto 17);
        NA <= control_out(27 downto 20);
        end process; 
end Behavioral;
