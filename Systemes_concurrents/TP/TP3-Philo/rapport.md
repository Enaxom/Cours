### TP3 - Philosophes
### Morgane Cadeau - SN 2App

## Première approche : les fourchettes sont des ressources critiques

*Version de base: PhiloBase.java*
En ajoutant un sleep(1000) entre les prises des fourchettes, on constate rapidement un interblocage, avec tous les philosophes qui demandent à manger.
Cela signifie qu'à un moment, chaque philosophe a la fourchette située à sa droite et bloque donc son voisin de droite qui attend la fourchette située à sa gauche.

*Version asymétrique entre philosophes: PhiloAssymetrie.java*
La version asymétrique entre philosophes permet d'éviter l'interblocage car le philosophe no 0 commence par prendre la fourchette de droite alors que les autres prennent la fourchette de gauche en premier.
Cela évite que tous les philosophes soient bloqués en ayant chacun pris leur fourchette de droite car ce cas n'est pas possible.

*Version prise de fourchettes en bloc: PhiloBloc.java*
La version prise de fourchettes en bloc évite l'interblocage car le sémaphore mutex empêche plusieurs philosophes de prendre les fourchettes en même temps.
Ainsi, il y a à coup sûr un philosophe qui mange. Cette solution n'est tout de même pas optimale car si un philosophe attend sa fourchette de droite, il empêche tous les autres philosophes de prendre leurs fourchettes.

*Version prise de fourchettes non bloquante: PhiloNonBloquant.java*
Dans cette version, chaque philosophe prend sa fourchette de droite, tente de prendre sa fourchette de gauche, et repose sa fourchette de droite si celle de gauche est déjà prise.
Ainsi, il n'y a pas d'interblocage car les philosophes ne restent pas bloqués en ayant qu'une fourchette.

*Version limitant le nombre d'accès à la table: PhiloLimite.java*
Dans cette version, un sémaphore table limite le nombre d'accès à la table à noPhilosophes - 1, donc il n'y a jamais tous les philosophes qui demandent une fourchette simultanément, ce qui empêche l'interblocage.

## Seconde approche : contrôler la progression d'un philosophe en fonction de l'état de ses voisins

*Version qui vérifie l'état de ses voisins: PhiloEtat.java*
Dans cette version, un philosophe ne peut pas manger et attend si un de ses voisins mange. Un tableau d'état permet de savoir si les philosophes sont en train de manger, de penser ou de demander.
A l'analyse du comportement des différentes versions, on peut vite remarquer que dans cette version, il y a constamment la moitié des philosophes qui mangent.
Dans les 4 premières versions, au bout d'un moment, il n'y a plus qu'un seul philosophe qui mange à la fois.

### Equité

On peut imaginer un scénario (avec 4 philosophes) où deux philosophes face à face sont plus rapides (pour toutes leurs actions).
Dans ce cas là, les autres philosophes ne peuvent manger que si les deux philosophes rapides ne mangent plus et ce cas pourrait mettre longtemps à arriver.
Les philosophes moins rapides seraient donc en famine.

Une solution possible serait d'avoir une file d'attente des philosophes qui demandent à manger.
Ainsi, les philosophes ne pourraient pas bloquer les autres en mangeant constammant s'ils sont plus rapide et chaque philosophe finit par manger.

Dans le pire des cas, il n'y a qu'un philosophe qui mange dans la table et passe son tour à son voisin quand il a fini, contrairement à la solution optimale où il y a constamment la moitié des philosophes qui mangent.

L'attente maximale pour un philosophe demandeur sera d'un tour de table de philosophes qui mangent.

Cette solution est limitée car elle revient aux mêmes résultats que les premières solutions en terme de degré de parallélisme, sauf qu'il ya plus de code exécuté donc ça la rend moins performante.

