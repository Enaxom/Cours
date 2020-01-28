import javax.jms.*; 
import javax.naming.*; 
import org.exolab.jms.administration.AdminConnectionFactory;
import org.exolab.jms.administration.JmsAdminServerIfc;
import java.util.Vector ;

public class Admin {

  public static void main(String[] args) { 
    String url = "tcp://localhost:3035/";

        
    try { 
      String user = "admin";
      String password = "openjms";
      JmsAdminServerIfc admin = AdminConnectionFactory.create(url);

	  // JmsAdminServerIfc admin = AdminConnectionFactory.create(url, user, password);
      // Ajouter un topic ...
      String unefile = "maFile";
      Boolean isQueue = Boolean.TRUE;
      if (!admin.addDestination(unefile, isQueue)) {
        System.err.println("Echec créationfile " + unefile);
      } else { System.out.println("queue :"+unefile);} ;
       
       admin.close();

    } catch (Exception je) { System.out.println(je) ; }
  }
}