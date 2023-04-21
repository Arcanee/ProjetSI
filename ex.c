/**
 * This is a sample C program to give to the analyzer as an input.

*/
int f()
{
    int a  = 2; 
    return a; 
}
int main() 
{
    int a = 1;

    if (a == 1)
    {
        int b = 2;
        a = 0;
    }
    else{
        a = 5;
        b=4;
    }
    a = 4;
    f()
}

