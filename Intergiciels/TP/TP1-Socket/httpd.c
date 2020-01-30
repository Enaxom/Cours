/*
 * Un serveur httpd basique
 * Time-stamp: <13 fév 2018 16:52 queinnec@enseeiht.fr>
 */

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <signal.h>
#include <string.h>
#include <fcntl.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <err.h>
#include "common.h"
#include "auth.h"

static unsigned int myport; /* my port number */

/* Handle one http request. */
void* handle_request (void* psock)
{
	/* XXXX A compléter */
	int sock = *(int*) psock;
	char *line, *filename;
	int method;
	line = read_request(sock);
	parse_request(line, &method, &filename);

	int auth = auth_check();
	if (!auth) {
		writef(sock, "HTTP/1.1 403 Forbidden\n");
		writef(sock, "Server: le miens\n");
		writef(sock, "Content-Type: text/plain\n");
		writef(sock, "\nForbidden access\n");
		close(sock);
		return NULL;
	}

	if (method == REQUEST_GET) {
		int file = open(filename, 0); // 0 -> read only

		if (file == -1) {
			writef(sock, "HTTP/1.1 404 Not Found\n");
			writef(sock, "Server: le miens\n");
			writef(sock, "Content-Type: text/plain\n");
			writef(sock, "\nFile %s not found\n", filename);
			close(sock);
			return NULL;
		}

		writef(sock, "HTTP/1.1 200 Ok\n");
		writef(sock, "Server: le miens\n");
		writef(sock, "Content-Type: text/plain\n\n");

		int bufferLength = 255;
		char buffer[bufferLength];

		while(read(file, buffer, bufferLength)) {
			writef(sock, "%s\n", buffer);
		}

		close(file);
	} else { /* REQUEST_UNKNOWN */
		writef(sock, "HTTP/1.1 404 Not Found\n");
		writef(sock, "Server: le miens\n");
		writef(sock, "Content-Type: text/plain\n");
		writef(sock, "\nWrong request\n");
	}

	close(sock);
	return NULL;
}


int main (int argc, char *argv[])
{
	struct sockaddr_in soc_in;
	int s, r, val;
	int authport;

	if (argc != 3) {
		fprintf(stderr, "%s <port> <authport>\n", argv[0]);
		exit(2);
	}

	myport = atoi(argv[1]);
	authport = atoi(argv[2]);

	auth_init(authport);

	signal(SIGPIPE, SIG_IGN);

	/* socket Internet, de type stream (fiable, bi-directionnel) */
	s = socket (AF_INET, SOCK_STREAM, 0);
	if (s == -1) err(1, "socket");

	/* Force la réutilisation de l'adresse si non allouée.
	 * (cela permet de relancer le serveur immédiatement après une
	 * "sale" terminaison, i.e. sans fermeture propre (close ou shutdown)
	 * du socket d'écoute). */
	val = 1;
	if (setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &val, sizeof(val)) == -1)
	  err (1, "setsockopt");

	/* Nomme le socket: socket inet, port myport, adresse IP quelconque */
	soc_in.sin_family = AF_INET;
	soc_in.sin_addr.s_addr = INADDR_ANY;
	soc_in.sin_port = htons(myport);
	r = bind (s, (struct sockaddr *)&soc_in, sizeof(soc_in));
	if (r == -1) err(1, "bind");

	/* Prépare le socket à la réception de connexions */
	listen (s, 5);

	/* XXXX A compléter */
	while(1) {
		int socket = accept(s, NULL, NULL);

		// error
		if (socket == -1)
			continue;

		pthread_t t;
		int* psock = malloc(sizeof(int));
		*psock = socket;
		pthread_create(&t, NULL, handle_request, &psock);
		// handle_request(socket);
	}
}

