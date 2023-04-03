#include "tabSymbole.h"
#include <stdio.h>
#include <stdlib.h>

int main()
{
    struct Symbol a = {"a", 0, 0};
    struct Symbol b = {"b", 1, 1};
    struct Symbol c = {"c", 0, 1};
    struct Symbol d = {"d", 1, 2};

    initTab();
    addSym(b);
    addSym(c);
    addSym(d);
    removeSym();
    removeSym();
    printTab();
    return 0;
}
