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
        
        char *envp[] = { "133=gzmovgdbao" };
        
        // NULL TERMINATED
        char *proc_args[] = {"/challenge/embryoio_level83", NULL};

        execve(proc_args[0], proc_args, envp);

    }
    else 
        waitpid(pid, &status, 0);
}

