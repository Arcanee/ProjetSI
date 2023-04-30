#include "../include/fun_tab.h"
#include <stdio.h>
#include <stdlib.h>

/**
 * This is a test file for the fun_tab library.
*/

int main()
{
    
    fun_add("f1", 4);
    fun_add("f2", 12);

    fun_print_tab();

    //Should return 12
    fun_get_addr("f2");

    //Should exit
    fun_get_addr("f0");
    
    return 0;
}
