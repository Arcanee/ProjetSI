----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2023 10:38:09
-- Design Name: 
-- Module Name: LC_MULT - Behavioral
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

entity LC_MULT_ALU is
    Port ( OP : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC);
end LC_MULT_ALU;
--return '0' when we have a certain type of operators => linked to a multiplexor it will chose the second line 
architecture Behavioral of LC_MULT_ALU is
   
begin
    -- ALU output when ADD SUB MUL DIV AND OR XOR NOT 
    output <= '0' when (
                        OP = x"03" or 
                        OP = x"04" or 
                        OP = x"05" or 
                        OP = x"06" or 
                        OP = x"16" or 
                        OP = x"17" or 
                        OP = x"18" or 
                        OP = x"19") else 
               '1';
                    
    


end Behavioral;
