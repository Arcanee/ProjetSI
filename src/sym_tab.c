#include "../lib/include/sym_tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//The table is a global variable only accessible in this file. Implementation is much easier this way, without being unsafe.
static struct Symbol_Tab tab;

//Allows functions to execute only if table is initialized.
static int init = 0;



/*********************/
/*     FUNCTIONS     */
/*********************/


/**
 * Initializes the structs, making the functions usable.
*/
void sym_init_tab()
{
    if (!init)
    {
        tab.size = 4;
        tab.nb_symbol = 0;
        tab.current_depth = -1;
        tab.table = malloc(4*sizeof(struct Symbol));
        init++;
    }

    else
    {
        printf("error: symbol table has not been initialized\n\n");
        exit(-1);
    }
}


/**
 * Clears every entry of the table, without affecting its size.
*/
void sym_clear_tab()
{
    if (init) {
        tab.nb_symbol = 0; 
    }

    else
    {
        printf("error: symbol table has not been initialized\n\n");
        exit(-1);
    }
}


/**
 * Adds a new symbol entry in the table, with the given name.
 * The depth is already determined by the number of blocks entered.
 * A new symbol is marked as uninitialized at first.
 * 
 * @params
 * s : name of the symbol.
*/
void sym_add(char *s)
{
    if (init)
    {
        if (tab.size == tab.nb_symbol)
        {
            tab.table = realloc(tab.table, 2*tab.size*sizeof(struct Symbol)); 
            tab.size = 2*tab.size; 
        }

        //Check duplicates
        if (sym_check_duplicate(s))
        {
            printf("error: redefinition of variable\n\n");
            exit(-1);
        }

        strcpy(tab.table[tab.nb_symbol].name, s); 
        tab.table[tab.nb_symbol].depth = tab.current_depth; 
        tab.table[tab.nb_symbol].init = 0; 
        tab.nb_symbol += 1; 
    }

    else
    {
        printf("error: symbol table has not been initialized\n\n");
        exit(-1);
    }
}


/**
 * Clears all the symbols at the current depth, then decrements the depth by 1.
*/
void sym_clear()
{
    if (init)
    {
        while (tab.nb_symbol > 0 && tab.current_depth == tab.table[tab.nb_symbol-1].depth)
        {
            tab.nb_symbol -= 1;
        }

        tab.current_depth --;
    }

    else
    {
        printf("error: symbol table has not been initialized\n\n");
        exit(-1);
    }
}


/**
 * Prints a symbol on the standard output as follows :
 * name | init | depth.
 * 
 * @params
 * s : symbol to be printed.
*/
void sym_print(struct Symbol s)
{
    printf("name: %s | init: %d | depth: %d\n", s.name, s.init, s.depth);
}


/**
 * Prints the whole table, using sym_print() on each row.
*/
void sym_print_tab()
{
    if (init)
    {
        printf("[size = %d] [curr_depth = %d] [nb_sym = %d]\n", tab.size, tab.current_depth, tab.nb_symbol);

        for (int i = 0; i < tab.nb_symbol; i++)
        {
            sym_print(tab.table[i]);
        }

        printf("\n\n");
    }

    else
    {
        printf("error: symbol table has not been initialized\n\n");
        exit(-1);
    }
}


/**
 * Returns the current depth of the table.
*/
int sym_current_depth()
{
    if (init)
    {
        return tab.current_depth;
    }

    else
    {
        printf("error: symbol table has not been initialized\n\n");
        exit(-1);
    }
}


/**
 * Increments the current depth by 1.
*/
void sym_inc_depth()
{
    if (init)
    {
        tab.current_depth++;
    }
    
    else
    {
        printf("error: symbol table has not been initialized\n\n");
        exit(-1);
    }
}


/**
 * Decrements the current depth by 1.
*/
void sym_dec_depth()
{
     if (init)
    {
        tab.current_depth--;
    }
    
    else
    {
        printf("error: symbol table has not been initialized\n\n");
        exit(-1);
    }
}


/**
 * Sets the symbol with the given name to "initialized".
 * 
 * If multiple symbols with the same name are known, the most
 * recent one (with biggest depth, i.e. smallest scope) is chosen.
 * 
 * @params
 * s : name of the symbol.
*/
void sym_set_init(char* s)
{
    if (init)
    {
        tab.table[sym_get_addr(s)].init = 1;
    }
    
    else
    {
        printf("error: symbol table has not been initialized\n\n");
        exit(-1);
    }
}


/**
 * Returns true if the symbol with the given name is initialized.
 * 
 * If multiple symbols with the same name are known, the most
 * recent one (with biggest depth, i.e. smallest scope) is chosen.
 * 
 * @params
 * s : name of the symbol.
*/
int sym_is_init(char* s)
{
    if (init)
    {
        return tab.table[sym_get_addr(s)].init;
    }
    
    else
    {
        printf("error: symbol table has not been initialized\n\n");
        exit(-1);
    }
}


/**
 * Returns the array index of the symbol with the given name.
 * 
 * If multiple symbols with the same name are known, the most
 * recent one (with biggest depth, i.e. smallest scope) is chosen.
 * 
 * @params
 * s : name of the symbol.
*/
int sym_get_addr(char* s)
{
    if (init)
    {
        int addr = -1; 

        for (int i = 0; i < tab.nb_symbol; i++)
        {
            if (!strcmp(s, tab.table[i].name))
            {
                addr = i; 
            }
        }

        if (addr ==  -1)
        {
            printf("error: unknown variable %s\n\n", s); 
            exit(-1); 
        }

        return addr;
    }
    
    else
    {
        printf("error: symbol table has not been initialized\n\n");
        exit(-1);
    } 
}


/**
 * Returns true if a symbol with the given name
 * already exists at this depth.
 * 
 * @params
 * s : name of the symbol.
*/
int sym_check_duplicate(char* s)
{
    if (init)
    {
        int res = 0; 

        if (strcmp(s, "_"))
        {
            for (int i = 0; i < tab.nb_symbol; i++)
            {   
                if (tab.table[i].depth == tab.current_depth && !strcmp(s, tab.table[i].name))
                {
                    res = 1; 
                    printf("duplicate between %s and %s\n", s, tab.table[i].name);
                }
            }
        }

        return res;
    }
    
    else
    {
        printf("error: symbol table has not been initialized\n\n");
        exit(-1);
    } 
}


/**
 * Returns the array index of the last symbol added.
*/
int sym_last()
{
    if (init)
    {
        return tab.nb_symbol-1;
    }
    
    else
    {
        printf("error: symbol table has not been initialized\n\n");
        exit(-1);
    }
}


/**
 * Returns the array index of the penultimate symbol added.
*/
int sym_next_last()
{
    if (init)
    {
        return tab.nb_symbol-2;
    }
    
    else
    {
        printf("error: symbol table has not been initialized\n\n");
        exit(-1);
    }
}


/**
 * Clears the last symbol added.
*/
void sym_remove_last()
{
    if (init)
    {
        tab.nb_symbol--; 
    }
    
    else
    {
        printf("error: symbol table has not been initialized\n\n");
        exit(-1);
    }
}