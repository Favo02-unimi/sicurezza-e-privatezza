#include <stdlib.h>
#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>

int main( void ) {
    pwncollege();
}

/*
mkfifo in
mkfifo out

terminal 1:
    cat - > in

terminal 2:
    ./a.out

terminal 3:
    cat out

*/

void pwncollege() {
    int pid;
    int status;
    pid = fork();
    if (pid == 0) {

        char *args[2];
        args[0] = "/challenge/embryoio_level119";
        //args[1] = "aioxtvwrcm";

        int in, out;

        in = open("in", O_RDWR | O_CREAT);
        dup2(in, 0);

        out = open("out", O_RDWR | O_CREAT);
        dup2(out, 1);

        execve(args[0], args, NULL);
    }
    else 
        waitpid(pid, &status, 0);
}
