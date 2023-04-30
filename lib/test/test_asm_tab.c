#include "../include/asm_tab.h"
#include <stdio.h>
#include <stdlib.h>

/**
 * This is a test file for the asm_tab library.
*/

int main()
{
    asm_add(0, 0, 0, -1, 2);
    asm_add(1, 0, 1, -1, 2);
    asm_add(2, 2, 2, -1, 2);
    asm_add(3, 3, 0, -1, 2);

    asm_print_tab();
    printf("\n\n");

    asm_update(1, 0, 2);
    asm_update(1, 1, 2);
    asm_update(1, 2, 2);

    //Lines 2 & 3 should be the same
    asm_print_tab();

    return 0;
}
