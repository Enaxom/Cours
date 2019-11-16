package com.example.osgrim.data;

import java.util.ArrayList;
import java.util.List;

/**
 * The SpaceCat class defines a space category (room category).
 * La classe SpaceCat (catégorie local) définit une catégorie de local.
 *
 * @author Morgane Cadeau
 * @version 1.0
 */
public class SpaceCat {
    
    private int id;
    private String name;
    private List<Space> spaces;

    /**
     * Creates a spaceCat. A spaceCat has an id, a name and a list of spaces.
     * Créé une catégorie de local. Un catégorie de local a un id, un nom et une liste de locaux.
     * @param id The spaceCat id. L'id de la catégorie de local.
     * @param name The spaceCat name. Le nom de la catégorie de local.
     */
    public SpaceCat(int id, String name) {
        this.id = id;
        this.name = name;
        // The spaces list is initialized. La liste des locaux est initialisée.
        this.spaces = new ArrayList<>();
    }

    /**
     * Permits to get the spaceCat id.
     * Permet de récupérer l'id de la catégorie de local.
     * @return The spaceCat id. L'id de la catégorie de local.
     */
    public int getId() {
        return this.id;
    }

    /**
     * Defines a new spaceCat id.
     * Définit un nouveau id de catégorie de local.
     * @param id The spaceCat id. L'id de la catégorie de local.
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Permits to get the spaceCat name.
     * Permet de récupérer le nom de la catégorie du local.
     * @return The spaceCat name. Le nom de la catégorie de local.
     */
    public String getName() {
        return this.name;
    }

    /**
     * Defines a new spaceCat name.
     * Définit un nouveau nom de catégorie de local.
     * @param name The spaceCat name to set. Le nom de la catégorie de local à appliquer.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Add a space (a Space object) to the space category.
     * Ajoute un local (un objet Space) à la catégorie de local.
     * @param space The space to add. Le local à ajouter.
     */
    public void addSpace(Space space) {
        // The space can't be add if it's already in the spaceCat.
        // Le local ne peut pas être ajouté si il est déjà dans la catégorie de local.
        if (!this.spaces.contains(space))
            this.spaces.add(space);
    }

    /**
     * Get all the spaces of the spaceCat.
     * Récupère tous les locaux de la catégorie de local.
     * @return The spaceCat spaces list. La liste des locaux de la catégorie de local.
     */
    public List<Space> getSpaces() {
        return new ArrayList<>(this.spaces);
    }

    @Override
    public String toString() {
        return name;
    }
}
