package com.example.osgrim.data;

/**
 * The Service class defines a service.
 * La classe Service définit un service.
 *
 * @author Morgane Cadeau
 * @version 1.0
 */
public class Service {

    private int id;
    private String name;
    private boolean selected;

    /**
     * Creates a service. A service has an id and a name.
     * Créé un service. Un service a un id et un nom.
     * @param id The service id. L'id du service.
     * @param name The service name. Le nom du service.
     */
    public Service(int id, String name) {
        this.id = id;
        this.name = name;
    }

    /**
     * Permits to get the service id.
     * Permet de récupérer l'id du service.
     * @return The service id. L'id du service.
     */
    public int getId() {
        return this.id;
    }

    /**
     * Defines a new service id.
     * Définit un nouveau id de service.
     * @param id The service id. L'id du service.
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Permits to get the service name.
     * Permet de récupérer le nom du service.
     * @return The service name. Le nom du service.
     */
    public String getName() {
        return this.name;
    }

    /**
     * Defines a new service name.
     * Définit un nouveau nom de service.
     * @param name The service name to set. Le nom du service à appliquer.
     */
    public void setName(String name) {
        this.name = name;
    }

    public String toString() {
        return name;
    }

    public void setSelected(boolean selected) {
        this.selected = selected;
    }

    public boolean isSelected() {
        return this.selected;
    }
}
