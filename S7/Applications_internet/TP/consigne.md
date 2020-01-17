Inscription Tennis

S'enregistrer et s'identifier
Dans la base de données table utilisateur
	API/users
Rôle administrateur qui peut manager, désactiver

On se connecte et on peut voir le planning des 6 courts de tennis
Horaires de 7h à 23h, créneaux d'une heure
Réserver dans les créneaux sur les trois jours qui viennent
On a un quota de réservation de 1, à paramétrer pour autoriser quelqu'un à reserver 2 fois dans les 3 jours qui viennent
Joli c'est mieux

Après connection, vue par jours avec l'état des 6 terrains
Chaque terrain est une colonne avec les différents créneaux et l'état des réservations
Sur une réservation on voit le nom des deux personnes qui ont réservé

Pour réserver, je choisis le jour
	On choisit un créneau libre
	Formulaire qui s'affiche avec les renseignements pour réserver
		Le nom d'un autre adhérent du club qui doit être dans la BD
		Système vérifie qu'on a pas dépassé le quota
		Valider et la réservation apparait avec les autres

Deux ressources
	Utilisateurs
	Réservations

1 réservation liée à deux utilisateurs
Projet sur gitlab
jc partissipant avec le role maintainer

Issues
ISSUE 1
	Créer les tables et bd knex

Quand un joueur réserve, le deuxième joueur reçoit un mail
	Peut annuler la réservation


