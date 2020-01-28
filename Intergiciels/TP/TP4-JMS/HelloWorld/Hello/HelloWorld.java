
import javax.jms.*;
import javax.naming.*;

public class HelloWorld {

    public static ConnectionFactory connectionFactory;
    public static Connection        connection;
    public static Session           sessionP;
    public static Session           sessionS;
    public static MessageProducer   producer;
    public static MessageConsumer   consumer;
    public static Destination       destination;

    public static void main(String argv[]) {

        try {
            InitialContext ic = new InitialContext ();

            connectionFactory = (ConnectionFactory)ic.lookup("ConnectionFactory");
            destination = (Destination)ic.lookup("maFile");

            System.out.println("Utilise ConnectionFactory et maFile");

            connection = connectionFactory.createConnection();
            connection.start();

            System.out.println("Connection crée");

            System.out.println("Création de sessions: non transactionnelles, auto ack");
            sessionP = connection.createSession(false,Session.AUTO_ACKNOWLEDGE);
            sessionS = connection.createSession(false,Session.AUTO_ACKNOWLEDGE);

            producer = sessionP.createProducer(destination);
            consumer = sessionS.createConsumer(destination);


            System.out.println("Prêt");

            TextMessage textmsg = sessionP.createTextMessage();
            textmsg.setText("Hello World !!!");
            producer.send(textmsg);
            System.out.println("Emis : " + textmsg.getText());
            textmsg.setText("Bonjour le monde !!!");
            producer.send(textmsg);
            System.out.println("Emis : " + textmsg.getText());            
			TextMessage rcvMsg = (TextMessage) consumer.receive();
            System.out.println("Reçu : " + rcvMsg.getText());            
			
        } catch (Exception ex) {
            ex.printStackTrace();
            return;
        }
    }

    static class MsgListener implements MessageListener {
        public void onMessage(Message msg)  {
            try {
                TextMessage textmsg = (TextMessage)msg;
                System.out.println("I have received : " + textmsg.getText());
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

}
