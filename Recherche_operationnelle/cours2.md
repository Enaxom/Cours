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


# Modélisation - Sudoku *Voir feuille 5*

## Variables
N = nombre de carrés dans une sous-carré de la grille
xijk -> variable binaire qui est égale à 1 ssi on met l'entier k dans la case ij
	x123 = 1 si 3 est dans la case (1,2)

x11	x12	x13	x14
x21	x22	x23	x24
x31	x32	x33	x34
x41	x42	x43	x44

## Fonction objectif


## Contraintes
Un chiffre dans la même case
xij1 + xij2 + xij3 + xij4 = 1
Pas la même valeur dans la même ligne

Pas la même valeur dans la même colonne

Pas la même valeur dans le même bloc

## Domaine
xijk ∈ [0; 1]

MATLAB
======
Fonction objective -> toujours min
Que deux types de contraintes : = & <=
<= dans matrice A
= dans matrice Aeq
Exemple feuille 6
x est un vecteur colonne

# Modélisation - Programme linéaire P2

## Variables
x : quantité produit I1 en kg
y : quantité produit I2 en kg

## Fonction objectif
Min 10x + 20y

## Contraintes
Au moins 500g de A
500x + 400y >= 500
150x + 50y >= 100
20x >= 5
20x <= 15

## Domaine
x ∈ ℝ+
y ∈ ℝ+


Exemple : Robots industriels
4 points
ADCB
ABDC
ACBD
ACDB
ADCB
ADBC

3 points : 2 solutions
4 points : 6 solutions
5 points : 24 solutions
n points : (n-1)!
20 points : 19! = 1,2 e17
1 million solution / s
	1.2 e11 s
	3800 ans
1 milliard solution / s


# Exercice

Article commencé terminé le jour même
Armoire 9m² bois 1h travail
Table 5m² bois 1h travail
6h/jour travail
45m²/jour bois
Armoire 8€
Table 5€

## Variables
x : quantité armoire en un jour
y : quantité table en un jour

## Fonction objectif
Max 8x + 5y

## Contraintes
9x + 5y ≤ 45
x + y ≤ 6

## Domaine
x ∈ ℕ
y ∈ ℕ

COURS
======

Pour résoudre, il ne suffit pas d'arrondir et de prendre l'entier le plus proche

#5
Ensemble discret (fini) de solution, trouver parmis les solutions celles qui nous intéressent le plus

Les problèmes d'optimisation combinatoire ont deux catégories
	polynomiaux (facile)

#8
Complexité du problème liée à la complexité du meilleur algo
Pire cas
	Si on a une liste et qu'on cherche un élément dans la liste, pire cas est qu'il n'est pas dans la liste
Pour évaluer un algorithme, on regarde toujours ce qu'il se passe dans le pire des cas

#9
En fonction de la taille des données, on veut savoir le temps que ça va prendre

#10
Algorithmes
	Polynomiaux
	Exponentiels
		Pas pour résoudre des problèmes de très grande taille
Lorsqu'on a un algorithme, on cherche à évaluer combien de temps il va mettre pour résoudre les problèmes

#11
Quatre premiers termes polynomes, évoluent de manière plate
Après exponentiel et évolue exponentiellement

Une exponentielle fini toujours par dépasser un polynome

#13
NP difficile  -> il n'existe pas d'algo polynomial pour le résoudre
Algorithme de aille moyenne alors on peut faire une énumération intelligente du problème

#14
Gauche polynomial droite NP difficile

# Résolution exercice d'avant

Relaxer un problème c'est le problème dans lequel on enlève des contraintes
Relaxation linéaires : toutes les variables qui n'étaient pas continues deviennent continues
Représentation graphique
*Voir feuille 7*
Algorithme Branch-and-bound

1. Problème sandable si
	TA Pas de solution admissible
	TR Résolution triviale
	TO Absence de la solution optimale du problème de départ
		Dans ce noeud de l'arbre, la solution optimale du problème n'y sera pas

	On se base sur un calcule de bornes qui se base sur la relaxation linéaire
	Si le problème continu n'a pas de solution admissible, on montre que ce problème ne donnera pas de solution admissible
	Tous les tests sont basés sur la relaxation linéaire
	On a besoin de résoudre la relaxation linéaire
	Si on arrive pas à valider les tests, on met les noeuds en mémoire

Si pour chaque condition on peut pas répondre oui, on le coupe en deux pour que les problèmes fils soient équivalents au problème de départ et voir si eux sont sandables

2. Séparation
	L'union des fils doit donner le problème de départ
	Séparer le noeud en 2 suivant la variable la plus fractionnaire
		Variable dont la valeur n'est pas un nombre entier, la plus fractionnaire est celle qui est la plus éloignée de l'entier le plus proche

3. Stratégie d'exploration
	Quel noeud prendre en premier
	On prendra les noeuds par meilleure borne puis par ordre d'arrivée

Définir ce qu'on va choisir pour chacune des procédures

On a pas eu à appliquer la stratégie d'exploration parce qu'on avait qu'un noeud en mémoire à chaque fois


**PROGRAMMATION DYNAMIQUE**
===========================

Problème du nageur
------------------


