----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2023 11:49:29
-- Design Name: 
-- Module Name: ALEA_DET - Behavioral
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

entity ALEA_DET is
    Port ( 
           OP_LIDI : in STD_LOGIC_VECTOR (7 downto 0);
           OP_DIEX : in STD_LOGIC_VECTOR (7 downto 0);
           OP_EXMEM: in STD_LOGIC_VECTOR (7 downto 0);
           OP_MEMRE: in STD_LOGIC_VECTOR (7 downto 0);
           A_DIEX : in STD_LOGIC_VECTOR (7 downto 0);
           A_EXMEM : in STD_LOGIC_VECTOR (7 downto 0);
           A_MEMRE : in STD_LOGIC_VECTOR (7 downto 0);
           
           B_DIEX : in STD_LOGIC_VECTOR (7 downto 0);
           B_EXMEM : in STD_LOGIC_VECTOR (7 downto 0);
           B_MEMRE : in STD_LOGIC_VECTOR (7 downto 0);
           
           B_LIDI : in STD_LOGIC_VECTOR (7 downto 0);
           C_LIDI : in STD_LOGIC_VECTOR (7 downto 0);
           alea : out STD_LOGIC;
           OP_out : out STD_LOGIC_VECTOR (7 downto 0));
end ALEA_DET;

architecture Behavioral of ALEA_DET is
signal err : STD_LOGIC := '0';
signal C_USED : STD_LOGIC; 
signal LIDI_R, DIEX_W, EXMEM_W, MEMRE_W: STD_LOGIC; 
signal BRANCH_LIDI, BRANCH_DIEX, BRANCH_EXMEM, BRANCH_MEMRE : STD_LOGIC; 
begin
    -- COP STR ADD SUB MUL DIV AND OR XOR NOT RET 
    LIDI_R <= '1' when (OP_LIDI = x"02" or 
                        OP_LIDI = x"13" or 
                        OP_LIDI = x"03" or 
                        OP_LIDI = x"04" or 
                        OP_LIDI = x"05" or 
                        OP_LIDI = x"06" or 
                        OP_LIDI = x"07" or 
                        OP_LIDI = x"15" or
                        OP_LIDI = x"16" or 
                        OP_LIDI = x"17" or 
                        OP_LIDI = x"18" or 
                        OP_LIDI = x"19" or 
                        OP_LIDI = x"10") else '0';
                        
    -- COP STR ADD SUB MUL DIV AND OR XOR NOT        
    DIEX_W <= '1' when (OP_DIEX = x"01" or 
                        OP_DIEX = x"02" or
                        OP_DIEX = x"14" or
                        OP_DIEX = x"03" or
                        OP_DIEX = x"04" or
                        OP_DIEX = x"05" or
                        OP_DIEX = x"06" or
                        OP_DIEX = x"16" or 
                        OP_DIEX = x"17" or 
                        OP_DIEX = x"18" or 
                        OP_DIEX = x"19") else '0';
                        
    EXMEM_W <= '1' when (OP_EXMEM = x"01" or 
                         OP_EXMEM = x"02" or
                         OP_EXMEM = x"14" or
                         OP_EXMEM = x"03" or
                         OP_EXMEM = x"04" or
                         OP_EXMEM = x"05" or
                         OP_EXMEM = x"06" or 
                         OP_EXMEM = x"16" or 
                         OP_EXMEM = x"17" or 
                         OP_EXMEM = x"18" or 
                         OP_EXMEM = x"19") else '0';
                         
    MEMRE_W <= '1' when (OP_MEMRE = x"01" or 
                         OP_MEMRE = x"02" or 
                         OP_MEMRE = x"14" or 
                         OP_MEMRE = x"03" or 
                         OP_MEMRE = x"04" or 
                         OP_MEMRE = x"05" or 
                         OP_MEMRE = x"06" or 
                         OP_MEMRE = x"16" or 
                         OP_MEMRE = x"17" or 
                         OP_MEMRE = x"18" or 
                         OP_MEMRE = x"19") else '0';
                         
    BRANCH_DIEX <= '1' when (OP_DIEX = x"08" or
                             OP_DIEX = x"09" or
                             OP_DIEX = x"0a" or
                             OP_DIEX = x"0b" or
                             OP_DIEX = x"0c" or
                             OP_DIEX = x"0d" or
                             OP_DIEX = x"0e") else '0'; 
    
    C_USED <= '1' when (OP_LIDI = x"03" or 
                        OP_LIDI = x"04" or 
                        OP_LIDI = x"05" or 
                        OP_LIDI = x"06" or 
                        OP_LIDI = x"07" or 
                        OP_LIDI = x"16" or 
                        OP_LIDI = x"17" or 
                        OP_LIDI = x"19") else '0'; 
    
    err <= '1' when ((LIDI_R = '1' and DIEX_W = '1' and (B_LIDI = A_DIEX or ((C_LIDI = A_DIEX) and C_USED='1'))) or 
                     (LIDI_R = '1' and EXMEM_W = '1' and (B_LIDI = A_EXMEM or ((C_LIDI = A_EXMEM) and C_USED='1'))) or
                     (LIDI_R = '1' and MEMRE_W = '1' and (B_LIDI = A_MEMRE or ((C_LIDI = A_MEMRE) and C_USED='1'))) or 
                     --ONLY FOR LDR
                     (LIDI_R = '1' and OP_DIEX = x"14" and (B_LIDI = B_DIEX or ((C_LIDI = B_DIEX) and C_USED='1'))) or 
                     (LIDI_R = '1' and OP_EXMEM = x"14" and (B_LIDI = B_EXMEM or ((C_LIDI = B_EXMEM) and C_USED='1'))) or 
                     (LIDI_R = '1' and OP_MEMRE = x"14" and (B_LIDI = B_DIEX or ((C_LIDI = B_EXMEM) and C_USED='1'))) or 
                      BRANCH_DIEX = '1')
                      else 
           '0'; 
    OP_out <= x"00" when err = '1'   else 
              OP_LIDI;
    alea <= err; 
    
end Behavioral;
