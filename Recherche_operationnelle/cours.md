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

Modéliser c'est mettre le problème sous une forme particulière

##Exercice

L
	100 en 6h -> 360min
S
	100 en 5h -> 300min

600h / semaine - 3600min
Voitures garées chaque semaine 

Mieux si on prend QteL = 1000L

**Variables**
	QteL -> Nombre de voitures L à produire en 1 semaine
	QteS -> Nombre de voitures S à produire en 1 semaine

**Fonction-objectif**
	Maximiser 10000.QteL + 9000.QteS

**Contraintes**
	QteL/100.6 + QteS/100.5 <= 60
	10.QteL + 20.QteS <= 15000
	QteL <= 800

**Domaine de définition**
	QteL ∈ N
	QteS ∈ N


#9
Les solveurs demandent deux types de formes
	Forme Standard
	Forme Canonique

Si le problème n'a pas la bonne forme, exemple avec x dans R, il faut faire une transformation.

Passer de
	Min -> Max : * -1
	Max -> Min : * -1
	<= -> = : Rajouter une variable d'écart
		6.QteL / 100 + 5.QteS / 100 <= 60
		6.QteL / 100 + 5.QteS / 100 + x1 = 60
			x1 >= 0
	>= -> = : Soustraire une variable d'écart
		5x + 8y >= 15
		5x + 8y - z = 15
			z >= 0
	A = B <=> A <= B et B <= A
	<= -> >= : * -1
	x1 ∈ R -> x >= 0
		Max x1+x2 >= -1
		3x1 + 2x2 <= 5
		x1 ∈ R
			x1 -> x3 - x4
			Max(x3 - x4) + x2
			2(x3 - x4) + x2 >= -1
			3(x3 - x4) + 2x2 <= 5

Max 50x + 70y
	40x + 12y <= 360
	20x + 30y <= 480
	x, y ∈ ℝ+

#11
*voir feuille 1-2*
Points sur la droite représentent les points qui respectent l'égalité stricte.
Les points qui satisfient la contrainte <= sont les points sous la courbe

On parle de **Polyèdre** -> Convexe
	Intersection de demi plan dimmension 2
	ax <= b

Un ensemble E est convexe si
	∀i, j ∈ E
	∀λ >= 0, λ <= 1
	λi + (1 - λ)j ∈ E

Convexe -> si on trace une droite entre 2 points, les points de la droite font parti de l'ensmeble
Solution optimale = point extremum (sur la courbe)

#13
Fonction objectif

#14
S'il exite une solution optimale, la solution est forcément un point extremum.
Si le polyèdre est vide, pas de solution.


#15
Fonction optimale forcément aux limites

#16
Optimal local = optimal global, pas vrai tout le temps

Limites
Additive
	Il faut que la conséquence soit la somme des conséquences, pas d'effet multiplicateur
	Proportionnalité au niveau des conséquences des décisions

Optimum local = optimum global

