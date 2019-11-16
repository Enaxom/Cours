package com.example.osgrim.data;

import java.util.ArrayList;
import java.util.List;

/**
 * The Material class defines a material.
 * La classe Material (Matériel) définit un matériel.
 *
 * @author Morgane Cadeau
 * @version 1.0
 */
public class Material {

    private int id;
    private String name;
    private List<Incident> incidents;

    /**
     * Creates a material. A material has an id, a name and a list of associated incidents.
     * Créé un matériel. Un matériel a un id, un nom et une liste d'incidents associés.
     * @param id The material id. L'id du matériel.
     * @param name The material name. Le nom du matériel.
     */
    public Material(int id, String name) {
        this.id = id;
        this.name = name;
        // The incidents list is initialized. La liste des incidents est initialisée.
        this.incidents = new ArrayList<>();
    }

    /**
     * Permits to get the material id.
     * Permet de récupérer l'id du matériel.
     * @return The material id. L'id du matériel.
     */
    public int getId() {
        return this.id;
    }

    /**
     * Defines a new material id.
     * Définit un nouveau id de matériel.
     * @param id The material id. L'id du matériel.
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Permits to get the material name.
     * Permet de récupérer le nom du matériel.
     * @return The material name. Le nom du matériel.
     */
    public String getName() {
        return this.name;
    }

    /**
     * Defines a new material name.
     * Définit un nouveau nom de matériel.
     * @param name The material name to set. Le nom du matériel à appliquer.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Add an incident (an Incident object) to the material.
     * Ajoute un incident (un objet Incident) au matériel.
     * @param incident The incident to add. L'incident à ajouter.
     */
    public void addIncident(Incident incident) {
        // The incident can't be add if it's already associated to the material.
        // L'incident ne peut pas être ajouté si il est déjà associé au matériel.
        if (!this.incidents.contains(incident))
            this.incidents.add(incident);
    }

    /**
     * Get all the incidents of the material.
     * Récupère tous les incidents du matériel.
     * @return The material incidents list. La liste des incidents du matériel.
     */
    public List<Incident> getIncidents() {
        return new ArrayList<>(this.incidents);
    }

    @Override
    public String toString() {
        return this.name;
    }
}
