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


// Executes the command "proc1 | proc2 | proc3"
pwncollege() {
    int status;
    int i;

    // arguments for commands, terminated with NULL (credo sia l'env)

    char *proc1_args[] = {"cat", "out.txt", "-", NULL};
    char *proc2_args[] = {"rev", NULL};
    char *proc3_args[] = {"/challenge/embryoio_level65", NULL};

    // make 2 pipes; each has 2 fds

    int pipes[4];
    pipe(pipes); // sets up 1st pipe
    pipe(pipes + 2); // sets up 2nd pipe

    // we now have 4 fds:
    // pipes[0] = read end of cat->grep pipe (read by grep)
    // pipes[1] = write end of cat->grep pipe (written by cat)
    // pipes[2] = read end of grep->cut pipe (read by cut)
    // pipes[3] = write end of grep->cut pipe (written by grep)

    // Note that the code in each if is basically identical, so you
    // could set up a loop to handle it.  The differences are in the
    // indicies into pipes used for the dup2 system call
    // and that the 1st and last only deal with the end of one pipe.

    // fork the first child (to execute cat)

    if (fork() == 0) {
        // replace cat's stdout with write part of 1st pipe

        dup2(pipes[1], 1);

        // close all pipes (very important!); end we're using was safely copied

        close(pipes[0]);
        close(pipes[1]);
        close(pipes[2]);
        close(pipes[3]);

        execvp(*proc1_args, proc1_args);
    }
    else {
        // fork second child (to execute grep)

        if (fork() == 0) {
            // replace grep's stdin with read end of 1st pipe
            
            dup2(pipes[0], 0);

            // replace grep's stdout with write end of 2nd pipe

            dup2(pipes[3], 1);

            // close all ends of pipes

            close(pipes[0]);
            close(pipes[1]);
            close(pipes[2]);
            close(pipes[3]);

            execvp(*proc2_args, proc2_args);
        }
        else {
        // fork third child (to execute cut)

            if (fork() == 0) {
                // replace cut's stdin with input read of 2nd pipe

                dup2(pipes[2], 0);

                // close all ends of pipes

                close(pipes[0]);
                close(pipes[1]);
                close(pipes[2]);
                close(pipes[3]);

                execvp(*proc3_args, proc3_args);
            }
        }
    }

    // only the parent gets here and waits for 3 children to finish
    
    close(pipes[0]);
    close(pipes[1]);
    close(pipes[2]);
    close(pipes[3]);

    for (i = 0; i < 3; i++)
        wait(&status);
}
