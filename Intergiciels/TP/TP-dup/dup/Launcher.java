package dup;

import java.rmi.Remote;
import java.rmi.RemoteException;

/** Interface distante du serveur. */
public interface Launcher extends Remote {

    /** Add a new client on <code>host:port</code>, with its RMI callback <code>c</code>.
     * Called by a new client when it arrives. */
    public void addClient(String host, int port, Client c) throws RemoteException;
}
