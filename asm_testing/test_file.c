/**
 * This is a sample C program to give to the analyzer as an input.

*/

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
    return result;
}

int main()
{
    int r;
    int c = ((2+4) * 2) - 0xa;
    c = c ^ 7;

    if (c >= 7)
    {
        print(c);
    }
    else
    {
        r = factorielle(c);
    }
    print(r);
    return r;
}