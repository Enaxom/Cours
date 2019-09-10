=========================================================================================
============================ EVALUATION PERFORMANCES RÉSEAUX ============================
=========================================================================================

#2
Evaluation de performance :
	Besoin de résultats quantitatifs, mesurer les paramètres qu'on peut quantifier
	Evaluer l'expérience utilisateur de façon qualitative

#3
Réseaux à commutation de paquets :
	Mécanismes de contrôle peuvent être évalués (flux et perte)
	Chaque élément du système va être modélisé sous forme de file d'attente

File d'attente caractérisée par la capacité, la durée de service, la loi d'arrivée dans la FA.

Réseaux Haut Débit et Multimédias
	On retrouve les problèmes de bloquage d'appels des réseaux à commutation de circuit

#4
Réseaux locaux
	Equipements plutôt homogènes
	Accès au support déterministe ou aléatoire

Mécanismes préventifs
	Mécanisme à fenêtre pour le contrôle de flux/congestion
Mécanismes réactifs

#5
Si le système n'existe pas, construire un modèle du système qui permettra d'évaluer les performances du système
On n'étudie pas les systèmes déterministes

Critères de performance
	Temps de réponse
	Débit
	Utilisation de ressource

Critères de consommation d'énergie lié au taux d'utilisation

#7
Si le système existe -> mesures
Sinon -> Modèle
Si le modèle existe, on compare les mesures

Commutation de paquet - Modèle
	FA en émission et réception
	Propagation de paquet peut se faire en parallèle
	3 FA avec une FA de propagation qui est une file multiple avec plusieurs serveurs
	Le temps d'émission va être dépendant de la longueur des paquets
	Capacité de FA propagation : nombre de paquets qu'on peut transmettre sur le support

#8
Commutation de circuit
	On s'intéresse à la probabilité de rejet : nombre d'appels rejetés sur appels total
	Appels rejetés ou acceptés, pas d'attente
	Durée d'appels & loi d'arrivée des appels

##Loi de Little
Taux Λ = débit
R temps moyen passé dans le système
L nombre d'entités dans le système

**L = R.Λ**

#9
E[S] temps moyen de service
S temps de service
Nombre moyen de client dans le serveur correspond au taux d'occupation du serveur
Taux d'occupation = probabilité qu'il soit occupé = 1 - P(est vide)

Λ < 1/E[S]

#Page 19 - Schéma
T = 15
A = 7
D = 5

Λ = 5 / 15 (nombre de départs sur temps d'observation)

T(0) = 2 
T(1) = 3
T(2) = 5
T(3) = 4
T(4) = 1
Temps passé dans l'état 0, 1...
L = 29 (somme des temps) / 15

pi 0 = 2/15
...

