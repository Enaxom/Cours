### TP5 - Activités et parallélisme régulé
#### Morgane Cadeau - SN 2App

- Calcul du maximum d'un tableau (répertoire `max`). Le calcul d'un opérateur associatif
et commutatif sur un ensemble de données est une application canonique de la parallélisation.
Cet exercice permet de mettre simplement et directement en pratique les deux schémas
(pool fixe et map/reduce) présentés dans l'énoncé.

* Le calcul séquentiel à paralléliser est une itération. A votre avis, quel sera
le schéma de parallélisation le plus naturel ? le plus efficace ?
	Le schéma de parallélisation le plus naturel semble être le schéma de parallélisation pool fix car on peut diviser en nombre fixe de sous-problèmes le problème et les donner à l'exécuteur.
	Le schéma de parallélisation le plus efficace est sûrement le schéma pool map/reduce car il peut diviser dynamiquement le problème en sous-problème.

* Comparer les deux versions (pool fixe et Fork/join) avec la version séquentielle.
Les mesures confirment-elles vos a priori ? Commentez.
	Les mesures ont été faites avec un tableau de 10 millions d'éléments avec 10 essais, 100 tâches pour le pool fix et 1000 de seuil pour le fork join.
	Résultats:
		- Mono: durée 57k µs
		- Pool: durée 29k µs
		- FJ: durée 120k µs
	On remarque donc que le pool fix est le plus efficace et le pool fork join est le moins efficace (de loin). Mon a priori était donc faux car le fork join est plus de 2 fois moins rapide que l'exécution séquentielle.


- Tri d'un tableau selon le schéma tri-fusion (répertoire `tri fusion`). Même s'il est régulier, 
le schéma récursif le prête parfaitement à l'utilisation du schéma map/reduce, et d'autant
 mieux qu'il est  organisé en 2 phases (tri, puis fusion).

* Comparer ces deux versions avec la version séquentielle, en termes de facilité de conception, et de performances. Pour cet exercice, un tableau d'un million d'entrées devrait suffire.
	Les mesures ont été faites avec un tableau de 1 million d'éléments avec 10 essais, 100 tâches pour le pool fix et 100k de seuil pour le fork join.
	Résultats:
		- Mono: durée 38k µs
		- PF: durée 109k µs
		- FJ: durée 33k µs
	Le Fork Join est ici bien plus efficace que le Pool Fix (3x plus rapide environ) et un peu plus rapide que la version séquentielle.
