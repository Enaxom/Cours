import javax.jms.*; 
import javax.naming.*; 
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Participant {

  public static void main(String[] args) { 
    try { 
    	// utilisation de l'interface JMS standard.
    	//Spécificité d'administration : les "XXXXConnectionFactory" doivent 
    	//  				avoir été définies dans $OPENJMS_HOME/config/openjms.xml
       InitialContext jndiCtx = new InitialContext();
       TopicConnectionFactory scf = (TopicConnectionFactory) jndiCtx.lookup("FabCnx"); 
       
       Topic sujet = (Topic) jndiCtx.lookup("Mon_SMI"); 
       TopicConnection connexion = scf.createTopicConnection(); 
       TopicSession session = connexion.createTopicSession(false,Session.AUTO_ACKNOWLEDGE); 
       TopicSubscriber unParticipant = session.createSubscriber(sujet); 
       TopicPublisher editeur = session.createPublisher(sujet);
       unParticipant.setMessageListener(new SMIListener()); 
       connexion.start();
       
       String id = "anonyme";
       if (args.length == 0) {
       	 System.out.println("identifiant non précisé -> connecté comme anonyme");
       } else { 
       	id = args[0];
       }
       
       TextMessage m = session.createTextMessage(); 
	   BufferedReader in= new BufferedReader(new InputStreamReader(System.in));
       while (true) {
		System.out.print("?");
		m.setText("["+id+"]:"+in.readLine());
		editeur.publish(m);
	}

    } catch (Exception je) { System.out.println(je) ; }
  }
}