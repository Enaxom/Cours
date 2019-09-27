========================================================================================
===================================== STATISTIQUES =====================================
========================================================================================

Contact : vcharvillat@gmail.com

Manipulation de données :
	personnelles
	géographiques
	textuelles
	transactionnelles
	image, audio
	capteurs


Phénomène considéré comme aléatoire
					 , - - - -  - ,
				 , '       x   x   ' ,
			   ,      x     x    x     ,
			  ,  x      x     x    x    ,	Population d'observations de mesures
			 ,     x     x       x       ,
		---> ,  x      x   x  x      x   ,
		|	 ,    x      x    x  x    x  ,
		|	| ,       x                 ,
		|	|  ,   x      x   x    x   ,
		|	|	 ,   x       x   x  , '
		|	|	   ' - , _ _ _ ,  '
		|	|	   		/\	||
		|	|	   	(2)	||	|| (1)
		|	|	   		||	||
		|	|	   		||	||
		|	|	   		||	\/
		|	|	  ===================
		|	|	  | données		 	|
		|	|	  | n-échantillons 	|
		|	|	  | (série stat)	|
		|	|	  ===================
		|	|	  -> Langage mathématique des statistiques
		|	| (3)	/\ 		|| (6)
	(4)	|	\/		|| (5)	\/
	=============================
	| v.a.r						|
	| 		X					|
	| 							|
	=============================
	-> Langage mathématique des probabilités

***Quand on parle de statistiques, on cherche à expliquer le passé. On analyse les données.
Quand on fait des probabilités, on a un outil qui permet de simuler le futur.***

(1) échantillonne (ici la population)
(2) représente (bien)
(3)(4) est modélisée / modélise
(5) simule, prédit
(6) décrire, expliquer, inférer


##R1 - Qu'est-ce qu'une var (variable aléatoire réelle) ?
C'est un modèle (de production de données aléatoires)

Fonction
			|
	|-----|<-
	|  X  |-> x
	|-----|

X : var. 
Si une fonction utilise X le résultat sera x, réalisation (aléatoire) de X.
Deuxième appel de la fonction, résultat x2 deuxième réalisation de X.
**X modèle | x donnée**

Toujours fonction pour var X :
x ∈ Ex ensemble des réalisations possibles
	-> Ex fini ou dénombrable | var X discrète
		Ex = { xi } i ∈ I ⊆ ℕ (ref *1.png*)
	-> Ex infini non dénombrable | var continue
		Ex = [6, 10] : toutes les valeurs réelles entre 6 et 10
		P[X ∈ Δ] : ∫ f(n) dx
				   Δ

Ce qu'il faut mettre sous le capot pour obtenir le modèle X :
Loi de X (ref *2.png*)->
	(xi, pi) _i ∈ I_
	pi = P(X = xi)
	Σpi = 1
  _i ∈ I_


**Echantillonnage d'une population**
------------------------------------

L'échantillonnage doit être :
	Représentatif
	Ne présente pas de biais

#Stratégie SRS (1)
- SRS simple random sample
- Tirer aléatoirement x1 parmi la population (et remplacer xi, avec remise)
        o  o 
     o  x     o 
    o x   x x  o 
    o  x  x    o 
     o x    x o 
        o  o   

#Former des strates / groupes (2)
Groupes sexes différents
        o  o              o  o
     o x x x  o        o x x f  o
    o x x x x  o      o x x x f o
    o x  x   x o      o x x x x  o
     o x x   o        o f f    o
        o  o              o  o

#Former des groupes, choisir un groupe (par SRS) puis des individus dans le groupe (échantillonnage stratifié)
(ref *3.png*)


**S2**
------

=============
|			|
| données :	|
|			|
=============

-> Statistiques descriptives (I)
	Décrire sans apporter de conclusion sur la population.
-> Statistiques inférientielles
	-> Observer des paramètres (II)
	-> Tests d'hypothèses (III)
		II & III -> Conclure des choses sur la population.

Tirage pour n = 8 d'avis sur l'arrêt d'utilisation d'énergie nucléaire.
(x1 x2 x3 x4 x5 x6 x7 x8)
(0  0  0  0  0  0  0  0 )

x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8
 0   0   0   0   0   0   0   0
Occurences de chaque yi réalisation possible dans le 8-échantillon

Tirage nombre d'écrans pour travailler
2 3 2 3 2 4 3 1
(ref *4.png*)
	Moyenne y barre = 2.5
	Ecart type var y = 0.87


**S3 - Statistique descriptive**
--------------------------------

Construction d'un histogramme
-> A partir d'une série statistique (réalisation d'un échantillon)

Cas d'une **variable quantitative** qui prend des valeurs entières ou réelles (cas discret ou cantique).

1. Découpage en classe de l'ensemble des valeurs en présence
2. Calcul des effectifs d'occurences de ces classes

i  |  1   |  2   |  3   |  4   |  5   |  6   |  7   | 8 |  9   |  10  |  11  |  12  |  13 |  14  | 15
ti | 0.10 | 0.33 | 0.05 | 0.33 | 0.00 | 0.10 | 0.33 | 1 | 0.01 | 0.05 | 0.33 | 0.05 | 1.5 | 0.06 | 0.1

Souvent, ces 2 premières étapes sont "déjà" effectuées lorsque la série statistique est donnée par un tableau d'effectifs.

Exemple : les notes au premier partiel de la promo sont les suivantes

