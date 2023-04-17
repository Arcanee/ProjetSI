#include "sym_tab.h"
#include <stdio.h>
#include <stdlib.h>

/**
 * This is a test file for the sym_tab library.
*/

int main()
{
  
    sym_init_tab();
    
    sym_add("a");
    sym_inc_depth();
    sym_add("b");
    sym_inc_depth();
    sym_add("c");
    sym_inc_depth();
    sym_add("d");
    sym_inc_depth();
    sym_add("e");


    sym_print_tab();
    return 0;
}
