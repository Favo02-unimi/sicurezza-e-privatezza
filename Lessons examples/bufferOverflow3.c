#include <stdio.h>

int main(){
    int cookie;
    char buf[80];

    printf("buf: %08x cookie: %08x\n", &buf, &cookie);
    gets(buf);

    printf("you loose!\n");
}
