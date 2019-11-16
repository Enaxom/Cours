package com.example.osgrim.data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * The Team class defines a team of Osgrim users.
 * La classe Team (Equipe) définit une équipe d'utilisateurs Osgrim.
 *
 * @author Morgane Cadeau
 * @version 1.0
 */
public class Team {

    private int id;
    private String name;
    private List<User> members;

    /**
     * Creates a team. A team has an id, a name and a list of members.
     * Créé une équipe. Une équipe a un id, un nom et une liste de membres.
     * @param id The team id. L'id de l'équipe.
     * @param name The team name. Le nom de l'équipe.
     */
    public Team(int id, String name) {
        this.id = id;
        this.name = name;
        // The members list is initialized. La liste des membres est initialisée.
        this.members = new ArrayList<>();
    }

    /**
     * Permits to get the team id.
     * Permet de récupérer l'id de l'équipe.
     * @return The team id. L'identifiant de l'équipe.
     */
    public int getId() {
        return this.id;
    }

    /**
     * Defines a team id.
     * Définit un id d'équipe.
     * @param id The id to set. L'identifiant de l'équipe.
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Permits to get the team name.
     * Permet de récupérer le nom de l'équipe.
     * @return The team name. Le nom de l'équipe.
     */
    public String getName() {
        return this.name;
    }

    /**
     * Defines a team name.
     * Définit un nom d'équipe.
     * @param name The team name. Le nom de l'équipe.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Add a member (a User object) to the team.
     * Ajoute un membre (un objet User) à l'équipe.
     * @param user The user to add. L'utilisateur à ajouter.
     */
    public void addMember(User user) {
        // The user can't be add if he's already in the team.
        // L'utilisateur ne peut pas être ajouté si il est déjà dans l'équipe.
        if (!this.members.contains(user))
            this.members.add(user);
    }

    /**
     * Get all the members of the team.
     * Récupère tous les membres de l'équipe.
     * @return The team users list. La liste des utilisateurs de l'équipe.
     */
    public List<User> getMembers() {
        return new ArrayList<>(this.members);
    }

    @Override
    public String toString() {
        return this.name;
    }
}
