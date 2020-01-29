# TD Réseau n°1

Tuesday, 28. January 2020 02:07PM 

---

### Exercice 1

##### 1. Qu'est-ce qu'une architecture de réseau ?
Une architecture de réseau est un modèle de référence qui permet de décrire les moyens physiques et logiques nécessaires à la mise en place de communications entre machines distantes.


*Solution*
Décrit un ensemble d'équipements physiques, d'équipements d'interconnexion, et des comportements les uns par rapport aux autres. On décrit chaque entité, son comportement et son comportement vis-à-vis des autres entités.

On ne décrit jamais la partie implantation, c'est-à-dire le fonctionnement interne des équipements. On ne décrit pas l'implantation des protocoles et matérielle.

##### 2. Quels sont les intérêts d'un modèle d'architecture de réseau hiérarchique ?
Un modèle d'architecture de réseau hiérarchique permet de découper les problèmes en sous-problèmes et une abstraction des couches. 

*Solution*
Les dépendances ne se font qu'avec le N-1 et le N+1. L'intérêt principal du modèle hiérarchique est qu'ils sont largement évolutifs.

##### 3. Qu'est-ce qu'un protocole ? Qu'est-ce qu'un service ? et un point d'accès au service ?

- **Protocole**: gère les communications entre les entités homologues. Ça va décrire l'ensemble des messages qui peuvent être échangés et l'ordre dans lequel ils vont être échanger. Ne comprend pas la partie implantation.
- **Service**: permet de gérer les communications de couches adjacentes et va permettre d'implanter un ensemble de primitives de service. 
- **Point d'accès au service**: zone mémoire commune, un moyen de communiquer.

### Exercice 2


