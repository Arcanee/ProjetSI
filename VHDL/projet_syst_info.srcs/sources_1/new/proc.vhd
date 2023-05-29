----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2023 16:50:34
-- Design Name: 
-- Module Name: proc - Behavioral
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

entity proc is port (
            CLK : in STD_LOGIC;
            CLK_PRINT: in STD_LOGIC; 
            MEM_ADDR : in STD_LOGIC_VECTOR(7 downto 0);
            REG_ADDR : in STD_LOGIC_VECTOR(7 downto 0);
            MEM_VAL : out STD_LOGIC_VECTOR(7 downto 0);
            REG_VAL : out STD_LOGIC_VECTOR(7 downto 0);
            DISPLAY : out STD_LOGIC_VECTOR(6 downto 0); 
            AN : out STD_LOGIC_VECTOR(3 downto 0)
            );
end proc;

architecture Behavioral of proc is

COMPONENT instruction_mem PORT (
           addr : in STD_LOGIC_VECTOR (7 downto 0);
           INSTR : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

--two different type of pipeline with a different number of I/O
COMPONENT pipeline4 PORT (
           enable : in STD_LOGIC;
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
END COMPONENT; 

COMPONENT pipeline3 PORT (
           OP_in : in STD_LOGIC_VECTOR (7 downto 0);
           A_in : in STD_LOGIC_VECTOR (7 downto 0);
           B_in : in STD_LOGIC_VECTOR (7 downto 0);
           OP_out : out STD_LOGIC_VECTOR (7 downto 0);
           A_out : out STD_LOGIC_VECTOR (7 downto 0);
           B_out : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC);
END COMPONENT;

COMPONENT Banc_reg PORT (
           A_addr : in STD_LOGIC_VECTOR (3 downto 0);
           B_addr : in STD_LOGIC_VECTOR (3 downto 0);
           C_addr : in STD_LOGIC_VECTOR (3 downto 0);
           W_addr : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0);
           QC : out STD_LOGIC_VECTOR (7 downto 0));
           
END COMPONENT; 

COMPONENT multiplexor PORT (
           OP : in STD_LOGIC; 
           A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT; 

COMPONENT instr_pointer PORT(
          CLK : in STD_LOGIC; 
          alea : in STD_LOGIC;
          load : in STD_LOGIC; 
          addr_in : in STD_LOGIC_VECTOR(7 downto 0);   
          addr : out STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT; 

COMPONENT ALU PORT(
        u : in STD_LOGIC;  
        sel : in STD_LOGIC_VECTOR (1 downto 0); --op selector
        order : in STD_LOGIC_VECTOR(1 downto 0); --zx & sw
        
        X : in STD_LOGIC_VECTOR (7 downto 0);
        Y : in STD_LOGIC_VECTOR (7 downto 0);
        
        S : out STD_LOGIC_VECTOR (7 downto 0);
        N : out STD_LOGIC; --negative value
        C : out STD_LOGIC; --carry
        Z : out STD_LOGIC); --zero value
END COMPONENT; 

COMPONENT LC_ALU PORT (
           OP : in STD_LOGIC_VECTOR (7 downto 0);
           u : out STD_LOGIC;
           sel : out STD_LOGIC_VECTOR (1 downto 0);
           order : out STD_LOGIC_VECTOR (1 downto 0));
END COMPONENT; 

COMPONENT LC_reg PORT(
           OP : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC);
END COMPONENT; 

--Choose the right value depending on the operator for the multiplexor in output of the ALU 
COMPONENT LC_MULT_ALU PORT(
           OP : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC);
END COMPONENT; 

--Choose the right value depending on the operator for the multiplexor in the DI part
COMPONENT LC_MULT_DI PORT(
           OP : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC);
END COMPONENT; 

COMPONENT data_mem      Port ( addr : in STD_LOGIC_VECTOR (7 downto 0);
           addr2 : in STD_LOGIC_VECTOR (7 downto 0);--for the fpga demo
           dataIN : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           pp_value : in STD_LOGIC_VECTOR (7 downto 0); --push pop value
           inc : in STD_LOGIC; 
           dec : in STD_LOGIC; 
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           dataOUT : out STD_LOGIC_VECTOR (7 downto 0);
           dataOUT2 : out STD_LOGIC_VECTOR (7 downto 0));--for the fpga demo
END COMPONENT;

--Choose the right value depending on the operator for the multiplexor in output of the data memory
COMPONENT LC_DATA_MEM Port ( OP : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC);
END COMPONENT;

--detect branch alea and data alea (located near the first pipeline) 
COMPONENT ALEA_DET     Port ( 
       OP_LIDI : in STD_LOGIC_VECTOR (7 downto 0);
       OP_DIEX : in STD_LOGIC_VECTOR (7 downto 0);
       OP_EXMEM: in STD_LOGIC_VECTOR (7 downto 0);
       OP_MEMRE: in STD_LOGIC_VECTOR (7 downto 0);
       A_DIEX : in STD_LOGIC_VECTOR (7 downto 0);
       A_EXMEM : in STD_LOGIC_VECTOR (7 downto 0);
       A_MEMRE : in STD_LOGIC_VECTOR (7 downto 0);
       
       B_DIEX : in STD_LOGIC_VECTOR (7 downto 0);
       B_EXMEM : in STD_LOGIC_VECTOR (7 downto 0);
       B_MEMRE : in STD_LOGIC_VECTOR (7 downto 0);
       
       B_LIDI : in STD_LOGIC_VECTOR (7 downto 0);
       C_LIDI : in STD_LOGIC_VECTOR (7 downto 0);
       alea : out STD_LOGIC;
       OP_out : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

COMPONENT Branch_unit Port ( CLK : in STD_LOGIC;
           OP : in STD_LOGIC_VECTOR (7 downto 0);
           b_addr_in : in STD_LOGIC_VECTOR(7 downto 0); 
           Z : in STD_LOGIC;
           N : in STD_LOGIC;
           b_addr_out : out STD_LOGIC_VECTOR (7 downto 0);
           b : out STD_LOGIC);
END COMPONENT; 

COMPONENT seg_display_unit Port ( 
           CLK : in STD_LOGIC;
           CLK_PRINT : in STD_LOGIC;
           print : in STD_LOGIC; 
           val : in STD_LOGIC_VECTOR (7 downto 0);
           c : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

         
    signal INSTR_ADDR : STD_LOGIC_VECTOR(7 downto 0); --Adress of the instruction 
    
    signal BRANCH : STD_LOGIC;  -- '1' when we do a branch 
    signal BRANCH_ADDR : STD_LOGIC_VECTOR (7 downto 0);
    
    signal mem_to_LI_DI : STD_LOGIC_VECTOR(31 downto 0); --output instruction from the instruction memory 
    --first pipeline inputs 
    signal OP_LIDI_IN, A_LIDI_IN, C_LIDI_IN, B_LIDI_IN : STD_LOGIC_VECTOR(7 downto 0); 
    --signaux intermédiaires entre LI/DI et DI/EX 
    signal ALEA : STD_LOGIC;  --'1' when alea detected 
    --first pipeline outputs 
    signal OP_DI, A_DI,  B_DI_MULIN, B_DI_MULOUT, C_DI, OP_ALEA_OUT : STD_LOGIC_VECTOR(7 downto 0); 
    signal REG_QA, REG_QB :STD_LOGIC_VECTOR(7 downto 0); 
    signal OP_DI_MULTI : STD_LOGIC; --"oprator" of the multiplexor in LIDI 
    
    --signaux intermédiaires entre DI/EX et EX/MEM  (ALU) 
    --Second pipeline outputs 
    signal OP_EX, A_EX,  B_EX_ALUIN : STD_LOGIC_VECTOR(7 downto 0); 
    --outpus of the ALU and input for the third pipeline 
    signal ALUOUT, B_EX_MULOUT, C_EX: STD_LOGIC_VECTOR(7 downto 0); 
    signal LC_u :STD_LOGIC; --u ='1' => arithmetic operations | u = '0' => logic operations 
    signal LC_sel, LC_order : STD_LOGIC_VECTOR(1 downto 0); --Select operation and calculus order 
    signal OP_ALU_MULTI :STD_LOGIC; --input operator for the ALU multiplexor 
    signal ALU_Z, ALU_N, ALU_C : STD_LOGIC; --ALU FLAGS (zero negative and carry) 
    
    
     --signaux intermédiaires entre EX/MEM ET MEM/RE
     --Outputs of the third pipeline 
    signal OP_MEM, A_MEM, B_MEM: STD_LOGIC_VECTOR(7 downto 0);
    --Outputs of the multiplexors and also input for the last pipeline 
    signal LDR_MULOUT, MEM_MULOUT, MEM_MULIN: STD_LOGIC_VECTOR(7 downto 0);
    --Inputs for the multiplexors 
    signal OP_MUL_MEM, OP_MUL_LDR : STD_LOGIC;
    signal INC, DEC : STD_LOGIC; --for the stack pointer
    
    signal RW_MEM : STD_LOGIC; --LC output (read or not in the data mem)  
    
    --Values from the last pipeline to the register (writting adress and data) 
    signal  A_to_regADDR, B_to_regDATA : STD_LOGIC_VECTOR(7 downto 0); 
    signal OP_to_LC_reg :STD_LOGIC_VECTOR(7 downto 0); --INPUT FOR THE LC before registers
    signal LC_to_regW : STD_LOGIC; --OUTPUT OF THE LC before registers 
    
    --for return 
    signal regADDR_A : STD_LOGIC_VECTOR(3 downto 0);
    signal A_DI_OUT : STD_LOGIC_VECTOR (7 downto 0); 
    
    signal DIS_VAL  : STD_LOGIC_VECTOR(7 downto 0); 
    signal reg_b_addr : STD_LOGIC_VECTOR(3 downto 0); 
    signal DIS : STD_LOGIC; 
    
begin
    IP : instr_pointer port map (CLK, ALEA,  BRANCH, BRANCH_ADDR, INSTR_ADDR); 
    INSTR_MEM : instruction_mem port map(INSTR_ADDR, mem_to_LI_DI);
    
    --slice the instruction 
    OP_LIDI_IN <= mem_to_LI_DI(31 downto 24);
                   
    A_LIDI_IN <= mem_to_LI_DI(23 downto 16);
               
    B_LIDI_IN <= mem_to_LI_DI(15 downto 8);
    
    C_LIDI_IN <= mem_to_LI_DI(7 downto 0);
                 
    --FIRST PIPELINE         
    LI_DI : pipeline4 port map (ALEA, BRANCH, OP_LIDI_IN, A_LIDI_IN, B_LIDI_IN, C_LIDI_IN, OP_DI, A_DI, B_DI_MULIN, C_DI, CLK);
    DET : ALEA_DET port map (OP_DI, OP_EX, OP_MEM, OP_to_LC_reg, A_EX, A_MEM, A_to_regADDR, B_EX_ALUIN, B_MEM, B_to_regDATA, B_DI_MULIN, C_DI, ALEA, OP_ALEA_OUT);                  
    --##########Multi DI input##########
    --if we have COP ADD SUB MUL DIV => OP_DI_MULTI = '0' => multiplexor selects REG_QA
     LC_MULT_DI1 : LC_MULT_DI port map(OP_ALEA_OUT, OP_DI_MULTI);   
    --###############################
    
    --Multiplexor before the 2nd pipeline 
    MUX_DI : multiplexor port map (OP_DI_MULTI, B_DI_MULIN, REG_QA, B_DI_MULOUT);
      

     ------------  ALU -------------
     --SECOND PIPELINE
    DI_EX : pipeline4 port map ('0', '0', OP_ALEA_OUT, A_DI_OUT, B_DI_MULOUT, REG_QB, OP_EX, A_EX, B_EX_ALUIN, C_EX, CLK); 
    LC_ALU_EX : LC_ALU port map(OP_EX, LC_u, LC_sel, LC_order);
    
    --##########MULTI ALU INPUT########
    --ADD SUB MUL DIV => OP_ALU_MULTI = '0' => multiplexor select ALUOUT
    LC_MULT_ALU1 : LC_MULT_ALU port map(OP_EX, OP_ALU_MULTI);
    --################################
    --multiplexor before the third pipeline 
    MUX_ALU : multiplexor port map(OP_ALU_MULTI, B_EX_ALUIN, ALUOUT, B_EX_MULOUT);
    ALU1 : ALU port map(LC_u, LC_sel, LC_order, B_EX_ALUIN, C_EX, ALUOUT, ALU_N, ALU_C, ALU_Z);
    
    --Redeem output flags from the output and memorise it until a branch operator
    BRU : Branch_unit port map(CLK, OP_EX, A_EX, ALU_Z, ALU_N, BRANCH_ADDR, BRANCH); 
    
    -------------------------------------
    
     ------------  DATA MEM -------------
    --THIRD PIPELINE
    EX_MEM : pipeline3 port map (OP_EX, A_EX, B_EX_MULOUT, OP_MEM, A_MEM, B_MEM, CLK);
    LC_MEM : LC_DATA_MEM port map(OP_MEM, RW_MEM);
    --push 
    INC <= '1' when OP_MEM = x"11" else '0';
    --pop 
    DEC <= '1' when OP_MEM = x"12" else '0'; 
    MEM : data_mem port map(A_MEM, MEM_ADDR, B_MEM, RW_MEM,  A_MEM, INC, DEC, '1', CLK, MEM_MULIN, MEM_VAL); 
    
    --yes it is the same operation but it is clearer with two different signals
    --########INPUT FOR MEM MUX ##############
    OP_MUL_MEM <= '1' when ( OP_MEM = x"14") else 
                  '0'; 
    --##########################################
    
    --#######INPUT FOR LDR MUX #################
    OP_MUL_LDR <= '0' when OP_MEM = x"14" else  --when LDR we use the adress in B (register addr) 
                  '1'; 
    --with this we have STR @memoire @registre and LDR @memoire @registre
    --##########################################
    
    --MULTIPLEXOR TO CHOOSE REGISTER ADDR (B) WHEN LDR              
    MUX_LDR : multiplexor port map(OP_MUL_LDR, A_MEM, B_MEM, LDR_MULOUT); 
    
    --MULTIPLEXOR JUST BEFORE THE LAST PIPELINE TO SELECT OR NOT THE OUTPUT OF THE MEMORY 
    MUX_MEM : multiplexor port map (OP_MUL_MEM, MEM_MULIN, B_MEM, MEM_MULOUT); 
    --LAST PIPELINE 
    MEM_RE : pipeline3 port map (OP_MEM, LDR_MULOUT, MEM_MULOUT, OP_to_LC_reg, A_to_regADDR, B_to_regDATA, CLK);
    -------------------------------------
    
     ------------  REGISTERS  -----------
   
    --###########LC for regs###########
    --COP AFF ADD SUB MUL DIV LDR => write in register 
    LC_regW : LC_reg port map (OP_to_LC_reg, LC_to_regW); 
    --########################
    --##########PRINT MULTIPLEXOR#####"
    --if print => DIS --> '1' 
    DIS <= '1' when OP_ALEA_OUT = x"15" else 
           '0'; 
    --A can be a register address when there is the OP RET (x10) 
    --In this case we send A into the register and retrieve the output value in A after
    regADDR_A <= A_DI(3 downto 0) when OP_ALEA_OUT = x"10" else B_DI_MULIN(3 downto 0); 
    A_DI_OUT <= DIS_VAL when OP_ALEA_OUT = x"10" else A_DI; 
   
    REG : Banc_reg port map(regADDR_A, C_DI (3 downto 0),REG_ADDR(3 downto 0), A_to_regADDR(3 downto 0),  LC_to_regW, B_to_regDATA, '1', CLK, 
                            DIS_VAL, REG_QB, REG_VAL);
    REG_QA <= DIS_VAL;   
    SEG_DISPLAY : seg_display_unit port map (CLK, CLK_PRINT, DIS, DIS_VAL, DISPLAY, AN);  
    -------------------------------------
        

end Behavioral;
