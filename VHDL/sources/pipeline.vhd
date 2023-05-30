----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2023 16:41:40
-- Design Name: 
-- Module Name: LI_DI - Behavioral
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

entity pipeline4 is
    Port ( enable : in STD_LOGIC;
           flush : in STD_LOGIC; 
           OP_in : in STD_LOGIC_VECTOR (7 downto 0);
           A_in : in STD_LOGIC_VECTOR (7 downto 0);
           B_in : in STD_LOGIC_VECTOR (7 downto 0);
           C_in : in STD_LOGIC_VECTOR (7 downto 0);
           OP_out : out STD_LOGIC_VECTOR (7 downto 0);
           A_out : out STD_LOGIC_VECTOR (7 downto 0);
           B_out : out STD_LOGIC_VECTOR (7 downto 0);
           C_out : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC);
end pipeline4;

architecture Behavioral of pipeline4 is
begin
    process 
    begin 
    wait until clk'event and clk = '1';
    if flush = '1' then 
        OP_out <= x"00"; 
        A_out <= x"00"; 
        B_out <= x"00";
        C_out <= x"00"; 
    else   
        if enable = '0' then
            OP_out <= OP_in; 
            A_out <= A_in; 
            B_out <= B_in;
            C_out <= C_in;  
        end if;
    end if; 
    end process; 

end Behavioral;
