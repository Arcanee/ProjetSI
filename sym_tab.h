#ifndef SYM_TAB_H
#define SYM_TAB_H

#define SYM_MAXSIZE 16


/**
 * This is the implementation of the symbol table.
 * 
 * A symbol contains the information of a declared or 
 * a temporary variable in the scope.
 * 
 * Thus all symbols are stored in the symbol table.
 * 
 * It ensures legal use of variable definition / declaration
 * and arithmetic / boolean expressions. 
*/


/**
 * A symbol is a struct.
 * 
 * @members
 * name : either a mock name (temporary variable) or the existing name of a variable. MAXSIZE is to be changed if needed (see defined macro above),
 * init : boolean indicating if the variable has already been initialized,
 * depth : level of depth (in terms of blocks) in the source code.
*/
struct Symbol {
    char name[SYM_MAXSIZE];
    int init;
    int depth;
};


/**
 * The table is also a struct. It contains a 1D array which is the actual symbol table.
 * The size of the array grows with realloc() when symbols are added.
 * Thus it has an O(1) access time but can be resized if needed.
 * 
 * @members
 * size : number of rows in the table,
 * nb_symbol : number of symbols in the table,
 * current_depth : depth of the last symbol added, which is the maximum at any time,
 * table : pointer on the array.
*/
struct Symbol_Tab {
    int size; 
    int nb_symbol;
    int current_depth;
    struct Symbol* table;
};



/*********************/
/*     FUNCTIONS     */
/*********************/


/**
 * Initializes the structs, making the functions usable.
*/
void sym_init_tab();


/**
 * Clears every entry of the table, without affecting its size.
*/
void sym_clear_tab();


/**
 * Adds a new symbol entry in the table, with the given name.
 * The depth is already determined by the number of blocks entered.
 * A new symbol is marked as uninitialized at first.
 * 
 * @params
 * s : name of the symbol.
*/
void sym_add(char *s);


/**
 * Clears all the symbols at the current depth, then decrements the depth by 1.
*/
void sym_clear();


/**
 * Prints a symbol on the standard output as follows :
 * name | init | depth.
 * 
 * @params
 * s : symbol to be printed.
*/
void sym_print(struct Symbol s);


/**
 * Prints the whole table, using sym_print() on each row.
*/
void sym_print_tab();


/**
 * Returns the current depth of the table.
*/
int sym_current_depth(); 


/**
 * Increments the current depth by 1.
*/
void sym_inc_depth();


/**
 * Decrements the current depth by 1.
*/
void sym_dec_depth();


/**
 * Sets the symbol with the given name to "initialized".
 * 
 * If multiple symbols with the same name are known, the most
 * recent one (with biggest depth, i.e. smallest scope) is chosen.
 * 
 * @params
 * s : name of the symbol.
*/
void sym_set_init(char* s);


/**
 * Returns true if the symbol with the given name is initialized.
 * 
 * If multiple symbols with the same name are known, the most
 * recent one (with biggest depth, i.e. smallest scope) is chosen.
 * 
 * @params
 * s : name of the symbol.
*/
int sym_is_init(char* s);


/**
 * Returns the array index of the symbol with the given name.
 * 
 * If multiple symbols with the same name are known, the most
 * recent one (with biggest depth, i.e. smallest scope) is chosen.
 * 
 * @params
 * s : name of the symbol.
*/
int sym_get_addr(char* s);


/**
 * Returns true if a symbol with the given name
 * already exists at this depth.
 * 
 * @params
 * s : name of the symbol.
*/
int sym_check_duplicate(char* s);


/**
 * Returns the array index of the last symbol added.
*/
int sym_last(); 


/**
 * Returns the array index of the penultimate symbol added.
*/
int sym_next_last();


/**
 * Clears the last symbol added.
*/
void sym_remove_last();


#endif