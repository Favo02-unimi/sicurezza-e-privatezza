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
terminal 2:
    ./a.out

terminal 2:
    python evalpython.py

python script reads output that this process writes to "out" fifo, elaborates it and writes input to this process using "in" fifo
*/

void pwncollege() {

    mkfifo("./in", 0644);
    mkfifo("./out", 0644);

    int pid;
    int status;
    pid = fork();
    if (pid == 0) {

        char *args[2];
        args[0] = "/challenge/embryoio_level136";

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