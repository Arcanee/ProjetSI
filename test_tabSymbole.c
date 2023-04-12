#include "tabSymbole.h"
#include <stdio.h>
#include <stdlib.h>

int main()
{
  
    initTab();
    
    addSym("a");
    inc_depth();
    addSym("b");
    inc_depth();
    addSym("c");
    inc_depth();
    addSym("d");
    inc_depth();
    addSym("e");


    printTab();
    return 0;
}
