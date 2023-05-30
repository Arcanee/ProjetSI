----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2023 08:52:16
-- Design Name: 
-- Module Name: instr_pointer - Behavioral
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

entity instr_pointer is
    Port ( CLK : in STD_LOGIC;
           alea : in STD_LOGIC;
           load : in STD_LOGIC; 
           addr_in : in STD_LOGIC_VECTOR(7 downto 0);   
           RST : in STD_LOGIC;
           addr : out STD_LOGIC_VECTOR (7 downto 0));
           
           
end instr_pointer;

architecture Behavioral of instr_pointer is
signal a : STD_LOGIC_VECTOR(7 downto 0) := x"ff";  
begin


process
begin
   wait until clk'event and clk = '1';
   if RST = '0' then 
        a <= x"ff"; 
   else 
       if load = '1' then 
            a <= addr_in; 
        else
            if alea = '0' and a /= x"fe" then 
                a <= a+1; 
    
            end if; 
        end if;
   end if; 
   
end process;
addr <= a; 


end Behavioral;
