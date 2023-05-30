----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2023 16:17:24
-- Design Name: 
-- Module Name: data_mem - Behavioral
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

entity data_mem is
    Port ( addr : in STD_LOGIC_VECTOR (7 downto 0);
           addr2 : in STD_LOGIC_VECTOR (3 downto 0);--for the fpga demo
           dataIN : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           pp_value : in STD_LOGIC_VECTOR (7 downto 0); --push pop value
           inc : in STD_LOGIC; 
           dec : in STD_LOGIC; 
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           dataOUT : out STD_LOGIC_VECTOR (7 downto 0);
           dataOUT2 : out STD_LOGIC_VECTOR (7 downto 0));--for the fpga demo
end data_mem;

architecture Behavioral of data_mem is
    type tab is array (0 to 255) of STD_LOGIC_VECTOR (7 downto 0);
    Signal mem: tab := (others => x"00"); --contenu de la mémoire 
    Signal aux: STD_LOGIC_VECTOR (7 downto 0); 
    Signal sp : STD_LOGIC_VECTOR (7 downto 0) := x"00"; --stack pointer 

begin
process 
begin 
    wait until clk'event and clk = '1';
    if RST = '0' then 
        mem <= (others =>  x"00"); --all is set to 0
        sp <= x"00"; 
    else
        if inc = '1' then --PUSH
            sp <= sp + pp_value; 
        elsif dec = '1' then --POP 
            sp <= sp - pp_value; 
        elsif RW = '0' then --write
            mem(conv_integer(unsigned(addr+sp))) <= dataIN; 
        end if; 
    end if;        
end process; 
    dataOUT <= mem(conv_integer(unsigned(addr+sp)));
    --for the fpga demo
    dataOUT2 <= mem(conv_integer(unsigned(addr2)));



end Behavioral;
