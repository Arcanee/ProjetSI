#include "asm_tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int current_line = 0;

//Link between int and opcode string. NIL handles unimplemented op yet.
char op_to_str[10][5] = {"AFF", "COP", "ADD", "SUB", "MUL", "DIV", "JMP", "JMF", "NIL"};

//1024 instructions & 3 parameters maximum. To be changed if needed.
int tab_asm[1024][5];



/*********************/
/*     FUNCTIONS     */
/*********************/


/**
 * Prints each instruction stored from first to last.
*/
void asm_print_tab()
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

    printf("\n[END OF PROGRAM]\n\n");
}


/**
 * Adds a new instruction to the array.
 * 
 * @params 
 * op : opcode, see macros defined in analyzer.y for details,
 * p1 : first parameter,
 * p2 : second parameter,
 * p3 : third parameter,
 * nbp : number of non-empty parameters.
*/
void asm_add(int op, int p1, int p2, int p3, int nbp)
{ 
    tab_asm[current_line][0] = op;
    tab_asm[current_line][1] = p1; 
    tab_asm[current_line][2] = p2; 
    tab_asm[current_line][3] = p3; 
    tab_asm[current_line][4] = nbp;

    current_line ++;
}


/**
 * Updates a previously stored instruction.
 * 
 * @params
 * line : number of the instruction to update,
 * index : number of the parameter to update,
 * value : new value.
*/
void asm_update(int line, int index, int value)
{
    tab_asm[line][index] = value;
}


/**
 * Returns the current instruction number.
*/
int asm_current()
{
    return current_line;
}