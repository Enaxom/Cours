========================================================================================
=============================== RECHERCHE OPÉRATIONNELLE ===============================
========================================================================================

#3
Voir feuille

#4
Solution optimale triviale
x1 = 3
x2 = 12
x5 = 3
x3 = 0
x4 = 0

#5 - 6
Voir feuille
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
Voir feuille

