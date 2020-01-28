import java.io.*; import java.net.*;

public class Client {
 static final int port = 8080;
 
 public static void main (String[] args) {
  try
  {
   if (args.length == 0) { 
     System.out.println ("Usage : java Client <nom du site serveur>");
     System.exit(0);
   }
   Socket socket = new Socket (args[0], port);
   System.out.println ("SOCKET = " + socket);

   BufferedReader plec = new BufferedReader
        (new InputStreamReader(socket.getInputStream()));

   PrintWriter pred =
      new PrintWriter (new BufferedWriter
          (new OutputStreamWriter(socket.getOutputStream())), true);

   String str = "bonjour";
   for (int i = 0; i < 10; i++) {
     pred.println (str);    //  envoi d'un message
     str = plec.readLine();  // lecture de l'echo
   }
   System.out.println ("END");
   pred.println ("END");
   plec.close(); pred.close(); socket.close();

  } catch (Exception e) { System.out.println (e); }
 }
}
