----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2023 13:36:49
-- Design Name: 
-- Module Name: test_alu - Behavioral
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

entity test_alu is
--  Port ( );
end test_alu;

architecture Behavioral of test_alu is

    COMPONENT ALU PORT (
        u : in STD_LOGIC;  
        sel : in STD_LOGIC_VECTOR (1 downto 0); --op selector
        order : in STD_LOGIC_VECTOR (1 downto 0);
        X : in STD_LOGIC_VECTOR (7 downto 0);
        Y : in STD_LOGIC_VECTOR (7 downto 0);
        
        S : out STD_LOGIC_VECTOR (7 downto 0);
        N : out STD_LOGIC; --negative value
        C : out STD_LOGIC;  --carry
        Z : out STD_LOGIC); --null value if 1
        
    END COMPONENT; 
    
    --input
    signal test_u : STD_LOGIC := '1';  
    signal test_sel :STD_LOGIC_VECTOR (1 downto 0) := "01";
    signal test_order : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal test_X : STD_LOGIC_VECTOR (7 downto 0) := x"08";
    signal test_Y : STD_LOGIC_VECTOR (7 downto 0) := x"08";
    signal test_S : STD_LOGIC_VECTOR (7 downto 0);
    signal test_N : STD_LOGIC; 
    signal test_C : STD_LOGIC; 
    signal test_Z : STD_LOGIC;
  
begin
    test: ALU port map(test_u, test_sel, test_order, test_X, test_Y, test_S, test_N, test_C, test_Z); 

end Behavioral;
