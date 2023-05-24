/**
 * This is a sample C program to give to the analyzer as an input.

*/
int f() {return 55;}

int main()
{
    int b = 10;
    b = b + f();
    return b;
}