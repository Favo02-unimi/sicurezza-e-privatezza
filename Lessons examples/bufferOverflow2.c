#include<stdio.h>

int x = 0;

int function() {
    int * ret;
    x = x + 13;
    //__asm__("int3");
    ret = (int *)&ret + 4;
    //__asm__("int3");
    (*ret) = (*ret) + 8;
}

void main() {
    x = function();
    x = 10;
    printf("Value of x = %d\n", x);
}