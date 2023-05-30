----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2023 13:06:34
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port (
       u : in STD_LOGIC;  
       sel : in STD_LOGIC_VECTOR (1 downto 0); --op selector
       order : in STD_LOGIC_VECTOR(1 downto 0); --zx & sw
       
       X : in STD_LOGIC_VECTOR (7 downto 0);
       Y : in STD_LOGIC_VECTOR (7 downto 0);
       
       S : out STD_LOGIC_VECTOR (7 downto 0);
       N : out STD_LOGIC; --negative value
       C : out STD_LOGIC; --carry
       Z : out STD_LOGIC); --null value
end ALU;

architecture Behavioral of ALU is
    Signal N1 : STD_LOGIC_VECTOR (7 downto 0); --FIRST OPPERAND 
    Signal N2 : STD_LOGIC_VECTOR (7 downto 0); --SECOND OPPERAND
    
    Signal neg : STD_LOGIC := '0'; 
    Signal car : STD_LOGIC := '0'; 
    
    Signal S1 : STD_LOGIC_VECTOR (7 downto 0);
    Signal S2 : STD_LOGIC_VECTOR (7 downto 0);
    Signal Sfin :STD_LOGIC_VECTOR (7 downto 0);
    
    COMPONENT AU PORT ( 
           sel : in STD_LOGIC_VECTOR (1 downto 0); --op selector
           X : in STD_LOGIC_VECTOR (7 downto 0);
           Y : in STD_LOGIC_VECTOR (7 downto 0);
                         
           S : out STD_LOGIC_VECTOR (7 downto 0);
           N : out STD_LOGIC; --negative value
           C : out STD_LOGIC); --carry
    END COMPONENT;
     
    COMPONENT LU PORT ( 
           sel : in STD_LOGIC_VECTOR (1 downto 0); --op selector
           X : in STD_LOGIC_VECTOR (7 downto 0);
           Y : in STD_LOGIC_VECTOR (7 downto 0);
           
           S : out STD_LOGIC_VECTOR (7 downto 0));
     END COMPONENT;
           
begin

    N1 <= X when order = "00" else 
          Y when order = "01" else
          x"00" when (order = "10" or order = "11");
          
    N2 <= X when (order = "01" or order = "11") else 
          Y when (order = "00" or order = "10");
          
    logic: LU port map(sel, N1, N2, S1);
    arith: AU port map(sel, N1, N2, S2, neg, car);
    
    Sfin <= S1 when u = '0' else --selector of LU or AU
            S2; 
    N <= neg; 
    C <= car;
    Z <= '1' when (Sfin = x"00") else
         '0';    
    S <= Sfin;

end Behavioral;
