%{
#include <stdio.h>
#include <stdlib.h>
#include "tabSymbole.h"
#include "asm_tab.h"
#define NIL -1
%}

%code provides {
  int yylex (void);
  void yyerror (const char *);
}

%union { 
    char* s;
    int i; 
    struct {int begin; int while_line; int end;} while_info;
}

%token <s> tID
%token <i> tNB
%token <while_info> tWHILE
%token tIF tELSE tPRINT tRETURN tINT tVOID tLT tLE tGT tGE tEQ tNEQ tASSIGN tADD tSUB tDIV tMUL tAND tOR tNOT tLBRACE tRBRACE tLPAR tRPAR tSEMI tCOMMA tERROR
%left tADD tSUB
%left tMUL tDIV


%%

/*  Départ 
    Les noms des noms terminaux sont assez explicites pour tracer un
    chemin de construction et comprendre ce qu'il se passe.
*/
functions:
    %empty
  | function functions
  ;

function:
    type tID tLPAR params tRPAR block
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
  tLBRACE  {inc_depth();} instructions tRBRACE {removeSym(); dec_depth();}
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

condins:
    tIF tLPAR expr tRPAR block
  | tIF tLPAR expr tRPAR block tELSE block
  ;


expr:
    term
  | tNOT expr
  | term tADD expr {add_asm(2, get_next_last(), get_next_last(), get_last(), 3); 
                  supp_last();}
  | term tSUB expr {add_asm(3, get_next_last(), get_next_last(), get_last(), 3); 
                  supp_last();}
  | term tMUL expr {add_asm(4, get_next_last(), get_next_last(), get_last(), 3); 
                  supp_last();}
  | term tDIV expr {add_asm(5, get_next_last(), get_next_last(), get_last(), 3); 
                  supp_last();}
  | term op expr {add_asm(0, get_next_last(), get_next_last(), get_last(), 3); 
                  supp_last();}
  | tLPAR expr tRPAR
  | tLPAR expr tRPAR op expr
  | tADD expr
  | tSUB expr {addSym("_"); 
               add_asm(0, get_last(), 0, NIL, 2);
               add_asm(3, get_next_last(), get_last(), get_next_last(), 3);
               supp_last(); }
  ;

term:
    tID {addSym("_");
          if (is_init($1))
            {add_asm(1, get_last(), get_addr($1), NIL, 2);}
          else
            {printf("Var not initialized\n"); exit(-1);}
        }
  | tNB {addSym("_"); 
         add_asm(0, get_last(), $1, NIL, 2); }
  | funccall
  ;

op:
    tASSIGN
  | tLT
  | tLE
  | tGT
  | tGE
  | tEQ
  | tNEQ
  | tAND
  | tOR
  ;

loop:
    tWHILE {$1.begin = asm_current();} 
    tLPAR expr { $1.while_line = asm_current();
                add_asm(7, NIL, get_last(), NIL, 2);} 
    tRPAR block {add_asm(6, $1.begin, NIL, NIL, 1);
                $1.end = asm_current();
                update_asm($1.while_line, 1, $1.end);}
  ;

/* Le print de l'exemple étant "print(a), j'ai opté pour un print python-like" */
print:
    tPRINT tLPAR expr tRPAR

assign:
    tID tASSIGN expr {set_sym_init(get_addr($1)); 
                     add_asm(1, get_addr($1), get_last(), NIL, 2);  
                     supp_last();} 
  ;

declar:
    tINT tID {addSym($2);}
  | tINT tID {addSym($2);} tASSIGN {set_sym_init(get_addr($2));} expr {add_asm(1, get_addr($2), get_last(), NIL, 2); 
                                                                        supp_last();}
  ;

/*ids:
    tID 
  | tID {addSym($1); printTab();} tCOMMA ids 
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
  initTab();
  yyparse();
  print_asm_tab();
}