Notes		[5; 7[	|	[7; 9[	|	[9; 12[	|	[12; 14[
Effectif	10		|	31		|	33		|	26

On en déduit que la promo comporte (10+31+33+26 = 100) étudiants.
Ce tableau est plus compact que la donnée de toutes les notes (mais moins précis).

Ex 6 5.5 6 5 5.5 5 6 5.5 6.5 6
	10 notes ∈ [5; 7[
	Moyenne 5.7
-> Sans ces détails, une note représentant la première classe [5; 7[ serait une valeur moyenne entre ses bornes : 6.

L'histogramme approche le graphe de la **densité de la loi** associée à la population.

1 carreau représente (1 surface de 1 carreau) un effectif de 2 notes.
(ref *5.png*)
(7-5) x hauteur = 10 notes

Cas d'une **variable qualitative**. Dans ce cas on parle de modalités (et non de valeurs numériques) pour les valeurs possibles.
Dans ce cas là on fait un diagramme en baton. Il n'y a pas de rapprochement avec la densité de probabilité. 
Pas d'intervalle, les barres ne se touchent pas.

Une variable qualitative est nominale si ses modalités ne peuvent être données. Ordinale si on sait la trier. 

**S4 - Statistique descriptive**
--------------------------------

Calculs de paramètres de position Quartiles, Quantiles, Médiane
Idée on ordonne les valeurs présentées dans une série statistique
(ref *feuille 1 - exercice*)

tσ(i) 0.00 | 0.01 | 0.05 | *0.05* | 0.05 | 0.06 | 0.1 | **0.1** | 0.1 | 0.33 | 0.33 | *0.33* | 0.33 | 1 | 1.5

Médiane à 0.1. Autant d'élements à gauche qu'à droite.
Si on a un effectif pair, on sépare la série en deux séries de sous effectifs égales et la médiane est la moyenne de la valeur de borne extérieure et de borne intérieure.

15/4 = 3.75. On cherche la 4eme valeur pour trouver le premier quartile : 0.05
3eme quartile : 0.33.

La médiane est un paramètre de tendance centrale qui a des propriétés différentes de la moyenne.
Moyenne = 0.29

Les paramètres de **dispersion** sont souvent donnés par la variance et l'écart type.
Voir feuille pour formules

Notion de modes maximum (local) de la distribution
	-> distributions
		monomodale : une bosse sur la courbe
		binodales

**S5 - Estimation "Plus lisse" d'une densité de probabilité**
-------------------------------------------------------------

Une var Y et ses réalisations y ∈ R
On choisit 8 intervalles, des "bins" de largeur b = 1/2

Type de question
	L'allure d'un n-échantillon, on peut faire une représentation où on concentre les valeurs pour montrer qu'elles sont plutot petites ou grandes

La somme des fréquences relatives est la sommes des ni/n donc 1
Unité de représentation de l'histogramme qui est la fréquence relative

On veut que l'aire sous la courbe s'intègre à 1
On estime la densité de probabilité ^f avec une méthode à base d'histogramme.
Le tracé de l'histogramme est l'estimation de la densité de la probabilité
Sous la courbe on a 16 carreaux x 1/16 et c'est bien 1 donc ça marche. 

Le calcule de l'ordonnée
1/8 car puisqu'il faut que l'intégralle sous la courbe soit 1 et que sous de 0 à 0,5 ça doit être 1/16 il faut que quand on multiplie la base 0,5 x la hauteur ça doit faire 1/16 donc 1/8 x 1/2 = 1/16.

f chapeau
	Sur la courbe verte de l'histogramme on peut lire la vraissemblance de la valeur. Vraissemblance =/= probabilité. La vraissemblance que y0 se réalise est égale à la vraissemblance que 1,75 se réalise.
	Ca permet de savoir si une valeur pourrait se réaliser.

Distribution bimodale
	Un maximum locale
	Maximum de densité
	Permet de faire des suppositions pour l'avenir

Une formulation plus mathématique du calcul de l'histogramme
f^hist (y) = densité en y / vraissemblance de y

∫f^(y) dy = 1/2 x 1/8 + 1/2 x 2/8 ... = 1

Une formule qui traduit le tracé de l'histogramme
Sélectionner les réalisations appartenant au bin, les compter, diviser par la taille de l'échantillon N, diviser par la largeur b du bin.

Fonction indicatrice d'une intervalle
Pour tout y qui appartient à l'intervalle -> 1, sinon 0.
K(y) = 1 (avec deux barres) (y)

Exprimer le noyau, la fenêtre qu'on doit utiliser avec K(yi-y / b)
vidéo kernel 


**S6 - Statistiques descriptives à deux dimensions**
----------------------------------------------------

X est petit Y = 1

Page 6/6
Nuage bidimensionnel

(X, Y) -> (x, y) ∈ Ɛ(x, y) ≤ ℝ²
	(X, Y) couple de v.A.R
	Produit des données qu'on peut regarder

Loi jointe dit la vraisemblance d'un couple X Y

Dépendance non linéaire (plus complexe que linéaire)
	6.png
	avec fX(x) = px(x) = p(x)
	Loi (une densité) marginale de X (var continue)
	fY(y) = gY(y) = g(y)
	Réagir aux points séparés, très peu vraisemblable
	Tracer la loi conditionnelle de P(X|Y) = 0
	Vraisemblance d'un couple X,Y : P(x,y)(x, y) = P(Y|x) Px(x)


Dépendance linéaire (corrélation)
	7.png

Indépendance
	8.png


