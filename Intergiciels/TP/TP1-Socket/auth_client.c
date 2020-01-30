/* Time-stamp: <13 avr 2012 09:39 queinnec@enseeiht.fr> */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <strings.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <errno.h>
#include <err.h>
#include "auth.h"

static int authorized; /* 0 or 1 */

static int auth_socket; /* to talk with the authorization server. */
static struct sockaddr_in adrserv;

/* Cancel the current authorization. Used as a sig handler for SIGALRM. */
static void cancel_authorization(int unused)
{
	printf("Authorization ended.\n");
	authorized = 0;
}

void auth_init(int serverport)
{
	struct sigaction act;
	struct timeval tv = { AUTH_CLIENT_TIMEOUT, 0 };

	act.sa_handler = cancel_authorization;
	act.sa_flags = SA_RESTART;
	sigaction (SIGALRM, &act, NULL);

	authorized = 0;

	/* XXXX Build server address. */
	adrserv.sin_family = AF_INET;
	adrserv.sin_addr.s_addr = htonl(INADDR_BROADCAST);
	adrserv.sin_port = htons(serverport);
	
	/* XXXX Open a UDP socket */
	auth_socket = socket (AF_INET, SOCK_DGRAM, 0);

	/* XXXX Allow broadcast on this socket. */
	int val = 1;
	if (setsockopt(auth_socket, SOL_SOCKET, SO_BROADCAST, &val, sizeof(val)) == -1)
		err (1, "setsockopt");

	/* XXXX Timeout on receive. */
	if (setsockopt(auth_socket, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv)) == -1)
		err (1, "setsockopt");
}

int auth_check()
{
	if (authorized) /* already authorized. */
		return 1;

	Auth_Message msg;
	int n;

	printf ("Auth query\n");

	/* XXXX A compléter */
	/* send query to the server */
	msg.kind = AUTH_QUERY;
	n = sendto (auth_socket, (void*)&msg, sizeof(msg), 0, (struct sockaddr*) &adrserv, sizeof(struct sockaddr_in));
	if (n == -1)
		err(1, "sendto");
	
	/* wait for answer */
	n = recvfrom(auth_socket, (void*)&msg, sizeof(msg), 0, NULL, NULL);
	
	if (n == -1)
		msg.kind = AUTH_NACK;

	/* and check if this answer is positive */
	if (msg.kind == AUTH_ACK)
		authorized = 1;
	else
		authorized = 0;


	if (authorized) /* start timer */
		alarm(AUTH_LIFETIME);
	
	return authorized;
}
