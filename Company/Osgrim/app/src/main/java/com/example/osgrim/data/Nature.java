package com.example.osgrim.data;

/**
 * The Nature class defines the nature of the operation.
 * La classe Nature définit une nature de l'opération.
 *
 * @author Morgane Cadeau
 * @version 1.0
 */
public class Nature {

    private int id;
    private String name;

    /**
     * Creates a nature. A nature has an id and a name.
     * Créé une nature. Une nature a un id et un nom.
     * @param id The nature id. L'id de la nature.
     * @param name The nature name. Le nom de la nature.
     */
    public Nature(int id, String name) {
        this.id = id;
        this.name = name;
    }

    /**
     * Permits to get the nature id.
     * Permet de récupérer l'id de la nature.
     * @return The nature id. L'id de la nature.
     */
    public int getId() {
        return this.id;
    }

    /**
     * Defines a new nature id.
     * Définit un nouveau id de nature.
     * @param id The nature id. L'id de la nature.
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Permits to get the nature name.
     * Permet de récupérer le nom de la nature.
     * @return The nature name. Le nom de la nature.
     */
    public String getName() {
        return this.name;
    }

    /**
     * Defines a new nature name.
     * Définit un nouveau nom de nature.
     * @param name The nature name to set. Le nom de la nature à appliquer.
     */
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return this.name;
    }
}
