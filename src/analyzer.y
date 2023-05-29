%{
#include <stdio.h>
#include <stdlib.h>
#include "../lib/include/sym_tab.h"
#include "../lib/include/asm_tab.h"
#include "../lib/include/fun_tab.h"

#define NIL -1 //Refers to a negligible parameter in the asm instruction table.

#define ASM_NULL 0 // For debugging
#define ASM_AFF 1 // Reg, Val
#define ASM_COP 2 // Not used anymore
#define ASM_ADD 3
#define ASM_SUB 4
#define ASM_MUL 5
#define ASM_DIV 6
#define ASM_CMP 7
#define ASM_B 8
#define ASM_BEQ 9
#define ASM_BNE 10
#define ASM_BN 11
#define ASM_BNZ 12
#define ASM_BP 13
#define ASM_BSP 14
#define ASM_BF 15 // Not used anymore
#define ASM_RET 16
#define ASM_PUSH 17
#define ASM_POP 18
#define ASM_STR 19 // Mem --> Reg
#define ASM_LDR 20 // Mem --> Reg
#define ASM_PRINT 21
#define ASM_ANDb 22
#define ASM_ORb 23
#define ASM_NOTb 24
#define ASM_XOR 25

// Some opcodes are not used anymore. However, to keep a consistent order in the compiler,
// interpreter and VHDL files, we kept all of them here.

%}

%code provides {
  int yylex (void);
  void yyerror (const char *);
}

%union { 
    char* s;
    int i; 
    struct {int begin;
            int branch_line;
            int was_and;
            int and_branch_line;
            int end; } branch_info;
    int is_and;
    int f_type;
}

%token <s> tID
%token <i> tNB
%token <branch_info> tIF tWHILE tELSE

%type <is_and> condition
%type <branch_info> ifheader
%type <f_type> type

%token tPRINT tRETURN tINT tVOID tLT tLE tGT tGE tEQ tNEQ tASSIGN tADD tSUB tDIV tMUL tAND tAND_b tOR tOR_b tNOT tNOT_b tXOR tLBRACE tRBRACE tLPAR tRPAR tSEMI tCOMMA
%left tADD tSUB
%left tMUL tDIV

%left tOR
%left tAND

%%

functions:
    %empty
  | function functions
  ;

function_params:
    %empty
    {sym_inc_depth(); 
     sym_add("?ADDR");
     sym_add("?VAL");}
  ;

function_entry:
    type tID tLPAR function_params params tRPAR {fun_add($2, asm_current(), $1);}
  ;

function:
    function_entry block {asm_add(ASM_RET, 0, NIL, NIL, 1); sym_clear();}
  ;

type:
    tINT {$$ = 1;}
  | tVOID {$$ = 0;}
  ;

params:
    params_void
  | params_full
  ;

params_void:
    %empty
  | tVOID
  ;

params_full_p1:
    tINT tID tCOMMA {sym_add($2);}
  ;

params_full:
    tINT tID {sym_add($2);}
  | params_full_p1 params_full
  ;

block_entry:
    tLBRACE {sym_inc_depth();}
  ;

block:
    block_entry instructions tRBRACE {sym_clear();}
  ;

instructions:
    %empty
  | instruction instructions
  ;

instruction:
    print tSEMI
  | assign tSEMI
  | declar tSEMI
  | funcreturn tSEMI
  | funccall tSEMI
  | loop 
  | condins
  | block
  | tSEMI
  ;

ifheader: 
  tIF tLPAR condition tRPAR  {$1.branch_line = asm_current()-1;
                              $1.was_and = $3;
                              $1.and_branch_line = asm_current()-5;}
                              
  block {$1.end = asm_current();
        $$.was_and = $1.was_and;
        $$.end = $1.end;
        $$.branch_line = $1.branch_line;
        asm_update($1.branch_line, 1, $1.end); 
        if ($3) {asm_update($1.and_branch_line, 1, $1.end);}} //update first compare branch if it was an AND
  ;

condins:
    ifheader
  | ifheader tELSE 
            {asm_add(ASM_B, NIL, NIL, NIL, 1); 
            $1.end = asm_current(); 
            asm_update($1.branch_line, 1, $1.end); //update of the if to go directly in the ELSE block if needed
            if ($1.was_and) {asm_update($1.and_branch_line, 1, $1.end);}} 

    block {$2.end = asm_current(); 
            asm_update($1.end-1, 1, $2.end);} //update of the else branch if we skip it
  ;


