#ifndef FUN_TAB_H
#define FUN_TAB_H

#define FUN_MAXSIZE 16

/**
 * The function table stores the names and 
 * addresses of each function of the program.
*/


/**
 * A function is a struct, thus we can store an id (string) + an address (int).
 * 
 * @members
 * name : the name of a function. MAXSIZE is to be changed if needed (see defined macro above),
 * addr : the address at which the function begins.
*/
struct Function {
    char name[FUN_MAXSIZE];
    int addr;
};



/*********************/
/*     FUNCTIONS     */
/*********************/


/**
 * Adds a function to the table.
 * @params
 * s : name of the function,
 * addr : the line at which the fuction begins in the ASM tab
*/
void fun_add(char* s, int addr);


/**
 * Prints each function stored from first to last.
*/
void fun_print_tab();


/**
 * Returns the addr of the function with the given name.
 *
 * @params
 * s : the name of the function.
*/
int fun_get_addr(char* s);


#endif