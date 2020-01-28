import javax.jms.*; 
import javax.naming.*; 
import org.exolab.jms.administration.AdminConnectionFactory;
import org.exolab.jms.administration.JmsAdminServerIfc;
import java.util.Vector ;

public class Admin {

  public static void main(String[] args) { 
    String url = "tcp://localhost:3035/"; //url du serveur JMS

        
    try { 
      String user = "admin";
      String password = "openjms";
      //connexion au service d'administration, sans authentification
      JmsAdminServerIfc admin = AdminConnectionFactory.create(url);

      // Ajouter un topic ...
      String unTopic = "Mon_SMI";
      Boolean isQueue = Boolean.FALSE;
      if (admin.destinationExists(unTopic)) {
      	System.out.println("Connexion "+ unTopic + 
      	" déjà créée. Elle sera supprimée, puis recréée.");
      	admin.removeDestination(unTopic);
      }
      if (!admin.addDestination(unTopic, isQueue)) {
        System.err.println("Echec création topic " + unTopic);
      } else { System.out.println("topic créé :"+unTopic);} ;
      
      Vector<Destination> destinations = (Vector<Destination>) admin.getAllDestinations();
      System.out.println("Connexions disponibles :");
      System.out.println("------------------------");
      for (Destination destination : destinations ) {
         if (destination instanceof Queue) {
            Queue queue = (Queue) destination;
            System.out.println("queue:" + queue.getQueueName());
         } else {
            Topic topic = (Topic) destination;
            System.out.println("topic:" + topic.getTopicName());
         }
       }

       admin.close();

    } catch (Exception je) { System.out.println(je) ; }
  }
}