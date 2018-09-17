----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2018 11:45:35 AM
-- Design Name: 
-- Module Name: RegisterFile - Behavioral
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

entity RegisterFile is
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
        TA : in std_logic; 
        TB : in std_logic; 
        TD : in std_logic; 
        Clk : in std_logic;
        Write : in std_logic;
        data : in std_logic_vector(15 downto 0);
        
        A_out : out std_logic_vector(15 downto 0);
        B_out : out std_logic_vector(15 downto 0)
        );
                
end RegisterFile;

architecture Behavioral of RegisterFile is
    COMPONENT reg16
    PORT(
        D : IN std_logic_vector(15 downto 0);
        load : IN std_logic;
        Clk : IN std_logic;
        Q : OUT std_logic_vector(15 downto 0)
    );
    END COMPONENT;
    
    COMPONENT Decoder3_8
    PORT(
        A0 : IN std_logic;
        A1 : IN std_logic;
        A2 : IN std_logic;
        TA : IN std_logic; 
        D0 : OUT std_logic;
        D1 : OUT std_logic;
        D2 : OUT std_logic;
        D3 : OUT std_logic;
        D4 : OUT std_logic;
        D5 : OUT std_logic;
        D6 : OUT std_logic;
        D7 : OUT std_logic;
        D8 : OUT std_logic
    );
    END COMPONENT;
    
    COMPONENT Mux3_8
    PORT(
        In0 : IN std_logic_vector(15 downto 0);
        In1 : IN std_logic_vector(15 downto 0);
        s : IN std_logic;
        Z : OUT std_logic_vector(15 downto 0)
    );
    END COMPONENT;

    COMPONENT Mux8_8
    PORT(
        In0 : IN std_logic_vector(15 downto 0);
        In1 : IN std_logic_vector(15 downto 0);
        In2 : IN std_logic_vector(15 downto 0);
        In3 : IN std_logic_vector(15 downto 0);
        In4 : IN std_logic_vector(15 downto 0);
        In5 : IN std_logic_vector(15 downto 0);
        In6 : IN std_logic_vector(15 downto 0);
        In7 : IN std_logic_vector(15 downto 0);
        In8 : IN std_logic_vector(15 downto 0); 
        S0 : IN std_logic;
        S1 : IN std_logic;
        S2 : IN std_logic;
        ST : IN std_logic;  
        Z : OUT std_logic_vector(15 downto 0)
    );
    END COMPONENT;
    
    signal load_reg0, load_reg1, load_reg2, load_reg3,
           load_reg4, load_reg5, load_reg6, load_reg7, load_reg8 : std_logic;
    signal dec_reg0, dec_reg1, dec_reg2, dec_reg3,
           dec_reg4, dec_reg5, dec_reg6, dec_reg7, dec_reg8 : std_logic;
    signal reg0_q, reg1_q, reg2_q, reg3_q,
           reg4_q, reg5_q, reg6_q, reg7_q, reg8_q,
           data_src_mux_out, src_reg : std_logic_vector(15 downto 0);
    
    begin
    reg00: reg16 PORT MAP(
        D => data,
        load => load_reg0,
        Clk => Clk,
        Q => reg0_q
    );
    reg01: reg16 PORT MAP(
        D => data,
        load => load_reg1,
        Clk => Clk,
        Q => reg1_q
    );
    reg02: reg16 PORT MAP(
        D => data,
        load => load_reg2,
        Clk => Clk,
        Q => reg2_q
    );
    reg03: reg16 PORT MAP(
        D => data,
        load => load_reg3,
        Clk => Clk,
        Q => reg3_q
    );
    reg04: reg16 PORT MAP(
        D => data,
        load => load_reg4,
        Clk => Clk,
        Q => reg4_q
    );
    reg05: reg16 PORT MAP(
        D => data,
        load => load_reg5,
        Clk => Clk,
        Q => reg5_q
    );
    reg06: reg16 PORT MAP(
        D => data,
        load => load_reg6,
        Clk => Clk,
        Q => reg6_q
    );
    reg07: reg16 PORT MAP(
        D => data,
        load => load_reg7,
        Clk => Clk,
        Q => reg7_q
    );
    reg08: reg16 PORT MAP(
        D => data,
        load => load_reg8,
        Clk => Clk,
        Q => reg8_q
    );
    
    des_Decoder3_8: Decoder3_8 PORT MAP(
        A0 => des_A0,
        A1 => des_A1,
        A2 => des_A2,
        TA => TD,
        D0 => dec_reg0,
        D1 => dec_reg1,
        D2 => dec_reg2,
        D3 => dec_reg3,
        D4 => dec_reg4,
        D5 => dec_reg5,
        D6 => dec_reg6,
        D7 => dec_reg7,
        D8 => dec_reg8
    );
    --data_src_Mux3_8: Mux3_8 PORT MAP(
    --    In0 => data,
    --    In1 => src_reg,
    --    s => data_src,
    --    Z => data_src_mux_out
    --);
    
    Inst_Mux8_8A: Mux8_8 PORT MAP(
        In0 => reg0_q,
        In1 => reg1_q,
        In2 => reg2_q,
        In3 => reg3_q,
        In4 => reg4_q,
        In5 => reg5_q,
        In6 => reg6_q,
        In7 => reg7_q,
        In8 => reg8_q,
        S0 => Asrc_s0,
        S1 => Asrc_s1,
        S2 => Asrc_s2,
        ST => TA,
        Z => A_out
    );
    
    Inst_Mux8_8B: Mux8_8 PORT MAP(
        In0 => reg0_q,
        In1 => reg1_q,
        In2 => reg2_q,
        In3 => reg3_q,
        In4 => reg4_q,
        In5 => reg5_q,
        In6 => reg6_q,
        In7 => reg7_q,
        In8 => reg8_q,
        S0 => Bsrc_s0,
        S1 => Bsrc_s1,
        S2 => Bsrc_s2,
        ST => TB,
        Z => B_out
    );
    
    load_reg0 <= '1' when dec_reg0 = '1' and Write = '1' else '0';
    load_reg1 <= '1' when dec_reg1 = '1' and Write = '1' else '0';
    load_reg2 <= '1' when dec_reg2 = '1' and Write = '1' else '0';
    load_reg3 <= '1' when dec_reg3 = '1' and Write = '1' else '0';
    load_reg4 <= '1' when dec_reg4 = '1' and Write = '1' else '0';
    load_reg5 <= '1' when dec_reg5 = '1' and Write = '1' else '0';
    load_reg6 <= '1' when dec_reg6 = '1' and Write = '1' else '0';
    load_reg7 <= '1' when dec_reg7 = '1' and Write = '1' else '0';
    load_reg8 <= '1' when dec_reg8 = '1' and Write = '1' else '0'; -- Not sure if this is right, due to R8 being a temp reg... 


end Behavioral;
