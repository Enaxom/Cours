========================================================================================
=============================== RECHERCHE OPÉRATIONNELLE ===============================
========================================================================================

#2
Anticiper les fissures en détectant les microfissures
Objectif minimiser la distance parcourue sans auscultation

#3
Variables de décision : paramètre du système, tout se joue dessus

#4
Contraintes empêchent d'atteindre la solution idéale

#7
On se ramène à un objectif: somme pondérée des éléments (peser l'importance de chaque objectif)
Méthode epsilon contrainte
	On prend un des objectifs, on le met comme contrainte
	Avec cette contrainte, on suit l'objectif

Meilleure solution
	Implique qu'il y a des contraintes

#8
Formaliser le problème car :
	Lève une grande partie des ambiguïtés
	Utiliser des méthodes existantes

Pour formaliser le problème, identifier
	Les données : ce qu'on ne maîtrise pas mais dont on connait la valeur
	Les variables de décision ou on peut agir

#10
Données
	Caractéristiques pour des sources d'énergie
	Demande de puissance à satisfaire à chaque instant
	Etat des sources au départ

Variables
	Puissance fournie par la source 1 Non réversible
	Puissance fournie par la source 2 réversible

Objectif
	Minimiser le "coût" sur la source 1

Contraintes
	A la fin de l'horizon temporel, il faut ramener la source 2 à un niveau d'énergie supérieur ou égal à celui du début
	Capacité de la source 2 à respecter à chaque instant
	Capacité de la source 1 à respecter à chaque instant

#11
Modèle de type programmation linéaire
	Pas de variable complexe
	Contrainte linéaire
	**La** fonction objectif doit être linéaire

#12
Ciment 1
	50€ / tonne
	40 min four
	20 min broyage

Ciment 2
	70€ / tonne
	12 min four
	30 min broyage

Four -> 6h / jour - 360min
Broyage -> 8h / jour - 480min

**Variables**
	Qty1 x -> quantité en tonne de ciment 1 à produire
	Qty2 y -> quantité en tonne de ciment 2 à produire

**Fonction-objectif**
	Maximiser 50qty1 + 70qty2

**Contraintes**
	Disponibilité du four 40qty1 + 20qty2 <= 360
	Disponibilité du broyeur 20qty1 + 30qty2 <= 480

**Domaine de définition**
	Qty1 ∈ ℝ+
	Qty2 ∈ ℝ+

Maximiser 50x + 70y
Sous contrainte
	40x + 12y <= 360
	20x + 30y <= 480
	x ∈ ℝ+
	y ∈ ℝ+
	Le terme de droite doit toujours être une constante et les termes de gauches doivent être linéaires.

#15
Recherche opérationnelle - Aide à la décision : RO-AD

Recherche opérationnelle, mélange de
	Maths
	Algorithme
	Informatique

Les outils de RO - AD
	Aident à trouver des/une solution(s) pour l'homme
	Aident à juger la qualité de la solution
	Confirmer / justifier des décisions


DÉBUT COURS
-----------

#4

