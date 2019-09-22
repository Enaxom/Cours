========================================================================================
=============================== RECHERCHE OPÉRATIONNELLE ===============================
========================================================================================

#3
*Voir feuille 3*

#4
Solution optimale triviale
x1 = 3
x2 = 12
x5 = 3
x3 = 0
x4 = 0

#5 - 6
*Voir feuille 3*
Optimisation que si on a moins de variables que de contraintes dans le cas où les contraintes sont exprimées sous forme d'égalité

#9 - 10
Tableau du simplexe obtenu à partir de la forme canonique

x3 x4 x5 forment une matrice identité
Variables de base (x3, x4, x5)
Variables libres (x1, x2)

x1 = x2 = 0 
x3 = 18
x4 = 42
x5 = 24
Coût = 0

#11
Un changement par iterration, une variable de base qui sort et une var libre qui rentre.
x5 sort de la base
vars de base (x3, x4, x1)
vars libres (x5, x2)

Les vars libres valent 0 et les vars base valent les solutions de colonne b
Valeurs négatives dans le tableau donc on peut améliorer
On identifie si des variables libres qu'on peut rentrer dans la base, oui pour les variables au coefficient négatif
Pour ça qu'on choisit x1

Elle peut être échangée avec n'importe quelle var de base qui ont un coeff strictement positif
Si on sait quelle est la prochaine base, on peut préconstruire le tableau p

En refaisant le tableau, on remplace x5 par x1 (dernière ligne)

*Voir feuille 3-4*

Mettre le problème sous la forme standard pour trouver le tableau du simplexe.
Variables d'écart pour obtenir la forme standard

3x1 + 5x2 >= 5
	Besoin de mettre en forme standard
	-> 2x1 + 3x2 -x3 = 5
		Pas possible de prendre x3 car coeff négatif
		Terme de b (5) doit être positif donc on ne peut pas multiplier par -1
Toutes celles qui ont un coeff négatif sont candidates et on choisit le coeff le plus grand
Candidat à la sortie seulement les coeff positifs

#12
Si aucune valeur ne peut rentrer alors la solution est optimale

#15

## Multiples solutions

Si dans le polyèdre la fonction objective est parallèle à un autre droite alors ceux sont des solutions optimales

## Solution non bornée

Contraintes qui permettent une infinité de solution 

## Dégénérescence

#16
Comment obtenir le premier tableau du simplexe avec x4 négatif
Besoin d'introduire des variables artificielles
	2 approches

*Voir feuille 4*

1. Méthode pénalisation
	+ une phase
	- introduit la grande constante M
2. Méthode à 2 phases
	+ on évite l'introduction du grand M, opérations relativement sûres

Voir explications #17 & #18

#18
Pour résoudre ce problème, plus rapide d'utiliser la méthode duale

#19
Simplexe primale
	On part d'une solution de base réalisable
	On se déplace de base en base pour trouver la solution optimale
	Part d'une solution de faisabilité, se déplace jusqu'à atteindre une solution optimale


Simplexe duale
	Inverse de simplexe primale
	Part d'une solution non réalisable qui respecte les conditions d'optimalité
	En gardant les conditions d'optimalités, va respecter les conditions de faisabilité


#23

## Avantages +
Méthode très rapide / la plus rapide
Efficacité en terme de temps de calcul

## Inconvénients -
En théorie, complexité exponentielle, temps de calcul exponentiel

## Alternatives ~
Méthode de poids intérieur: méthodes de complexité polynomiale
	En pratique ne rivalise pas su rles problèmes par rapport au simplexe


# Modélisation - Sudoku

x111 si le chiffre 1 est mis dans la case 1
x112 si le chiffre 2 est mis dans la case 1

## Variables
N = nombre de carrés dans une sous-carré de la grille
x01, x02, x03, x04
x11, x12, x13, x14

## Fonction objectif


## Contraintes
Les chiffres d'une ligne doivent être différents
Les chiffres d'une colonne doivent être différents
Chaque sous-carré de N cases doivent contenir des chiffres différents
Un chiffre déjà placé ne peut être modifié

## Domaine
x ∈ [1; 4]
