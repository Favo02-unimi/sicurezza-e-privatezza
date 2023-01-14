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

    // mkdir("/tmp/keelvr", 0777);
    // chdir("/tmp/keelvr");

    int pid;
    int status;
    pid = fork();
    if (pid == 0) {
        char *args[2];
        args[0] = "/challenge/embryoio_level121";
        //args[1] = "aioxtvwrcm";

        int in, out;
        in = open("file", O_RDWR | O_CREAT);
        dup2(in, 0);

        //out = open("/tmp/hoerzc", O_WRONLY | O_TRUNC | O_CREAT, S_IRUSR | S_IRGRP | S_IWGRP | S_IWUSR);
        //dup2(out, 1);

        execve(args[0], args, NULL);
    }
    else 
        waitpid(pid, &status, 0);
}