expr:
    term
  | expr tADD expr {asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2);
                    asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                    asm_add(ASM_ADD, 0, 0, 1, 3);
                    asm_add(ASM_STR, sym_next_last(), 0, NIL, 2); 
                    sym_remove_last();}

  | expr tSUB expr {asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2);
                    asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                    asm_add(ASM_SUB, 0, 0, 1, 3);
                    asm_add(ASM_STR, sym_next_last(), 0, NIL, 2); 
                    sym_remove_last();}

  | expr tMUL expr {asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2);
                    asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                    asm_add(ASM_MUL, 0, 0, 1, 3);
                    asm_add(ASM_STR, sym_next_last(), 0, NIL, 2); 
                    sym_remove_last();}

  | expr tDIV expr {asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2);
                    asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                    asm_add(ASM_DIV, 0, 0, 1, 3);
                    asm_add(ASM_STR, sym_next_last(), 0, NIL, 2); 
                    sym_remove_last();}

  | expr tAND_b expr {asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2);
                      asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                      asm_add(ASM_ANDb, 0, 0, 1, 3);
                      asm_add(ASM_STR, sym_next_last(), 0, NIL, 2); 
                      sym_remove_last();}

  | expr tOR_b expr  {asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2);
                      asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                      asm_add(ASM_ORb, 0, 0, 1, 3);
                      asm_add(ASM_STR, sym_next_last(), 0, NIL, 2); 
                      sym_remove_last();}

  | tNOT_b expr      {asm_add(ASM_LDR, sym_last(), 0, NIL, 2);
                      asm_add(ASM_NOTb, 0, 0, NIL, 2);
                      asm_add(ASM_STR, sym_last(), 0, NIL, 2);}

  | expr tXOR expr   {asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2);
                      asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                      asm_add(ASM_XOR, 0, 0, 1, 3);
                      asm_add(ASM_STR, sym_next_last(), 0, NIL, 2); 
                      sym_remove_last();}

  | tLPAR expr tRPAR
  | tADD expr
  | tSUB expr {sym_add("_"); 
               asm_add(ASM_AFF, 0, 0, NIL, 2);
               asm_add(ASM_STR, sym_last(), 0, NIL, 2);
               asm_add(ASM_LDR, sym_last(), 0, NIL, 2);
               asm_add(ASM_LDR, sym_next_last(), 1, NIL, 2);
               asm_add(ASM_SUB, 0, 0, 1, 3);
               asm_add(ASM_STR, sym_next_last(), 0, NIL, 2);
               sym_remove_last();}
  ;

term:
    tID {sym_add("_");
         asm_add(ASM_LDR, sym_get_addr($1), 0, NIL, 2); 
         asm_add(ASM_STR, sym_last(), 0, NIL, 2); }
  | tNB {sym_add("_"); 
         asm_add(ASM_AFF, 0, $1, NIL, 2);
         asm_add(ASM_STR, sym_last(), 0, NIL, 2);}
  | funccall
  ;

condition:
    expr {sym_add("_"); 
          asm_add(ASM_AFF, 0, 0, NIL, 2);
          asm_add(ASM_STR, sym_last(), 0, NIL, 2);
          asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2);
          asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
          asm_add(ASM_CMP, 0, 0, 1, 3);
          asm_add(ASM_BEQ, NIL, NIL, NIL, 1);
          sym_remove_last();
          sym_remove_last(); // (expr) <=> (expr != 0)
          $$ = 0;}
         
  | tNOT expr {sym_add("_"); 
               asm_add(ASM_AFF, 0, 0, NIL, 2);
               asm_add(ASM_STR, sym_last(), 0, NIL, 2);
               asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2);
               asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
               asm_add(ASM_CMP, 0, 0, 1, 3);
               asm_add(ASM_BNE, NIL, NIL, NIL, 1);
               sym_remove_last();
               sym_remove_last(); // (!expr) <=> (expr == 0)
               $$ = 0;}

  
  | expr tLT expr {asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2);
                   asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                   asm_add(ASM_CMP, 0, 0, 1, 3);
                   asm_add(ASM_BP, NIL, NIL, NIL, 1); //0 is considered positive
                   sym_remove_last();
                   sym_remove_last();
                   $$ = 0;}

  | expr tLE expr {asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2);
                   asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                   asm_add(ASM_CMP, 0, 0, 1, 3);
                   asm_add(ASM_BSP, NIL, NIL, NIL, 1);
                   sym_remove_last();
                   sym_remove_last();
                   $$ = 0;}

  | expr tGT expr {asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2);
                   asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                   asm_add(ASM_CMP, 0, 0, 1, 3);
                   asm_add(ASM_BNZ, NIL, NIL, NIL, 1);
                   sym_remove_last();
                   sym_remove_last();
                   $$ = 0;}

  | expr tGE expr {asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2);
                   asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                   asm_add(ASM_CMP, 0, 0, 1, 3);
                   asm_add(ASM_BN, NIL, NIL, NIL, 1);
                   sym_remove_last();
                   sym_remove_last();
                   $$ = 0;}

  | expr tOR expr {asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2); //CMP e1 & 0
                   sym_add("_");
                   asm_add(ASM_AFF, 1, 0, NIL, 2);
                   asm_add(ASM_STR, sym_last(), 1, NIL, 2);
                   asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                   asm_add(ASM_CMP, 0, 0, 1, 3);
                   asm_add(ASM_BNE, asm_current()+3, NIL, NIL, 1);

                   asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2); //CMP e2 & 0
                   asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                   asm_add(ASM_CMP, 0, 0, 1, 3);
                   asm_add(ASM_BEQ, NIL, NIL, NIL, 1);

                   sym_remove_last(); //remove 0, e2, e1
                   sym_remove_last();
                   sym_remove_last();
                   $$ = 0;}

  | expr tAND expr {asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2); //CMP e1 & 0
                    sym_add("_");
                    asm_add(ASM_AFF, 1, 0, NIL, 2);
                    asm_add(ASM_STR, sym_last(), 1, NIL, 2);
                    asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                    asm_add(ASM_CMP, 0, 0, 1, 3);
                    asm_add(ASM_BEQ, NIL, NIL, NIL, 1);

                    asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2); //CMP e2 & 0
                    asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                    asm_add(ASM_CMP, 0, 0, 1, 3);
                    asm_add(ASM_BEQ, NIL, NIL, NIL, 1);

                    sym_remove_last(); //remove 0, e2, e1
                    sym_remove_last();
                    sym_remove_last();
                    $$ = 1;}

  | expr tEQ expr {asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2);
                   asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                   asm_add(ASM_CMP, 0, 0, 1, 3);
                   asm_add(ASM_BNE, NIL, NIL, NIL, 1);
                   sym_remove_last();
                   sym_remove_last();
                   $$ = 0;}

  | expr tNEQ expr {asm_add(ASM_LDR, sym_next_last(), 0, NIL, 2);
                    asm_add(ASM_LDR, sym_last(), 1, NIL, 2);
                    asm_add(ASM_CMP, 0, 0, 1, 3);
                    asm_add(ASM_BEQ, NIL, NIL, NIL, 1);
                    sym_remove_last();
                    sym_remove_last();
                    $$ = 0;}
  ;

