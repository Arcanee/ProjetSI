----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2023 16:53:37
-- Design Name: 
-- Module Name: Banc_reg - Behavioral
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

entity Banc_reg is
    Port ( A_addr : in STD_LOGIC_VECTOR (3 downto 0);
           B_addr : in STD_LOGIC_VECTOR (3 downto 0);
           C_addr :in STD_LOGIC_VECTOR (3 downto 0);--for the fpga demo
           W_addr : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0);
           QC : out STD_LOGIC_VECTOR (7 downto 0));--for the fpga demo
end Banc_reg;

architecture Behavioral of Banc_reg is
    type tab is array (0 to 15) of STD_LOGIC_VECTOR (7 downto 0);
    Signal regs: tab := (others => x"00"); --contenu du banc de registre 
    Signal A : STD_LOGIC_VECTOR(7 downto 0); --value in register A
    Signal B : STD_LOGIC_VECTOR(7 downto 0); --value in register B

begin
    process 
    begin 
        wait until clk'event and clk = '1';
        if RST = '0' then 
            regs <= (others =>  x"00"); --all is set to 0
        else
            if W = '1' then
                regs(conv_integer(unsigned(W_addr))) <= data ; --write in Register W
            end if; 
        end if;        
    end process; 
    
    QA <= data when (W_addr = A_addr and W = '1') else --bypass
          regs(conv_integer(unsigned(A_addr))); 
    QB <= data when (W_addr = B_addr and W= '1') else --bypass
          regs(conv_integer(unsigned(B_addr))); 
          
          --for the fpga demo
    QC <= data when (W_addr = C_addr and W= '1') else --bypass
          regs(conv_integer(unsigned(C_addr))); 
          


end Behavioral;
