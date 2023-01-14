#include <stdlib.h>
#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>

main() {
    pwncollege();
}


// in > cat | /challenge/embryoio_level139 | cat > out
// "in" and "out" fifos are read by python that calculates the result
pwncollege() {

    mkfifo("./in", 0644);
    mkfifo("./out", 0644);

    int status;
    int i;

    char *proc1_args[] = {"cat", NULL};
    char *proc2_args[] = {"/challenge/embryoio_level139", NULL};
    char *proc3_args[] = {"cat", NULL};

    int pipes[4];
    pipe(pipes);
    pipe(pipes + 2);

    if (fork() == 0) {

        int in;
        in = open("in", O_RDWR | O_CREAT);
        dup2(in, 0);

        dup2(pipes[1], 1);

        close(pipes[0]);
        close(pipes[1]);
        close(pipes[2]);
        close(pipes[3]);

        execvp(*proc1_args, proc1_args);
    }
    else {

        if (fork() == 0) {
        
            dup2(pipes[0], 0);

            dup2(pipes[3], 1);

            close(pipes[0]);
            close(pipes[1]);
            close(pipes[2]);
            close(pipes[3]);

            execvp(*proc2_args, proc2_args);
        }
        else {

            if (fork() == 0) {

                dup2(pipes[2], 0);

                int out;
                out = open("out", O_RDWR | O_CREAT);
                dup2(out, 1);

                close(pipes[0]);
                close(pipes[1]);
                close(pipes[2]);
                close(pipes[3]);

                execvp(*proc3_args, proc3_args);
            }
        }
    }

    close(pipes[0]);
    close(pipes[1]);
    close(pipes[2]);
    close(pipes[3]);

    wait(NULL);
}
