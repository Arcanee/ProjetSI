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

entity LC_DATA_MEM is
    Port ( OP : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC);
end LC_DATA_MEM;
--return '0' when we have a certain type of operators => linked to a multiplexor it will chose the second line 
architecture Behavioral of LC_DATA_MEM is
   
begin
    -- 1 <-- ldr(x14) | 0 <-- str(x13) or input value 
    output <= '0' when (
                        OP = x"13" or OP = x"ff") else 
               '1';
                    
    


end Behavioral;
