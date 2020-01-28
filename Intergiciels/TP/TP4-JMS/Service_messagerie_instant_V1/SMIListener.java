import javax.jms.*; 
import javax.jms.Message;

public class SMIListener implements MessageListener {
    public void onMessage(Message m) { 
       try {
          if (m instanceof TextMessage) { 
              TextMessage msg = (TextMessage) m; 
              System.out.println();
              System.out.println(msg.getText()) ; 
              System.out.print("...?");
         }
       } catch (JMSException je) {System.out.println(je) ; } 
    }
}