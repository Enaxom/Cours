package com.example.osgrim.data;

import java.util.ArrayList;
import java.util.List;

/**
 * The Zone class defines a zone.
 * La classe Zone définit une zone.
 *
 * @author Morgane Cadeau
 * @version 1.0
 */
public class Zone {
    
    private int id;
    private String name;
    private List<Building> buildings;

    /**
     * Creates a zone. A zone has an id, a name and a list of buildings.
     * Créé un zone. Un zone a un id, un nom et une liste de bâtiments.
     * @param id The zone id. L'id de la zone.
     * @param name The zone name. Le nom de la zone.
     */
    public Zone(int id, String name) {
        this.id = id;
        this.name = name;
        // The buildings list is initialized. La liste des bâtiments est initialisée.
        this.buildings = new ArrayList<>();
    }

    /**
     * Permits to get the zone id.
     * Permet de récupérer l'id de la zone.
     * @return The zone id. L'id de la zone.
     */
    public int getId() {
        return this.id;
    }

    /**
     * Defines a new zone id.
     * Définit un nouveau id de zone.
     * @param id The zone id. L'id de la zone.
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Permits to get the zone name.
     * Permet de récupérer le nom de la zone.
     * @return The zone name. Le nom de la zone.
     */
    public String getName() {
        return this.name;
    }

    /**
     * Defines a new zone name.
     * Définit un nouveau nom de zone.
     * @param name The zone name to set. Le nom de la zone à appliquer.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Add a Building (a Building object) to the zone.
     * Ajoute un niveau (un objet Building) à la zone.
     * @param building The Building to add. Le bâtiment à ajouter.
     */
    public void addBuilding(Building building) {
        // The building can't be add if it's already in the zone.
        // Le bâtiment ne peut pas être ajouté si il est déjà dans le zone.
        if (!this.buildings.contains(building))
            this.buildings.add(building);
    }

    /**
     * Get all the buildings of the zone.
     * Récupère tous les bâtiments de la zone.
     * @return The zone buildings list. La liste des bâtiments de la zone.
     */
    public List<Building> getBuildings() {
        return new ArrayList<>(this.buildings);
    }

    @Override
    public String toString() {
        return name;
    }
}
