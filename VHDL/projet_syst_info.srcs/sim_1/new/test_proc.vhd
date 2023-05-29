----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2023 17:57:52
-- Design Name: 
-- Module Name: test_proc - Behavioral
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

entity test_proc is

end test_proc;

architecture Behavioral of test_proc is

COMPONENT proc PORT (
            CLK : in STD_LOGIC;
            CLK_PRINT : in STD_LOGIC; 
            MEM_ADDR : in STD_LOGIC_VECTOR(7 downto 0);
            REG_ADDR : in STD_LOGIC_VECTOR(7 downto 0);
            MEM_VAL : out STD_LOGIC_VECTOR(7 downto 0);
            REG_VAL : out STD_LOGIC_VECTOR(7 downto 0);
            DISPLAY : out STD_LOGIC_VECTOR(6 downto 0); 
            AN : out STD_LOGIC_VECTOR(3 downto 0) 
            );
END COMPONENT;         
signal test_MEM_ADDR, test_REG_ADDR : STD_LOGIC_VECTOR(7 downto 0) := x"00"; 
signal test_MEM_VAL, test_REG_VAL :STD_LOGIC_VECTOR(7 downto 0); 
signal test_DISPLAY : STD_LOGIC_VECTOR(6 downto 0); 
signal test_AN : STD_LOGIC_VECTOR(3 downto 0);
signal test_CLK, test_CLK_PRINT : STD_LOGIC := '0';
constant T : TIME := 10ns; 
begin

    proc_test : proc port map(test_CLK, test_CLK_PRINT, test_MEM_ADDR, test_REG_ADDR, test_MEM_VAL, test_REG_VAL, test_DISPLAY, test_AN);
    process 
    begin 
        test_CLK <= not test_CLK; 
        wait for T/2;
    end process;

end Behavioral;
