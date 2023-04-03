%option noyywrap
%option noinput
%option nounput

%{
#include "analyzer.tab.h"
%}

/*Ensemble des regles*/
%%
"//".*                  ;
"/*"(.*\n*)*"*/"        ;

"if"        {return tIF;}
"else"      {return tELSE;}
"while"     {return tWHILE;}
"print"     {return tPRINT;}
"return"    {return tRETURN;}
"int"       {return tINT;}
"void"      {return tVOID;}

[A-Za-z][A-Za-z0-9]*    {yylval.s = strdup(yytext); return tID;}

"0x"[0-9A-Ea-e]+        {yylval.i = (int)strtol(yytext, NULL, 16); return tNB;}
[0-9]+                {yylval.i = atoi(yytext); return tNB;}

"+"              {return tADD;}
"-"              {return tSUB;}
"*"              {return tMUL;}
"/"              {return tDIV;}

"<"              {return tLT;}
">"               {return tGT;}
"!="              {return tNEQ;}
"=="              {return tEQ;}
">="              {return tGE;}
"<="             {return tLE;}

"="               {return tASSIGN;}

"&&"              {return tAND;}
"||"            {return tOR;}
"!"               {return tNOT;}

"{"              {return tLBRACE;}
"}"              {return tRBRACE;}
"("              {return tLPAR;}
")"              {return tRPAR;}

";"               {return tSEMI;}
","               {return tCOMMA;}

[ \t\n]         {} //Ignorer les espaces et les retours a la ligne

.               {return tERROR;} //Si aucun autre pattern n a match

%%