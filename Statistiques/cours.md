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
