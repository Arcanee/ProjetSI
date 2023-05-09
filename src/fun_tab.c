#include "../lib/include/fun_tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_FUN 10

//10 functions maximum, to be changed if needed.
static struct Function tab_fun[MAX_FUN];

//Current index of the tab.
static int tab_index = 0;


/*********************/
/*     FUNCTIONS     */
/*********************/


/**
 * Adds a function to the table.
 *
 * @params
 * s : name of the function,
 * addr : the line at which the fuction begins in the ASM tab,
 * ret : true if the function is of type non-void, false instead.
*/
void fun_add(char* s, int addr, int ret)
{
    if (tab_index == 10)
    {
        printf("error: too many functions declared (max is 10)\n\n");
        exit(-1);
    }

    else
    {
        strcpy(tab_fun[tab_index].name, s);
        tab_fun[tab_index].addr = addr;
        tab_fun[tab_index].ret = ret;
        tab_index++;
    }
}


/**
 * Prints each function stored from first to last.
*/
void fun_print_tab()
{
    printf("Function table:\n");
    for (int i = 0; i < tab_index; i++)
    {
        printf("%s - %d - %d", tab_fun[i].name, tab_fun[i].addr, tab_fun[i].ret);
        printf("\n");
    }

    printf("\n");
}


/**
 * Returns the addr of the function with the given name.
 *
 * @params
 * s : the name of the function.
*/
int fun_get_addr(char* s)
{
    int addr = -1; 

    for (int i = 0; i < tab_index; i++)
    {
        if (!strcmp(s, tab_fun[i].name))
        {
            addr = tab_fun[i].addr; 
        }
    }

    if (addr ==  -1)
    {
        printf("error: unknown function %s\n\n", s); 
        exit(-1); 
    }

    return addr;
}