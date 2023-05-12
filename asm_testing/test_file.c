/**
 * This is a sample C program to give to the analyzer as an input.

*/

int f() {return 34;}

int main()
{
    if (f() > 24)
    {
        return 34;
    }
    else
    {
        return 78;
    }
}