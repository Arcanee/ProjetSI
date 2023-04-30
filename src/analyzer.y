%{
#include <stdio.h>
#include <stdlib.h>
#include "../lib/include/sym_tab.h"
#include "../lib/include/asm_tab.h"
#include "../lib/include/fun_tab.h"

#define NIL -1 //Refers to a negligible parameter in the asm instruction table.

#define ASM_AFF 0
#define ASM_COP 1
#define ASM_ADD 2
#define ASM_SUB 3
#define ASM_MUL 4
#define ASM_DIV 5
#define ASM_B 6
#define ASM_NIL 7
#define ASM_CMP 8
#define ASM_BEQ 9
#define ASM_BNE 10
%}

%code provides {
  int yylex (void);
  void yyerror (const char *);
}

%union { 
    char* s;
    int i; 
    struct {int begin;
            int jmf_line;
            int end; } branch_info;
    int op;
}

%token <s> tID
%token <i> tNB
%token <branch_info> tIF tWHILE tELSE
%type <op> condition
%type <branch_info> ifheader


%token tPRINT tRETURN tINT tVOID tLT tLE tGT tGE tEQ tNEQ tASSIGN tADD tSUB tDIV tMUL tAND tOR tNOT tLBRACE tRBRACE tLPAR tRPAR tSEMI tCOMMA
%left tADD tSUB
%left tMUL tDIV


%%

functions:
    %empty
  | function functions
  ;

function:
    type tID tLPAR params tRPAR {fun_add($2, asm_current());} block
  ;

type:
    tINT
  | tVOID
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
    type tID
  | type tID tCOMMA params_full
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
  tIF tLPAR condition tRPAR  {$1.jmf_line = asm_current()-1;}
  block {$1.end = asm_current();
        $$.end = $1.end;
        $$.jmf_line = $1.jmf_line;
        asm_update($1.jmf_line, 1, $1.end);}
  ;

condins:
    ifheader
  | ifheader tELSE 
            {asm_add(ASM_B, NIL, NIL, NIL, 1); 
            $1.end = asm_current(); 
            asm_update($1.jmf_line, 1, $1.end);} 
            //update of the if branch 
    block {$2.end = asm_current(); 
            asm_update($1.end-1, 1, $2.end);} //update of the else branch 
  ;


expr:
    term
  | expr tADD expr {asm_add(ASM_ADD, sym_next_last(), sym_next_last(), sym_last(), 3); 
                  sym_remove_last();}
  | expr tSUB expr {asm_add(ASM_SUB, sym_next_last(), sym_next_last(), sym_last(), 3); 
                  sym_remove_last();}
  | expr tMUL expr {asm_add(ASM_MUL, sym_next_last(), sym_next_last(), sym_last(), 3); 
                  sym_remove_last();}
  | expr tDIV expr {asm_add(ASM_DIV, sym_next_last(), sym_next_last(), sym_last(), 3); 
                  sym_remove_last();}
  | tLPAR expr tRPAR
  | tADD expr
  | tSUB expr {sym_add("_"); 
               asm_add(ASM_AFF, sym_last(), 0, NIL, 2);
               asm_add(ASM_SUB, sym_next_last(), sym_last(), sym_next_last(), 3);
               sym_remove_last(); }
  ;

term:
    tID {sym_add("_");
          if (sym_is_init($1))
            {asm_add(ASM_COP, sym_last(), sym_get_addr($1), NIL, 2);}
          else
            {printf("error: uninitialized variable\n\n"); exit(-1);}
        }
  | tNB {sym_add("_"); 
         asm_add(ASM_AFF, sym_last(), $1, NIL, 2); }
  | funccall
  ;

condition:
    expr {sym_add("_"); 
         asm_add(ASM_AFF, sym_last(), 0, NIL, 2);
         asm_add(ASM_CMP, sym_next_last(), sym_last(), NIL, 2);
         sym_remove_last();
         $$ = ASM_BEQ;} // (expr) <=> (expr != 0)
         
  | tNOT expr {sym_add("_"); 
         asm_add(ASM_AFF, sym_last(), 0, NIL, 2);
         asm_add(ASM_CMP, sym_next_last(), sym_last(), NIL, 2);
         sym_remove_last();
         $$ = ASM_BNE;} // (!expr) <=> (expr == 0)

  /*| term tASSIGN expr 
  | term tLT expr
  | term tLE expr
  | term tGT expr
  | term tGE expr
  | term tOR expr
  | term tAND expr*/
  | expr tEQ expr {asm_add(ASM_CMP, sym_next_last(), sym_last(), NIL, 2); asm_add(ASM_BNE, NIL, NIL, NIL, 1); }
  | term tNEQ expr {asm_add(ASM_CMP, sym_next_last(), sym_last(), NIL, 2);asm_add(ASM_BEQ, NIL, NIL, NIL, 1); }
  ;

loop:
    tWHILE {$1.begin = asm_current();} 
    tLPAR condition { $1.jmf_line = asm_current();
                asm_add($4, NIL, NIL, NIL, 1);} 
    tRPAR block {asm_add(ASM_B, $1.begin, NIL, NIL, 1);
                $1.end = asm_current();
                asm_update($1.jmf_line, 1, $1.end);}
  ;

print:
    tPRINT tLPAR expr tRPAR

assign:
    tID tASSIGN expr {sym_set_init($1); 
                     asm_add(ASM_COP, sym_get_addr($1), sym_last(), NIL, 2);  
                     sym_remove_last();} 
  ;

declar:
    tINT tID {sym_add($2);}
  | tINT tID {sym_add($2);} tASSIGN {sym_set_init($2);} expr {asm_add(ASM_COP, sym_get_addr($2), sym_last(), NIL, 2); 
                                                                        sym_remove_last();}
  ;

/*ids:
    tID 
  | tID {sym_add($1); printTab();} tCOMMA ids 
  ;
*/

funcreturn:
    tRETURN expr
  ;

funccall:
    tID tLPAR callparams tRPAR
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
