----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2023 17:30:30
-- Design Name: 
-- Module Name: test_reg - Behavioral
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

entity test_reg is
--  Port ( );
end test_reg;

architecture Behavioral of test_reg is

    COMPONENT Banc_reg PORT(
               A_addr : in STD_LOGIC_VECTOR (3 downto 0);
               B_addr : in STD_LOGIC_VECTOR (3 downto 0);
               W_addr : in STD_LOGIC_VECTOR (3 downto 0);
               W : in STD_LOGIC;
               data : in STD_LOGIC_VECTOR (7 downto 0);
               RST : in STD_LOGIC;
               CLK : in STD_LOGIC;
               QA : out STD_LOGIC_VECTOR (7 downto 0);
               QB : out STD_LOGIC_VECTOR (7 downto 0));
     END COMPONENT; 
     
     Signal test_A_addr : STD_LOGIC_VECTOR (3 downto 0) := x"6";
     Signal test_B_addr : STD_LOGIC_VECTOR (3 downto 0) := x"1";
     Signal test_W_addr : STD_LOGIC_VECTOR (3 downto 0) := x"0";
     Signal test_W : STD_LOGIC := '0';
     Signal test_data : STD_LOGIC_VECTOR (7 downto 0) := x"00";
     Signal test_RST : STD_LOGIC := '1';
     Signal test_CLK :STD_LOGIC := '0';
     Signal test_QA : STD_LOGIC_VECTOR (7 downto 0);
     Signal test_QB : STD_LOGIC_VECTOR (7 downto 0);
     
     constant T : TIME := 10ns; 
     
begin
    r : Banc_reg port map(test_A_addr, test_B_addr, test_W_addr, test_W, test_data, test_RST, test_CLK, test_QA, test_QB); 
    
    process 
    begin 
        test_CLK <= not test_CLK; 
        wait for T/2;
    end process;
    
    test_data <= x"ff" after T, x"aa" after 2*T; 
    test_W <= '1' after T, '0' after 3*T;  
    test_W_addr <= x"6" after T, x"1" after 2*T, x"3" after 4*T;
    test_A_addr <= x"3" after 5*T; 
    test_RST <= '0' after 5*T; 
end Behavioral;
