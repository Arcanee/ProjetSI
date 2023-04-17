#include "asm_tab.h"
#include <stdio.h>
#include <stdlib.h>

static int current_line = 0; 


char op_to_str[10][5] = {"AFF", "COP", "ADD", "SUB", "MUL", "DIV"};

//tab_asm[x][4] is equal to the number of parameters of a line (MUL 1 2 3 => tab_asm[x][4] = 3)
int tab_asm[1024][5]; 


void print_asm_tab()
{
    for (int i = 0; i< current_line; i++)
    {
        printf("%s ", op_to_str[tab_asm[i][0]]);

        for (int k = 1; k <= tab_asm[i][4]; k++)
        {
            printf("%d ", tab_asm[i][k]); 
        }
        printf("\n"); 
    }
}
void add_asm(int op, int p1, int p2, int p3, int nbp)
{ 
    tab_asm[current_line][0] = op;
    tab_asm[current_line][1] = p1; 
    tab_asm[current_line][2] = p2; 
    tab_asm[current_line][3] = p3; 
    tab_asm[current_line][4] = nbp;

    current_line ++;
}
void update_asm(int i, int op, int p1, int p2, int p3, int nbp)
{
    tab_asm[i][0] = op;
    tab_asm[i][1] = p1; 
    tab_asm[i][2] = p2; 
    tab_asm[i][3] = p3; 
    tab_asm[i][4] = nbp; 
}  

