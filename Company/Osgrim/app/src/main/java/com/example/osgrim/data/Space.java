package com.example.osgrim.data;

/**
 * The Space class defines a space (a room).
 * La classe Space (Local) définit un local.
 *
 * @author Morgane Cadeau
 * @version 1.0
 */
public class Space {

    private int id;
    private String name;

    /**
     * Creates a space. A space has an id and a name.
     * Créé un local. Un local a un id et un nom.
     * @param id The space id. L'id du local.
     * @param name The space name. Le nom du local.
     */
    public Space(int id, String name) {
        this.id = id;
        this.name = name;
    }

    /**
     * Permits to get the space id.
     * Permet de récupérer l'id du local.
     * @return The space id. L'id du local.
     */
    public int getId() {
        return this.id;
    }

    /**
     * Defines a new space id.
     * Définit un nouveau id de local.
     * @param id The space id. L'id du local.
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Permits to get the space name.
     * Permet de récupérer le nom du local.
     * @return The space name. Le nom du local.
     */
    public String getName() {
        return this.name;
    }

    /**
     * Defines a new space name.
     * Définit un nouveau nom de local.
     * @param name The space name to set. Le nom du local à appliquer.
     */
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }
}
