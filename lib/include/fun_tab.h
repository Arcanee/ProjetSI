#ifndef FUN_TAB_H
#define FUN_TAB_H

#define FUN_MAXSIZE 16

/**
 * The function table stores the names and 
 * addresses of each function of the program.
*/


/**
 * A function is a struct, thus we can store its info.
 * 
 * @members
 * name : the name of a function. MAXSIZE is to be changed if needed (see defined macro above),
 * addr : the address at which the function begins,
 * ret : boolean that is true if the function is expected to return something (int), false instead (void).
*/
struct Function {
    char name[FUN_MAXSIZE];
    int addr;
    int ret;
};



/*********************/
/*     FUNCTIONS     */
/*********************/


/**
 * Adds a function to the table.
 * @params
 * s : name of the function,
 * addr : the line at which the fuction begins in the ASM tab,
 * ret : true if the function is of type non-void, false instead.
*/
void fun_add(char* s, int addr, int ret);


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


/**
 * Returns the index of the function with the given name.
 *
 * @params
 * s : the name of the function.
*/
int fun_get_index(char* s);


/**
 * Returns true if the given function is void.
 *
 * @params
 * s : the name of the function.
*/
int fun_is_void(char* s);


#endif