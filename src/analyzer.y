%{
#include <stdio.h>
#include <stdlib.h>
#include "../lib/include/sym_tab.h"
#include "../lib/include/asm_tab.h"
#include "../lib/include/fun_tab.h"

#define NIL -1 //Refers to a negligible parameter in the asm instruction table.

#define ASM_AFF 0
#define ASM_ADD 1
#define ASM_SUB 2
#define ASM_MUL 3
#define ASM_DIV 4
#define ASM_B 5
#define ASM_NIL 6
#define ASM_CMP 7
#define ASM_BEQ 8
#define ASM_BNE 9
#define ASM_RET 10
#define ASM_PSH 11
#define ASM_POP 12
#define ASM_BF 13
#define ASM_STR 14
#define ASM_LDR 15
#define ASM_BN 16
#define ASM_BNZ 17
#define ASM_BP 18
#define ASM_BSP 19
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

%token tPRINT tRETURN tINT tVOID tLT tLE tGT tGE tEQ tNEQ tASSIGN tADD tSUB tDIV tMUL tAND tOR tNOT tLBRACE tRBRACE tLPAR tRPAR tSEMI tCOMMA
%left tADD tSUB
%left tMUL tDIV

%left tOR
%left tAND

%%

functions:
    %empty
  | function functions
  ;

function:
    type tID tLPAR {sym_inc_depth(); sym_add("?ADDR");
                    sym_add("?VAL");}

    params tRPAR {fun_add($2, asm_current(), $1);} 
    
    block {asm_add(ASM_RET, 0, NIL, NIL, 1); sym_clear();}
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

params_full:
    tINT tID {sym_add($2);}
  | tINT tID tCOMMA {sym_add($2);} params_full
  ;

block:
  tLBRACE  {sym_inc_depth();} instructions tRBRACE {sym_clear();}
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
  | expr tADD expr {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                    asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_ADD, 0, 0, 1, 3);
                    asm_add(ASM_STR, 0, sym_next_last(), NIL, 2); 
                    sym_remove_last();}

  | expr tSUB expr {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                    asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_SUB, 0, 0, 1, 3);
                    asm_add(ASM_STR, 0, sym_next_last(), NIL, 2); 
                    sym_remove_last();}

  | expr tMUL expr {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                    asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_MUL, 0, 0, 1, 3);
                    asm_add(ASM_STR, 0, sym_next_last(), NIL, 2); 
                    sym_remove_last();}

  | expr tDIV expr {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                    asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_DIV, 0, 0, 1, 3);
                    asm_add(ASM_STR, 0, sym_next_last(), NIL, 2); 
                    sym_remove_last();}

  | tLPAR expr tRPAR
  | tADD expr
  | tSUB expr {sym_add("_"); 
               asm_add(ASM_AFF, 0, 0, NIL, 2);
               asm_add(ASM_STR, 0, sym_last(), NIL, 2);
               asm_add(ASM_LDR, 0, sym_last(), NIL, 2);
               asm_add(ASM_LDR, 1, sym_next_last(), NIL, 2);
               asm_add(ASM_SUB, 0, 0, 1, 3);
               asm_add(ASM_STR, 0, sym_next_last(), NIL, 2);
               sym_remove_last();}
  ;

term:
    tID {sym_add("_");
         asm_add(ASM_LDR, 0, sym_get_addr($1), NIL, 2); 
         asm_add(ASM_STR, 0, sym_last(), NIL, 2); }
  | tNB {sym_add("_"); 
         asm_add(ASM_AFF, 0, $1, NIL, 2);
         asm_add(ASM_STR, 0, sym_last(), NIL, 2);}
  | funccall
  ;

