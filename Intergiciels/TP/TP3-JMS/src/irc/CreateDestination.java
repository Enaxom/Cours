package irc;

import org.objectweb.joram.client.jms.admin.*;
import org.objectweb.joram.client.jms.*;
import org.objectweb.joram.client.jms.tcp.*;

public class CreateDestination {
  public static void main(String args[]) throws Exception {
	System.out.println();
	System.out.println("CreateDestination administration phase... ");

	// Connecting to JORAM server:
	AdminModule.connect("root", "root", 60);

	// Creating the JMS administered objects:        
	javax.jms.ConnectionFactory connFactory =
	  TcpConnectionFactory.create("localhost", 16010);

	Destination destination = Topic.create(0);

	Destination[] queues = new Destination[20];

	for (int i = 0; i < queues.length; i++) {
		queues[i] = Queue.create(0);
	}

	// Creating an access for user anonymous:
	User.create("anonymous", "anonymous", 0);

	// Setting free access to the destination:
	destination.setFreeReading();
	destination.setFreeWriting();

	for (Destination queue : queues) {
		queue.setFreeReading();
		queue.setFreeWriting();
	}

	// Binding objects in JNDI:
	javax.naming.Context jndiCtx = new javax.naming.InitialContext();
	jndiCtx.bind("ConnFactory", connFactory);
	jndiCtx.bind("MonTopic", destination);

	for (int i = 0; i < queues.length; i++) {
		jndiCtx.bind(String.valueOf(i), queues[i]);
	}

	jndiCtx.close();
	
	AdminModule.disconnect();
	System.out.println("Admin closed.");
  }
}
