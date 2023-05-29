----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2023 09:55:42
-- Design Name: 
-- Module Name: LC_ALU - Behavioral
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

entity LC_ALU is
    Port ( OP : in STD_LOGIC_VECTOR (7 downto 0);
           u : out STD_LOGIC;
           sel : out STD_LOGIC_VECTOR (1 downto 0);
           order : out STD_LOGIC_VECTOR (1 downto 0));
end LC_ALU;

architecture Behavioral of LC_ALU is
signal ctrl : STD_LOGIC_VECTOR(4 downto 0); 
begin

ctrl <= "10000" when OP = x"03" else 
        "10100" when OP = x"04" or OP = x"07" else
        "11000" when OP = x"05" else 
        "11100" when OP = x"06" else 
        "00000" when OP = x"16" else --and
        "00100" when OP = x"17" else --or
        "01100" when OP = x"18" else --not
        "01000" when OP = x"19" else --xor
        "00000"; 
          
u <= ctrl(4);
sel <= ctrl(3 downto 2);
order <= ctrl(1 downto 0);    

end Behavioral;