condition:
    expr {sym_add("_"); 
          asm_add(ASM_AFF, 0, 0, NIL, 2);
          asm_add(ASM_STR, 0, sym_last(), NIL, 2);
          asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
          asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
          asm_add(ASM_CMP, 0, 1, NIL, 2);
          asm_add(ASM_BEQ, NIL, NIL, NIL, 1);
          sym_remove_last();
          sym_remove_last(); // (expr) <=> (expr != 0)
          $$ = 0;}
         
  | tNOT expr {sym_add("_"); 
               asm_add(ASM_AFF, 0, 0, NIL, 2);
               asm_add(ASM_STR, 0, sym_last(), NIL, 2);
               asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
               asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
               asm_add(ASM_CMP, 0, 1, NIL, 2);
               asm_add(ASM_BNE, NIL, NIL, NIL, 1);
               sym_remove_last();
               sym_remove_last(); // (!expr) <=> (expr == 0)
               $$ = 0;}

  
  | expr tLT expr {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                   asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_CMP, 0, 1, NIL, 2);
                   asm_add(ASM_BP, NIL, NIL, NIL, 1); //0 is considered positive
                   sym_remove_last();
                   sym_remove_last();
                   $$ = 0;}

  | expr tLE expr {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                   asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_CMP, 0, 1, NIL, 2);
                   asm_add(ASM_BSP, NIL, NIL, NIL, 1);
                   sym_remove_last();
                   sym_remove_last();
                   $$ = 0;}

  | expr tGT expr {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                   asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_CMP, 0, 1, NIL, 2);
                   asm_add(ASM_BNZ, NIL, NIL, NIL, 1);
                   sym_remove_last();
                   sym_remove_last();
                   $$ = 0;}

  | expr tGE expr {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                   asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_CMP, 0, 1, NIL, 2);
                   asm_add(ASM_BN, NIL, NIL, NIL, 1);
                   sym_remove_last();
                   sym_remove_last();
                   $$ = 0;}

  | expr tOR expr {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2); //CMP e1 & 0
                   sym_add("_");
                   asm_add(ASM_AFF, 1, 0, NIL, 2);
                   asm_add(ASM_STR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_CMP, 0, 1, NIL, 2);
                   asm_add(ASM_BNE, asm_current()+3, NIL, NIL, 1);

                   asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2); //CMP e2 & 0
                   asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_CMP, 0, 1, NIL, 2);
                   asm_add(ASM_BEQ, NIL, NIL, NIL, 1);

                   sym_remove_last(); //remove 0, e2, e1
                   sym_remove_last();
                   sym_remove_last();
                   $$ = 0;}

  | expr tAND expr {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2); //CMP e1 & 0
                    sym_add("_");
                    asm_add(ASM_AFF, 1, 0, NIL, 2);
                    asm_add(ASM_STR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_CMP, 0, 1, NIL, 2);
                    asm_add(ASM_BEQ, NIL, NIL, NIL, 1);

                    asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2); //CMP e2 & 0
                    asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_CMP, 0, 1, NIL, 2);
                    asm_add(ASM_BEQ, NIL, NIL, NIL, 1);

                    sym_remove_last(); //remove 0, e2, e1
                    sym_remove_last();
                    sym_remove_last();
                    $$ = 1;}

  | expr tEQ expr {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                   asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_CMP, 0, 1, NIL, 2);
                   asm_add(ASM_BNE, NIL, NIL, NIL, 1);
                   sym_remove_last();
                   sym_remove_last();
                   $$ = 0;}

  | expr tNEQ expr {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                    asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_CMP, 0, 1, NIL, 2);
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
    tPRINT tLPAR expr tRPAR

assign:
    tID tASSIGN expr {sym_set_init($1); 
                      asm_add(ASM_LDR, 0, sym_last(), NIL, 2);
                      asm_add(ASM_STR, 0, sym_get_addr($1), NIL, 2);  
                      sym_remove_last();} 
  ;

declar:
    tINT tID {sym_add($2);}
  | tINT tID {sym_add($2);} tASSIGN {sym_set_init($2);} expr {asm_add(ASM_LDR, 0, sym_last(), NIL, 2);
                                                              asm_add(ASM_STR, 0, sym_get_addr($2), NIL, 2); 
                                                              sym_remove_last();}
  ;

/*ids:
    tID 
  | tID {sym_add($1); printTab();} tCOMMA ids 
  ;
*/

funcreturn:
    tRETURN expr {asm_add(ASM_LDR, 0, sym_last(), NIL, 2);
                  asm_add(ASM_STR, 0, sym_get_addr("?VAL"), NIL, 2); 
                  sym_remove_last();
                  asm_add(ASM_RET, 0, NIL, NIL, 1);}
  ;

funccall:
    tID tLPAR {asm_set_push(sym_last()+1);
               sym_add("!ADDR"); sym_add("!VAL");} 
    
    callparams tRPAR {if (fun_is_void($1))
                      {printf("error: function %s has no return value", $1);
                       exit(-1);}
      
                      asm_add(ASM_PSH, asm_push(), NIL, NIL, 1);
                      asm_add(ASM_BF, fun_get_addr($1), NIL, NIL, 1);
                      asm_add(ASM_POP, asm_push(), NIL, NIL, 1);
                      asm_add(ASM_LDR, 0, sym_get_addr("!VAL"), NIL, 2);
                      asm_add(ASM_STR, 0, sym_get_addr("!ADDR"), NIL, 2);
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

  asm_add(ASM_B, NIL, NIL, NIL, 1);

  printf("-1 - [START OF PROGRAM]\n");

  sym_init_tab();
  yyparse();

  asm_update(0, 1, fun_get_addr("main"));

  asm_print_tab();
}