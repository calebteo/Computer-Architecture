----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2018 02:29:34 PM
-- Design Name: 
-- Module Name: Mem - Behavioral
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

entity Mem is
--  Port ( );
    Port (
        Data_in : in std_logic_vector (15 downto 0); 
        MW      : in std_logic; 
        Addr_out : in std_logic_vector (15 downto 0);
        Data_out : out std_logic_vector (15 downto 0)
    );
end Mem;

architecture Behavioral of Mem is
    type mem_array is array(0 to 511) of std_logic_vector (15 downto 0); 
begin
    memory_m : process(Addr_out, MW) 
        variable Mem : mem_array := (
            --00 
            X"0000", X"0000", X"0241", X"0482", 
            X"06C3", X"0904", X"0B45", X"0D86", 
            X"0FC7", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --01 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --02 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --03 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --04 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --05 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --06 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --07 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --08 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --09 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --0A 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --0B 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --0C 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --0D 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --0E 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --0F 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --10 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --11 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --12 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --13 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --14 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --15 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --16 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --17 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --18 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --19 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --1A 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --1B 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --1C 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --1D 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --1E 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 

            --1F 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000", 
            X"0000", X"0000", X"0000", X"0000" 

        );
        variable addr : integer;
    begin 
        addr := conv_integer(Addr_out(7 downto 0)); 
        if (MW = '1') then 
            Mem(addr) := Data_in; 
        else 
            Data_out <= Mem(addr); 
        end if; 
    end process; 

end Behavioral;
