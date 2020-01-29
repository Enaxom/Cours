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
	adrserv.sin_addr.s_addr = INADDR_ANY;
	adrserv.sin_port = htons(serverport);

	

	/* XXXX Open a UDP socket */
	auth_socket = socket (AF_INET, SOCK_DGRM, 0);

	int r = bind (auth_socket, (struct adrserv *)&adrserv, sizeof(adrserv));
	if (r == -1) err(1, "bind");

	/* XXXX Allow broadcast on this socket. */
	int val = 1;
	if (setsockopt(auth_socket, SOL_SOCKET, SO_BROADCAST, &val, sizeof(val)) == -1)
		err (1, "setsockopt");

	/* XXXX Timeout on receive. */
	val = AUTH_CLIENT_TIMEOUT;
	if (setsockopt(auth_socket, SOL_SOCKET, SO_RCVTIMEO, &val, sizeof(val)) == -1)
		err (1, "setsockopt");
}

int auth_check()
{
	if (authorized) /* already authorized. */
		return 1;

	printf ("Auth query\n");

	/* XXXX A compléter */
	/* send query to the server */
	
	
	/* wait for answer */
	/* and check if this answer is positive */

	if (authorized) /* start timer */
		alarm(AUTH_LIFETIME);
	
	return authorized;
}
