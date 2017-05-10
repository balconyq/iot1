#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <netinet/in.h>
#include <signal.h>  

#define BUFFSIZE 64

void putDump(const void* buff, unsigned int len, unsigned int width);

int sock;
char cmd_login[] = {0x7E, 0x00, 0x64, 
    0x00, 0x00, 0x00, 0x14, 
    0x12, 0x34, 0x56, 0x78, 
    0x20, 0x00, 0x00, 0x01, 
    0x00, 
    0x12, 0x34, 
    0xFF, 0xFF};

char cmd_alarm[] = {0x7E, 0x00, 0x64, 
    0x00, 0x00, 0x00, 0x14, 
    0x12, 0x34, 0x56, 0x78, 
    0x30, 0x00, 0x00, 0x01, 
    0x00, 
    0x12, 0x34, 
    0xFF, 0xFF};

void Die(char *mess) { perror(mess); exit(1); }

void Stop(int signo)   
{  
    fprintf(stdout, "\noops! stop!!!\n");
    close(sock);

    _exit(0);  
}  

int main(int argc, char *argv[])
{
    struct sockaddr_in echoserver;
    char buffer[BUFFSIZE];
    unsigned int echolen;
    char *frame = (void*)0;

    signal(SIGINT, Stop); 

    if (argc != 3) 
    {
        fprintf(stderr, "USAGE: TCPecho <server_ip> <port> <command>\n");
        exit(1);
    }

    /* Create the TCP socket */
    if ((sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) 
    {
        Die("Failed to create socket");
    }

    /* Construct the server sockaddr_in structure */
    memset(&echoserver, 0, sizeof(echoserver));       /* Clear struct */
    echoserver.sin_family = AF_INET;                  /* Internet/IP */
    echoserver.sin_addr.s_addr = inet_addr(argv[1]);  /* IP address */
    echoserver.sin_port = htons(atoi(argv[2]));       /* server port */
    /* Establish connection */
    if (connect(sock,
                (struct sockaddr *) &echoserver,
                sizeof(echoserver)) < 0) 
    {
        Die("Failed to connect with server");
    }

    frame = cmd_login;
    /* Send the word to the server */
    echolen = sizeof(cmd_login);
    //putDump(frame, echolen, sizeof(char));
    if (send(sock, frame, echolen, 0) != echolen) 
    {
        Die("Mismatch in number of sent bytes");
    }

    /* Receive the word back from the server */
    fprintf(stdout, "Received: \n");

    int bytes = 0;
    while (1) 
    {
        bytes = recv(sock, buffer, BUFFSIZE-1, 0);
        buffer[bytes] = '\0';        /* Assure null terminated string */
        putDump(buffer, bytes, sizeof(char));

        memset(buffer, 0, bytes);
        bytes = 0;
    }

    exit(0);
}



void putDump(const void* buff, unsigned int len, unsigned int width)
{
    unsigned int i, j;
    const unsigned char *bp;
    const unsigned short *sp;
    const unsigned int *lp;

    switch (width) {
    case sizeof(char):
        bp = buff;
        for (i = 0; i < len; i++)       /* Hexdecimal dump */
        {
            if ((i != 0) && (i % 16 == 0))
            {
                putchar('\t');
                for (j = 16; j > 0; j--)
                {
                    putchar((bp[i - j] >= ' ' && bp[i - j] <= '~') ? bp[i - j] : '.');
                }
                putchar('\r');
                putchar('\n');
            }
            printf(" %02X", bp[i]);
        }
        if (len % 16)
        {
            for (i = 0; i < (16 - len % 16); i++)
            {
                printf("   ");
            }
            putchar('\t');
            for (i = (len % 16); i > 0; i--)
            {
                putchar((bp[len - i] >= ' ' && bp[len - i] <= '~') ? bp[len - i] : '.');
            }
        }
        putchar('\r');
        putchar('\n');
        break;
    case sizeof(uint16_t):
        sp = buff;
        for (i = 0; i < len; i++)       /* Hexdecimal dump */
        {
            if (i % 8 == 0)
            {
                putchar('\r');
                putchar('\n');
            }
            printf(" %04X", *sp++);
        }
        break;
    }

    putchar('\r');
    putchar('\n');
}
