#include "../lib/include/asm_tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int current_line = 0;
static int push_value = -1;


//Link between int and opcode string. NIL handles unimplemented op yet.
static char op_to_str[30][6] = {"NULL", "AFF", "COP", "ADD", "SUB", "MUL", "DIV", "CMP", "B", "BEQ", "BNE",
                                "BN", "BNZ", "BP", "BSP", "BF", "RET", "PUSH", "POP", "STR", "LDR", "PRINT",
                                "AND", "OR", "NOT", "XOR"};


//1024 instructions & 3 parameters maximum. To be changed if needed.
static int tab_asm[256][5];



/*********************/
/*     FUNCTIONS     */
/*********************/


/**
 * Prints each instruction stored from first to last.
*/
void asm_print_tab()
{
    for (int i = 0; i < current_line; i++)
    {
        printf("%d - %s ", i, op_to_str[tab_asm[i][0]]);

        for (int k = 1; k <= tab_asm[i][4]; k++)
        {
            printf("%d ", tab_asm[i][k]); 
        }
        printf("\n"); 
    }

    printf("%d - [END OF PROGRAM]", current_line);
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
    if (current_line == 1024)
    {
        printf("error: too many ASM instructions (max is 1024)\n\n");
        exit(-1);
    }

    else
    {
        tab_asm[current_line][0] = op;
        tab_asm[current_line][1] = p1; 
        tab_asm[current_line][2] = p2; 
        tab_asm[current_line][3] = p3; 
        tab_asm[current_line][4] = nbp;

        current_line ++;
    }
}


/**
 * Updates a previously stored instruction.
 * 
 * @params
 * line : number of the instruction to update,
 * index : index of the parameter to update,
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


/**
 * Sets the value to use for the next PUSH instruction.
 *
 * @params
 * value : offset wanted for the PUSH.
*/
void asm_set_push(int value)
{
    push_value = value;
}


/**
 * Gets the value to use for the next PUSH instruction.
*/
int asm_push()
{
    return push_value;
}