#ifndef ASM_TAB_H
#define ASM_TAB_H

/**
 * Instead of printing ASM instructions on-the-fly,
 * we use a 2D array to store them all and display
 * the whole code at the end.
 * 
 * Each row contains 5 items : opcode | parameters 1 to 3 | actual number of parameters.
 * 
 * The array being fixed size, the last parameter indicates 
 * how many are to be taken into account
*/



/*********************/
/*     FUNCTIONS     */
/*********************/


/**
 * Prints each instruction stored from first to last.
*/
void asm_print_tab();


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
void asm_add(int op, int p1, int p2, int p3, int nbp); 


/**
 * Updates a previously stored instruction.
 * 
 * @params
 * line : number of the instruction to update,
 * index : number of the parameter to update,
 * value : new value.
*/
void asm_update(int line, int index, int value); 


/**
 * Returns the current instruction number.
*/
int asm_current();

#endif