===============================================================================
======================= EVALUATION PERFORMANCES RÉSEAUX =======================
===============================================================================

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
Débit de sortie de la file va être limité

Slide 2
File avec un seul serveur
Taille de la salle d'attente pas limitée, file à capacité illimitée
Paramètres importants
	Caractérise les arrivées dans la file
	Caractérise les sorties

Sans mémoire
	Si on a un évènement, l'élément qui va suivre ne prend pas compte des évènements précédents

Chaque paquet va être émis sur un support
Paquets qui arrivent traités dans l'ordre premier arrivé premier servi

MM1
	Memory less

#10
Processus qui va être caractérisé par le nombre de clients dans la file
Infinité d'états dans la chaine de markov
Probabilité d'arrivée en fonction de λ
Départ qui va dépendre du taux de service
Une fois qu'on construit la chaine, on retrouve les paramètres de performance
A partir de la chaine, on va déduire les probabilités d'état

Probabilité de l'état 0 = proportion de temps passé où la file est vide
	1 - ρ (taux d'occupation de la file)

Une fois qu'on a la probabilité d'état, on peut déduire le nombre de clients dans la file et on peut en déduire le temps de réponse

On construit la chaine de markov
On calcule les probas des états
On calcule l'espérance des clients
On calcule le temps moyen de réponse
***VOIR FORMULES SUR COURS***

File simple un seul serveur
File multiple

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

#11
Chaque serveur représente un appel. Quand le serveur est vide on n'a pas d'appel.
On s'intéresse à la probabilité de rejet
Quatrième élément MMCC -> capacité de la file
	C1 nombre de serveurs
	C2 nombre de place dans la file
		La capacité de la file prend en compte le nombre de place libres

On a C canaux donc on peut avoir de 0 à C appels en parallèle.
Chaine de markov finie. On s'intéresse à la probabilité de bloquage.
	Probabilité d'être dans l'état C
	On rejette les appels quand on a C appels en cours
	Formule d'Erlang-B
		Charge rho
		Capacité C


Exercices - ref exo1.pdf
------------------------

## Modèle du dentiste

Λ		Débit moyen Λ
E[R]	Temps moyen de réponse
E[W]	Temps moyen d'attente
E[S]	Temps moyen de service
E[L]	Espérance de longueur de la file d'attente
E[Lw]	Nombre moyen de clients en train d'attendre
E[Ls]	Nombre moyen de clients en train d'être servis
U		Probabilité pour que le serveur soir occupé, taux d'utilisation du serveur

1 - Relation entre E[R], E[S] et E[W]
E[R] = E[W] + E[S]
R = W + S

2 - Relation entre E[L], E[Lw], E[Ls]
E[L] = E[Lw] + E[Ls]

3 - E[Ls] en fonction de U
Taux d'occupation U probabilité que le serveur soit occupé
E[Ls] = O x (1 - U) + 1 x U
	0 ou 1 client en service
E[Ls] = U

4 - Montrer le passage entre 1 et 2. Trouver une relation entre U, Λ et E[S]
E[L] = E[R].Λ
	Loi de Little
E[Lw] = E[W].Λ
	Loi de Little appliquée à la salle d'attente.
E[Ls] = E[S].Λ
**U = E[S].Λ**

5 - Nombre moyen patients 2,8
	Nombre moyen patients dans la salle 2
	Nombre moyen de clients arrivant en une heure 4
	Déduire les autres critères de performances
E[L] = 2,8
E[Lw] = 2
4 clients / h

Temps de réponse
	**E[R] = E[L] / Λ**
		 = 2,8 / 4
		 = 0,7h
		 = 42 minutes
Temps d'attente
	**E[W] = E[Lw] / Λ**
		 = 2 / 4
		 = 0,5h
		 = 30 minutes
Taux d'occupation du dentiste
	= 2,8 - 2 = 0,8
	**U = E[Ls] = E[L] - E[Lw]**
	  = 2,8 - 2
	  = 0,8


COURS - CHAINES DE MARKOV
=========================

#2
Le changement de la variable va être sur un temps continu.
On peut imaginer des variables discrètes avec un changement d'état discret (nombre entier).
Niveau d'eau dans un barrage
	var aléatoire continue
Le temps peut être discret ou continu
	Chaines de markov associées

#3
Chaine où on observe des états du système
On va observer ce système dans le temps
	Temps paramètre n

Pour un état donné à l'instant n+1, on veut observer l'état de la variable en tenant compte des précédents états de cette variable.

Chaine de markov à temps discret est une chaine où la transition d'un état à un autre ne dépend que du **présent**. 

#4
Si la probabilité de transition de l'état i et j entre les états n et n+1 ne dépend pas du temps, la chaine de Markov est homogène.

#5
Matrice de probabilité de transition entre les états
Chaque matrice pij représente la probabilité de transition entre i et j
πj(n) probabilité de l'état j à l'instant n
Le vecteur de probabilité π
	Distribution stationnaire

#6
Chaine avec deux états
Matrice de transition qui représente les probabilités de transition des états
Probabilité d'avoir un temps de séjour égal à 1 (on change d'état tout le temps)
	0, 1 depuis 0
