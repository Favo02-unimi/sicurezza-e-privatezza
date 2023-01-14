#include <arpa/inet.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <sys/stat.h>

/*
terminal 1: /challenge/embryoio_level142
terminal 2: ./a.out
terminal 3: python evalpython.py
*/

void main() {
    pwncollege();
}

void pwncollege() {
    int socket_desc;
    struct sockaddr_in server_addr;

    char server_message[4000]; // data received from socket
    char client_message[15]; // data sent to socket
    
    // clear buffers:
    memset(server_message,'\0',sizeof(server_message));
    memset(client_message,'\0',sizeof(client_message));

    socket_desc = socket(AF_INET, SOCK_STREAM, 0); // create socket
    
    // set socket ip and port
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(1493);
    server_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    
    // connect to server:
    connect(socket_desc, (struct sockaddr*)&server_addr, sizeof(server_addr));

    // create fifo to communicate with python
    mkfifo("./inn", 0644);
    mkfifo("./out", 0644);

    // open fifos
    int in, out;
    in = open("inn", O_RDWR);
    out = open("out", O_RDWR);

    int skip = 0;
    while(1) {
        // clear buffers
        memset(server_message,'\0',sizeof(server_message));
        memset(client_message,'\0',sizeof(client_message));

        // read server request
        recv(socket_desc, server_message, sizeof(server_message), 0);

        printf("%s", server_message);

        // write into "out" fifo the request
        write(out, server_message, 4000);

        if (skip == 1) {
            read(in, client_message, 15);

            printf("------------\n");

            // count how many bytes before 10 (\n)
            // otherwise the 0s will remain in the buffer
            int realbytes = 0;
            for (int i=0; i<15; i++) {
                printf("[%d] = %02X\n", i, (unsigned char)client_message[i]);
                if ((unsigned char)client_message[i] == 10) {
                    realbytes = i;
                    break;
                }
            }

            printf("------------\n");

            send(socket_desc, client_message, realbytes+1, 0);
        }
        skip = 1;
        sleep(1);
    }
}