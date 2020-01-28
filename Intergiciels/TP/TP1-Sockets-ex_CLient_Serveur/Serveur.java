import java.io.*; import java.net.*;

public class Serveur {
 static final int port = 8080;
 
 public static void main (String[] args) {
  try {
   ServerSocket s = new ServerSocket (port);
   Socket socket = s.accept();

   BufferedReader plec = new BufferedReader
        (new InputStreamReader(socket.getInputStream()));

   PrintWriter pred =
      new PrintWriter (new BufferedWriter
          (new OutputStreamWriter(socket.getOutputStream())), true);

   while (true) {
     String str = plec.readLine();    // lecture du message
     if (str.equals ("END")) break;
     System.out.println ("ECHO = " + str);  // trace locale
     pred.println (str);   // renvoi d'un echo
   }
   System.out.println ("FERMER...");
   plec.close(); pred.close(); socket.close();

  } catch (Exception e) { System.out.println (e); }
 }
}