loop:
    tWHILE {$1.begin = asm_current();} 
    tLPAR condition { $1.branch_line = asm_current()-1;
                      $1.and_branch_line = asm_current()-5;}

    tRPAR block {asm_add(ASM_B, $1.begin, NIL, NIL, 1);
                $1.end = asm_current();
                asm_update($1.branch_line, 1, $1.end);
                if ($4) {asm_update($1.and_branch_line, 1, $1.end);}}
  ;

print:
    tPRINT tLPAR expr tRPAR {asm_add(ASM_LDR, sym_last(), 0, NIL, 2);
                             asm_add(ASM_PRINT, 0, 0, NIL, 2);
                             sym_remove_last();} // reg to print is in 2nd param to be consistent with read/write in the VHDL file

assign:
    tID tASSIGN expr {sym_set_init($1); 
                      asm_add(ASM_LDR, sym_last(), 0, NIL, 2);
                      asm_add(ASM_STR, sym_get_addr($1), 0, NIL, 2);  
                      sym_remove_last();} 
  ;

declar:
    tINT tID {sym_add($2);}
  | tINT tID {sym_add($2);} tASSIGN {sym_set_init($2);} expr {asm_add(ASM_LDR, sym_last(), 0, NIL, 2);
                                                              asm_add(ASM_STR, sym_get_addr($2), 0, NIL, 2); 
                                                              sym_remove_last();}
  ;

funcreturn:
    tRETURN expr {asm_add(ASM_LDR, sym_last(), 0, NIL, 2);
                  asm_add(ASM_STR, sym_get_addr("?VAL"), 0, NIL, 2); 
                  sym_remove_last();
                  asm_add(ASM_RET, 0, NIL, NIL, 1);}
  ;

funccall:
    tID tLPAR {asm_set_push(sym_last()+1);
               sym_add("!ADDR"); sym_add("!VAL");} 
    
    callparams tRPAR {asm_add(ASM_PUSH, asm_push(), NIL, NIL, 1);
                      asm_add(ASM_AFF, 0, asm_current()+3, NIL, 2);
                      asm_add(ASM_STR, 0, 0, NIL, 2);
                      asm_add(ASM_B, fun_get_addr($1), NIL, NIL, 1);
                      asm_add(ASM_POP, asm_push(), NIL, NIL, 1);
                      asm_add(ASM_LDR, sym_get_addr("!VAL"), 0, NIL, 2);
                      asm_add(ASM_STR, sym_get_addr("!ADDR"), 0, NIL, 2);
                      sym_remove_lasts(sym_last()+1 - asm_push());
                      sym_add("_");}
    ;

callparams:
    callparams_void
  | callparams_full
  ;

callparams_void:
    %empty
  ;

callparams_full:
    expr
  | expr tCOMMA callparams_full
  ;

%%

void yyerror(const char *msg) {
  fprintf(stderr, "error: %s\n", msg);
  exit(1);
}

int main(void) {

  asm_add(ASM_AFF, 0, 255, NIL, 2);
  asm_add(ASM_STR, 0, 0, NIL, 2);
  asm_add(ASM_B, NIL, NIL, NIL, 1);

  printf("-1 - [START OF PROGRAM]\n");

  sym_init_tab();
  yyparse();

  asm_update(2, 1, fun_get_addr("main"));

  asm_print_tab();
}