Rester n fois dans l'état 0
	0,9^n . 0,1

Probabilité de se trouver dans l'état 0
	Plus tard - De retour après #11
	π = π.P
	(π(0), π(1)) = (π(0), π(1)) . (0,9  0,1)
								  (0,2  0,8)
	π(0) = π(0) x 0,9 + π(1) x 0,2
	π(1) = π(1) x 0,1 + π(1) x 0,8

2ème méthode de descoupes
*ref 1.png*
π(0) x 0,1 = π(1) x 0,2
π(0) + π(1) = 1
π(0) x 0,1 = (1 - π(0)) x 0,2
π(0) x 0,8 = 0,2 => **π(0) = 2/3 ; π(1) = 1/3**

Temps moyen de retour à l'état 0
	M(0) = 1/π(0) = 3/2


#7
π(n) = π(0)Pn
Chaîne de Markov **irréductible** : tout état peut être atteint de n'importe quel état. -> fortement connexe

#8
Calculer le temps de retour d'un état. Si on part d'un état, on veut calculer la probabilité de retour à l'état
Graphe de #6
	Probabilité de retour de 0 = 0,02

Probabilité de retour à l'état j en n transitions.
Si la probabilité est égale à 1, c'est un état **récurrent**.
Sinon, l'état est **transitoire**.

Si le nombre de transition est infini
	**Récurrent nul**
Sinon
	**Récurrent non nul**

#9
Périodicité des états de #6
	Si on enlève les boucles, les états sont périodiques

Valide pour un processus avec un ordre d'état fini

#10
**Ergodicité**
	Etat ergodique s'il est récurrent non nul, si sa probabilité d'état est non nulle.

#11
π = πP
	Le vecteur de probabilité d'état π à l'instant n + 1 = π(n) x P

Probabilité de chaque état = 1 - probabilité de retour à chaque état


Exercices - ref exo2.pdf
------------------------

## Chaînes de Markov à temps discret

#2.1

1 -> 2 : 1 - p
1 -> 3 : p
2 -> 1 : 1
Voir feuille

Exercices - ref exo1.pdf
------------------------

## Temps d'attente d'un train
Voir feuille


#12
On observe l'état à chaque instant en se plaçant à des instants en particulier, chaque fois qu'il y a une arrivée ou un départ
Probabilité de transition entre in et j va être indépendante du passée. Dépendante du passé que par l'état in

#13
Chaîne de markov à temps continu homogène si les probabilités de transition sont les mêmes quelque soit le temps
Probabilité de transition entre état indépendante du temps

Calcul du temps de séjour dans un état
	Représenté par une loi sans mémoire -> loi exponnentielle

#14
Calcul des probabilités de transition entre états
Temps continu
Prendre un intervalle de temps des t utile de façon à ce qu'il y ait plus d'un changement d'état dans l'intervalle
	Intervalle infinitésimal

Quantité représente un taux, un débit
Dans un cas temps continu, on mesure un intervalle petit, les arrivées durant cet intervalle et on obtient un débit

Débit permet de représenter le taux de transition entre états

Dans cet intervalle de temps, au plus un événement et un seul
Si il y a plusieurs événements on prendrait un intervalle plus petit

qij
	Taux de transition qui revient à calculer la probabilité de l'état i et j divisé par la période

