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

void pwncollege() { 

    int pid;
    int status;
    pid = fork();
    if (pid == 0) {

        char *args[2];
        args[0] = "ioxprq";

        execve("/challenge/embryoio_level115", args, NULL);
    }
    else 
        waitpid(pid, &status, 0);
}