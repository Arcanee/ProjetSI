%{
#include <stdio.h>
#include <stdlib.h>
#include "tabSymbole.h"
%}

%code provides {
  int yylex (void);
  void yyerror (const char *);
}

%union { 
    char* s;
    int i; 
}

%token <s> tID
%token <i> tNB
%token tIF tELSE tWHILE tPRINT tRETURN tINT tVOID tADD tSUB tMUL tDIV tLT tLE tGT tGE tEQ tNEQ tASSIGN tAND tOR tNOT tLBRACE tRBRACE tLPAR tRPAR tSEMI tCOMMA tERROR

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
  | term op expr
  | tLPAR expr tRPAR
  | tLPAR expr tRPAR op expr
  | tADD expr
  | tSUB expr
  ;

term:
    tID
  | tNB
  | funccall
  ;

op:
    tASSIGN
  | tADD
  | tSUB
  | tMUL
  | tDIV
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
    tWHILE tLPAR expr tRPAR block
  ;

/* Le print de l'exemple étant "print(a), j'ai opté pour un print python-like" */
print:
    tPRINT tLPAR expr tRPAR

assign:
    ids tASSIGN expr
  ;

declar:
    tINT ids 
  | tINT  ids tASSIGN {set_sym_init();} expr 
  ;

ids:
    tID { addSym($1); printTab();}
  | tID { addSym($1); printTab();} tCOMMA ids 
  ;

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
}