#15
Le vecteur π est la limite si le système se stabilise
Norme du vecteur π = 1 = |π|
π.Q = 0

#16
Diagonale de la matrice -> moins la somme des taux de transition
Pas de boucle sur les états

Probabilité de transition entre l'état 0 et l'état 1
	taux λ * ∆t

#17
Probabilité de retour à l'état j dans un intervalle

#18
Si on a un nombre d'états finis et que la chaîne est irréductable les états sont récurrents non nuls

#19
Ergodique si état est récurrent non nul

#20
1. On essaie de montrer qu'on peut traver la chaîne de markov à temps continu
Dans une loi continue, le temps de séjour suit une loi exponnentielle

#21
PNM processus où les seules probabilités de transition non nulles sont les probabilités d'états où la distance est de 1

#22
PNM processus de comptage

Probabilité d'arrivée λt puissance k divisée par k
λt < 1

e(x) ≈ 1 + x + o(x)
Probabilité de n'avoir aucune arrivée dans le système pendant la période t + dt
On remplace k par 0 et on se retrouve avec 1 - λdt + o(dt)
	o(dt) : d'autres termes négligeables

Probabilité d'aller de l'état k à l'état k+1
	Pr[Nt+dt = k+1/Nt = k] = λdt.e(-λdt)
	= λdt(1 - λdt + o(dt))
	= λdt - λ²dt² + o(dt)
	= λdt + o(dt)

Cas où il a plus d'une arrivée
P[Nt+dt = k+j/Nt = k], j > 1
	= (λdt)^j / j! . e(-λdt) = o(dt)

Processus de naissance pur
Si la distance est supérieure à 1 la probabilité est nulle

#23
Processus se stabilise, probabilités d'état non nulles si le taux d'arrivée est inférieur au taux de départ

#24
Premier cas probabilité de transition
Deuxième cas taux de transition

*2.2 exo2.pdf feuille 3*


COURS - FILES D'ATTENTE
=======================

#2
Durée de service dépendante du service rendu à chaque client
Chaque client va être servi par un seul serveur et chaque serveur ne sert qu'un seul client

#3
F
	discipline de service
	Processor Sharing quota du service à chaque client

K
	capacité de la file
		Capacité qui prend en compte les places en service

N
	taille de la population

#6
Population finie N
Système avec capacité >= N sinon on aurait un rejet

Temps de réponse du système
R = N/Λ - Z avec Z temps d'attente

#7
File avec capacité infinie
Un seul service, des arrivées selon un processus de poisson
Loi sans mémoire

L'espérance de Y doit être égale à l'espérance de X
Le nombre d'arrivées suit un processus de poisson de paramètre Λ

1/Λ représente le tmeps moyen entre deux arrivées

M | M | 1
M -> Loi d'arrivée, Memoryless (sans mémoire)
M -> Loi de service
1 serveur

Pour un processus de ce type là, la probabilité de voir plus d'une arrivée est quasi nulle

Processus de naissance et de mort avec Λ qui représite le débit d'arrivée et µ qui représente le débit de départ
1/µ temps moyen de service

#10
Si on voit en moyenne un client, le serveur est chargé à 50% du temps

#11
N capacité de la file
Même loi d'arrivée et de service 
Trouver la probabilité de rejet (quand la file est saturée)
Chaîne de Markov représentée par N+1 états de 0 à N

Si la chaîne de Markov est non réductible et nombre d'états fini alors la chaîne est ergotique
Si Λ = µ (taux d'arrivé = taux de service)
	Tous les états sont équiprobables avec une probabilité de 1/N+1

#14
Probabilité de rejet dépend de l'état de la file et de la taille de la population
Probabilité de rejet qui dépend de M et de N

#15
File avec plusieurs serveurs (N)
Taux d'arrivé indépendant de l'état de la file
Taux de départ dépend de l'état de la file
Débit de sortie de la file dépend du nombre de serveurs

Probabilité de rejet avec N serveurs et N places

Si on a une infinité de serveur, qu'elle est le temps de réponse d'une file ?
	E[R] = 1/µ
Nombre moyen de client
	E[L] = Λ/µ = ρ


Chapitre 4 - Files d'attentes simples
-------------------------------------

Voir feuille 5


