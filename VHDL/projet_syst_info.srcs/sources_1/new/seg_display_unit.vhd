----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.05.2023 12:42:50
-- Design Name: 
-- Module Name: seg_display_unit - Behavioral
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

entity seg_display_unit is
    Port ( CLK : in STD_LOGIC;
           CLK_PRINT : in STD_LOGIC; 
           print : in STD_LOGIC; 
           val : in STD_LOGIC_VECTOR (7 downto 0);
           c : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end seg_display_unit;



architecture Behavioral of seg_display_unit is

COMPONENT print_unit     Port ( 
           val : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
END COMPONENT; 

signal cpt, r0, r1: STD_LOGIC := '0'; 
signal output0, output1 :STD_LOGIC_VECTOR(6 downto 0); --The lighted segments for the display 0 and 1
signal val_dis : STD_LOGIC_VECTOR(7 downto 0);
begin
PRINT0 : print_unit port map(val_dis(3 downto 0), output0); 
PRINT1 : print_unit port map(val_dis(7 downto 4), output1);  
update : process 
begin 
wait until clk'event and clk = '1';
    if print = '1' then  --When we receive a print we load the value in memory 
        val_dis <= val; 
    end if;  
end process update; 

counter :process 
begin
wait until clk_print'event and clk_print = '1'; --The second clock alternate between the 2 segments
    cpt <= not cpt;  
    if cpt = '0' then 
        c <= output0; 
        an <= "1110"; 
    else 
        c <= output1; 
        an <= "1101";
    end if;
end process counter ;  

end Behavioral;
