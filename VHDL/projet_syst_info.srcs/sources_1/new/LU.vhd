----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2023 12:29:26
-- Design Name: 
-- Module Name: LU - Behavioral
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

entity LU is
    Port (  sel : in STD_LOGIC_VECTOR (1 downto 0); --op selector
          X : in STD_LOGIC_VECTOR (7 downto 0);
          Y : in STD_LOGIC_VECTOR (7 downto 0);
          S : out STD_LOGIC_VECTOR (7 downto 0));
end LU;

architecture Behavioral of LU is
begin
        
        S <= (X and Y) when sel = "00" else
               (X or Y ) when sel = "01" else
               (X xor Y) when sel = "10" else
               (not X  ) when sel = "11";
end Behavioral;
