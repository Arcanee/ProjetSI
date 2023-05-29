----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.05.2023 10:25:08
-- Design Name: 
-- Module Name: print_unit - Behavioral
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

entity print_unit is
    Port (
           val : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end print_unit;

architecture Behavioral of print_unit is
begin

seg <= "0000001" when val = x"0" else 
       "1001111" when val = x"1" else 
       "0010010" when val = x"2" else 
       "0000110" when val = x"3" else 
       "1001100" when val = x"4" else 
       "0100100" when val = x"5" else 
       "0100000" when val = x"6" else 
       "0001111" when val = x"7" else 
       "0000000" when val = x"8" else 
       "0000100" when val = x"9" else 
       "0000010" when val = x"a" else 
       "1100000" when val = x"b" else 
       "0110001" when val = x"c" else 
       "1000010" when val = x"d" else
       "0110000" when val = x"e" else 
       "0111000" when val = x"f";  
       
       
         



end Behavioral;
