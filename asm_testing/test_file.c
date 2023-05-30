/**
 * This is a sample C program to give to the analyzer as an input.

*/

// TESTER SANS METTRE DE PARAMETRE AU MAIN

int factorielle(int n)
{
    int result = 0;
    if (n == 0)
    {
        result = 1;
    }
    else
    {
        result = factorielle(n-1) * n;
    }
    print(result);
    return result;
}

int main(int a)
{
    if (a)
    {
        int i = factorielle(a);
    }
    else
    {
        print(0xee);
    }
}