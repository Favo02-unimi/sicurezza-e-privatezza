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
        // mkdir("/tmp/jgbvtv", 0777);
        // chdir("/tmp/jgbvtv");

        // NULL TERMINATED
        char *proc_args[] = {"/challenge/embryoio_level137", NULL};

        execvp(*proc_args, proc_args);
    }
    else 
        waitpid(pid, &status, 0);
}

