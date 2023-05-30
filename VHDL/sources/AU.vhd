----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2023 12:29:26
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity AU is
    Port ( sel : in STD_LOGIC_VECTOR (1 downto 0); --op selector
           X : in STD_LOGIC_VECTOR (7 downto 0);
           Y : in STD_LOGIC_VECTOR (7 downto 0);
           
           
           S : out STD_LOGIC_VECTOR (7 downto 0);
           N : out STD_LOGIC; --negative value
           C : out STD_LOGIC); --carry 
           
end AU;

architecture Behavioral of AU is

    Signal res_add : STD_LOGIC_VECTOR (8 downto 0);
    Signal res_mul : STD_LOGIC_VECTOR (17 downto 0);
    Signal N1, N2: STD_LOGIC_VECTOR (8 downto 0);
    Signal offset_vec : STD_LOGIC_VECTOR (15 downto 0);
     
begin
    N1 <= '0' & X; 
    N2 <= '0' & Y;
    offset_vec <= x"00" & X; 

              
    res_add <= (N1 + N2) when sel = "00" else
               (N1 - N2) when sel = "01" else
               --shift
               offset_vec(9 downto 1) when (sel = "11" and Y = x"01") else  
               offset_vec(10 downto 2) when (sel = "11" and Y = x"02") else  
               offset_vec(11 downto 3) when (sel = "11" and Y = x"03") else  
               offset_vec(12 downto 4) when (sel = "11" and Y = x"04") else  
               offset_vec(13 downto 5) when (sel = "11" and Y = x"05") else  
               offset_vec(14 downto 6) when (sel = "11" and Y = x"06") else  
               offset_vec(15 downto 7) when (sel = "11" and Y > x"07"); 
                 
    
    res_mul <= (N1 * N2);

    N <= '1' when (sel = "01" and Y > X) else --when sub 
         '0'; 
    
    C <= '1' when (res_add(8) = '1'and sel = "00") else --add with carry 
         '1' when (res_mul(15 downto 7) > x"0001") else --when after an multiplication we "cut" bits
         '0'; --there is no carry in other cases 
         
    S <= res_mul(7 downto 0) when (sel = "10") else
         res_add(7 downto 0);
                     
end Behavioral;
