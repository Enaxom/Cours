import java.awt.*;
import java.awt.event.*;
import java.lang.*;
import java.util.*;

import javax.jms.*;
import javax.naming.*;

public class Participant {
    TextArea	texte;
    TextField	saisie;
    TextArea	activite;
    TextArea	connectes;   
    Frame 		fenetre;
    
    String id;
    boolean connecte = false;
    int estampille = 0;
    
    
    TopicConnectionFactory	topicConnectionFactory;
    TopicConnection       	connexion;
    TopicSession		    session;
    Topic					SMI,Activite,Enquete;
    TopicSession		    topicSessionS;
    TopicPublisher	       	pub_SMI, pub_Activite, pub_Enquete;
    TopicSubscriber       	abo_SMI, abo_Activite, abo_Enquete;
	
    public static void main(String args[]) {	
		Participant moi = new Participant();
		moi.id = "anonyme";
       if (args.length == 0) {
       	 System.out.println("identifiant non précisé -> connecté comme anonyme");
       } else { 
       	moi.id = args[0];
		IHM_SMI ecran = new IHM_SMI(moi);
       }
    }
    
	public Participant() {	
	 try {
	   InitialContext jndiCtx = new InitialContext();
       TopicConnectionFactory scf = (TopicConnectionFactory) jndiCtx.lookup("FabCnxV2"); 
       
       SMI = (Topic) jndiCtx.lookup("SMI"); 			// messagerie proprement dite
       Activite = (Topic) jndiCtx.lookup("Activite"); 	// suivi connexion(s)/déconnexions
       Enquete = (Topic) jndiCtx.lookup("Enquete");  	// recherche connectés
       
       connexion = scf.createTopicConnection(); 
       connexion.start();
       
       session = connexion.createTopicSession(false,Session.AUTO_ACKNOWLEDGE); 
       
       abo_SMI = session.createSubscriber(SMI); 
       abo_Activite = session.createSubscriber(Activite); 
       abo_Enquete = session.createSubscriber(Enquete); 
       pub_SMI = session.createPublisher(SMI);
       pub_Activite = session.createPublisher(Activite);
       pub_Enquete = session.createPublisher(Enquete);
       abo_SMI.setMessageListener(new SMIListener(this));  
       abo_Activite.setMessageListener(new ActiviteListener(this));  
       abo_Enquete.setMessageListener(new EnqueteListener(this));  
     } catch (Exception je) { System.out.println(je) ; }      
	}
}

class ActiviteListener implements MessageListener {
	Participant p;
	
	public ActiviteListener(Participant ptp) {p=ptp;}
	
	public void onMessage(Message m)  {
		try {
          if (m instanceof TextMessage) { 
              p.activite.setText(m.toString());
         }
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}

class SMIListener implements MessageListener {
	Participant p;
	
	public SMIListener(Participant ptp) {p=ptp;}
	
	public void onMessage(Message m)  {
		try {
          if (m instanceof TextMessage) { 
               	p.texte.append(m.toString()+"\n");
         }
		} catch (Exception ex) {
			ex.printStackTrace();
		}
 }
}

class EnqueteListener implements MessageListener {
	Participant p;
	
	public EnqueteListener(Participant ptp) {p=ptp;}
	
	public void onMessage(Message msg)  {
		try {
			StreamMessage smsg = (StreamMessage) msg;
			int stamp = Integer.parseInt(smsg.readString());
			String ident = smsg.readString();
			if (stamp == -1) {
				StreamMessage m = p.session.createStreamMessage();	
	     		m.writeString(ident);
	     		m.writeString(p.id);
	     		p.connectes.setText("/ ");
				p.pub_Enquete.publish(m);
			} else {
				if (stamp >= p.estampille) {
					if (p.estampille == stamp) {
						if (p.connectes.getText().indexOf("/ "+ident+" /")<0) {
							p.connectes.append(ident+" / ");
						}
					} else {
						p.estampille = stamp; 
						p.connectes.setText("/ "+ident+ " / ");
					}
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}

//===== IHM ============================================================================

// action associée au champ de saisie de messages
class writeListener implements ActionListener {
	Participant p;
	
	public writeListener(Participant ptp) {p=ptp;}
	
	public void actionPerformed (ActionEvent ae) {
		try {
            if (p.connecte) {
 				TextMessage m = p.session.createTextMessage();
 				m.setText("["+p.id+"]: " + p.saisie.getText());
      			p.pub_SMI.publish(m);
				p.saisie.setText("");
              } else {
              	p.activite.setText("il faut rejoindre la discussion pour emettre") ;
              }
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}

// action associée au bouton "rejoindre"
class connectListener implements ActionListener {
	Participant p;
	
	public connectListener(Participant ptp) {p=ptp;}

	public void actionPerformed (ActionEvent ae) {
	   try {	    
        	p.connecte = true;
			TextMessage m = p.session.createTextMessage();
 			m.setText("["+p.id+"] rejoint la discussion");
      		p.pub_Activite.publish(m);

      	} catch (Exception ex) {
		ex.printStackTrace();
	   }
	}
}  
    
    

// action associée au bouton "qui est là ?"
class whoListener implements ActionListener {
	Participant p;
	
	public whoListener(Participant ptp) {p=ptp;}

	public void actionPerformed (ActionEvent ae) {
		try {
			StreamMessage m = p.session.createStreamMessage();	
			p.estampille++;
	     	m.writeString(String.valueOf(-1));
	     	m.writeString(String.valueOf(p.estampille));
	     	p.connectes.setText("/ ");
			p.pub_Enquete.publish(m);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}


// action associée au bouton "partir"
class leaveListener implements ActionListener {
	Participant p;
	
	public leaveListener(Participant ptp) {p=ptp;}
	
	public void actionPerformed (ActionEvent ae) {
		try {
       		p.connecte = false;
			TextMessage m = p.session.createTextMessage();
 			m.setText("["+p.id+"] quitte la discussion");
      		p.pub_Activite.publish(m);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}

class IHM_SMI {
  public IHM_SMI(Participant p) {
	// creation IHM
	p.fenetre=new Frame();
	p.fenetre.setLayout(new FlowLayout());
	
	p.texte=new TextArea(10,60);
	p.texte.setEditable(false);
	p.texte.setForeground(Color.orange);
	p.texte.setBackground(Color.black); 
	p.fenetre.add(p.texte);
		
	p.activite=new TextArea(1,60);
	p.activite.setEditable(false);
	p.activite.setForeground(Color.blue);
	p.activite.setBackground(Color.lightGray); 
	p.fenetre.add(p.activite);
	
	Button connect_button = new Button("rejoindre");
	connect_button.addActionListener(new connectListener(p));
	p.fenetre.add(connect_button);
		
	Button leave_button = new Button("partir");
	leave_button.addActionListener(new leaveListener(p));
	p.fenetre.add(leave_button);
	
	p.saisie=new TextField(60);
	p.saisie.addActionListener(new writeListener(p));
	p.fenetre.add(p.saisie);
	
	Button who_button = new Button("qui est en ligne ?");
	who_button.addActionListener(new whoListener(p));
	p.fenetre.add(who_button);
	
	p.connectes=new TextArea(4,60);
	p.connectes.setEditable(false);
	p.connectes.setForeground(Color.blue);
	p.connectes.setBackground(Color.lightGray); 
	p.fenetre.add(p.connectes);
	
		
	//pour un JFrame : p.fenetre.setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
	p.fenetre.addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent e) {
                System.exit(0);
            }
        }
    );
    p.fenetre.setTitle(p.id);
	p.fenetre.setSize(600,450);
	p.fenetre.setVisible(true);
  }
}