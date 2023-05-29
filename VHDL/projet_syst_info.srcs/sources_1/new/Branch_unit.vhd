----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.05.2023 15:09:07
-- Design Name: 
-- Module Name: Branch_unit - Behavioral
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

entity Branch_unit is
    Port ( CLK : in STD_LOGIC;
           OP : in STD_LOGIC_VECTOR (7 downto 0);
           b_addr_in : in STD_LOGIC_VECTOR(7 downto 0); 
           Z : in STD_LOGIC;
           N : in STD_LOGIC;
           b_addr_out : out STD_LOGIC_VECTOR (7 downto 0);
           b : out STD_LOGIC);
end Branch_unit;

architecture Behavioral of Branch_unit is
signal neg, zero: STD_LOGIC;
begin
process 
begin 
    wait until clk'event and clk = '1';
    if OP = x"07" then
        zero <= Z; 
        neg <= N;
    end if;
end process; 

b <= '1' when OP = x"08" or --B
              OP = x"10" or --RET 
             (OP = x"09" and zero = '1') or --BEQ
             (OP = x"0a" and zero = '0') or --BNE
             (OP = x"0b" and neg = '1') or --BN 
             (OP = x"0c" and (neg = '1' or zero = '1')) or --BNZ
             (OP = x"0d" and neg = '0') or --BP
             (OP = x"0e" and (neg = '0' and zero = '0')) else --BSP 
      '0'; 
 b_addr_out <= b_addr_in ;          

end Behavioral;
