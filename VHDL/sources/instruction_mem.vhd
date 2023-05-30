----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2023 16:31:37
-- Design Name: 
-- Module Name: instruction_mem - Behavioral
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

entity instruction_mem is
    Port ( addr : in STD_LOGIC_VECTOR (7 downto 0);
           INSTR : out STD_LOGIC_VECTOR (31 downto 0));
end instruction_mem;

architecture Behavioral of instruction_mem is

    type tab is array (0 to 255) of STD_LOGIC_VECTOR (31 downto 0);
    Signal mem: tab := (
    x"0100fd00",
    x"13000000",
    x"08030000",
    x"14020000",
    x"13040000",
    x"01000000",
    x"13050000",
    x"14040000",
    x"14050100",
    x"07000001",
    x"0a100000",
    x"01000100",
    x"13040000",
    x"14040000",
    x"13030000",
    x"08270000",
    x"14020000",
    x"13040000",
    x"14020000",
    x"13070000",
    x"01000100",
    x"13080000",
    x"14070000",
    x"14080100",
    x"04000001",
    x"13070000",
    x"11050000",
    x"01001e00",
    x"13000000",
    x"08030000",
    x"12050000",
    x"14060000",
    x"13050000",
    x"14040000",
    x"14050100",
    x"05000001",
    x"13040000",
    x"14040000",
    x"13030000",
    x"14030000",
    x"13040000",
    x"14040000",
    x"15000000",
    x"14030000",
    x"13040000",
    x"14040000",
    x"13010000",
    x"14000000",
    x"10000000",
    x"14000000",
    x"10000000",


    --x"01000e00", --AFF 00 0e
    --x"01030e00", --AFF 03 0e
    --x"07000003", --CMP 00 00 03  
    --x"09050000", --BEQ 05
    --x"0103ff00", --AFF 03 ff 
    --x"0104ff00", --AFF 04 ff 
    --x"13000400", --STR 00 04
    others => x"00000000"
    ); --contenu de la mémoire 
  

begin
   mem(255) <= x"ff000000"; --STORE INPUTS
   INSTR <= mem(conv_integer(unsigned(addr)));         
end Behavioral;
