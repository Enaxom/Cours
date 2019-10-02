=======================================================================================
=================================== BASE DE DONNÉES ===================================
=======================================================================================

Modèle relationnel : ensemble de relations.
Valeur : intersection entre ligne et colonne.

#5
**Attribut** (colonne d'une relation) -> fonction qui part de la relation vers le domaine : **fonction de projection**.

**N-uplet ou tuple** (ligne d'une relation).

Contrainte dynamique
	Utilisation de trigger (déclencheur)

#6
On peut toujours extraire n'importe quel sous-ensemble de la relation R.
	On peut répondre à toutes les requêtes qui correspondent à une information que je veux extraire.

#8
R1 x ... x Rn = Ru - *Relation universelle*

Comment peut-on extraire un sous-ensemble de la relation universelle sans pouvoir la construire ?
	Jointure
	La sélection

Les relations doivent avoir des **formes normales**.

Différents types de clés :
	Clé quelconque / Superclé
	Clé minimale

#9
La clé est en dépendance fonctionnelle avec le reste des attributs.
Si j'applique une valeur de clé j'obtiens une seule valeur.

Fonction injective : si deux n-uplets contiennent la même valeur de clé alors ils sont identiques.

#12
Quand il y a une clé étrangère, la valeur doit être absolument une clé primaire de l'autre table.
a5, a6 (clé étrangère) référence b1, b2 (clé primaire).

#13
Modèle entité / association
Les données sont soit des entités soit des liens entre ces entités (association).

Schéma entité / association (*souligné*, **souligné pointillé**)
Élève {*nom*, prenom, date_naissance, **intitule**}
Cours {*intitule*, volume, annee}

sans intitule dans eleve :
Inscription { /clé_primaire_etrangere/ nom, intitule }

Cardinalité unité de mesure qui mesure le cardinal de l'ensemble, l'étendu de la présence de E dans A.

#14
Eleves relation entité, Inscription relation association.

#16
Produire un schéma entité / association
(ref *exo1.odt*)

#18
Dépendances fonctionnelles
--------------------------

#21
Si t1 et t2 ont les même valeur pour les Ai alors A et B ont les même valeurs.
R |= A -> B
Il y a des dépendances fonctionnelles calculées

#22
DF f de R conséquence de S ssi R |= S => R|= f
	Noté S |= f : S satisfait f

#25
DF triviale
	Beaucoup d'information, trivial si les B sont des Ai

#26
Réécrit la relation triviale dans l'autre sens
	Axiome de réflexivité

Si A détermine B alors n'importe quoi et A déterminent toujours B
	Règle d'augmentation -> Ce qui sert à déterminer un ensemble d'attributs minimal / élémentaire
		Sert à la deuxième forme normale

#27
Règle de transitivité
	Si les Ai déterminent les Bj, si les Bi déterminent les Ck alors 1i déterminent les Ck
	=> Dépendance fonctionnelle transitive
		Permet d'identifier les clefs étrangères

RU [ A1 ... An ]

#28
S |- f : S déduit f
S |- f1 (réflexivité)
S1 f1 |- f3 (Transitivité)
S1 f1 f3 |- f4 (Augmentation)
S f1 f3 f4 |- f (transitivité)

#29
S |= f <=> S |- f

#32
A -> B
B -> C
B -> E
A -> D

{A, B}+ = {A, B} U {C, E, D}
{B}+ = {B} U {E, C}
{A}+ = {A} U {B, C, D, E}

Donc R = {*A*, B, C, D, E}
R1 = {*A*, **B**, D}
R2 = {*B*, C, E}

#33
Elementaire à gauche le plus simple possible
La dépendance fonctionnelele élémentaire va permettre d'avoir la clef la plus simple dans la relation

Redondance si on ajoute A -> C à l'exemple du dessus

#34
On cherche le plus petit ensemble de DF dans lequel on peut calculer la couverture la plus grosse
Dans les entités comme dans les associations, éviter les dépendances transitives (ex date de naissance et age)

#37
Les théorèpmes des décomposition permettent d'obtenir un schéma en 3 NF (3ème forme normale).

1 NF
	Tous les attributs de type simple (pas de tableau, liste ou objet)
2 NF
	Tous les attributs en dépendance fonctionnelle élémentaire (DFE) avec la clé
3 NF
	Pas de dépendance fonctionnelle transitive

Etape 0
	Construire la relation universelle
Etape 1
	Identifier la clé de la RU
Etape 2
	Décomposer 1NF -> 2NF -> 3NF

#40
Si on a des dépendances multi-valuées, séparer les relations

------------------------------------------------------------------

3NF -> RU = R1 |><| R2 ... |><| Rn

AR extraction de n'importe quel sous ensemble

**Etape 0**
RU [ A, B, C, D, E, F, G ]
A, B -> C
B -> D
C -> E
A -> F
F -> G

**Etape 1**
clé
{A}+ = {A, F, G}
{B}+ = {B, D}
{A, B}+ = {A, B, C, D, E, F, G}

RU = [ _A, B_, C, D, E, F, G ] _souligné_

**Etape 2 NF**
ANF
2NF DF E
	R1 [_A_, F, G]
	R2 [_B_, D]
	R3 [_A, B_, C, E]
3NF
	R11 [_A_, **F**] **Point tillés**
	R12 [_F_, G]
	R2	[_B_, D]
	R31	[_A, B_, **C**]
	R32	[_C_, E]


**INTEGRATION DE SQL DANS UN LANGAGE DE PROGRAMMATION**
=======================================================

#44
FW BD: hybernate, gpa

Processus métiers: web service 

PSN
	Module de persistance

#45
SQL pas un langage complet
	Pas de conditionnelles, d'itérations

Impédance mismatch
	Type table (dans SQL et pas dans langage de prog)

#46
Besoin de représenter les BD dans les langages de prog
Il faut trouver une interface de prog entre un langage de prog et un métamodèle qui permet d'accéder à la BD
Bouts de la base de données en mémoire et on intéragit avec la base de données

Récupération d'informations sur le métamodèle
	GET / SET

Quand on fait le métamodèle, on l'exploite pour ensuite fabriquer des éléments dans une BD

#47
Deux axes
	Statiquement ou dynamiquement
		Statique: PL/SQL
		Dynamique: Hybernate
	Intégré ou appelé
		Intégré: PL/SQL
		Appelé: Hybernate

#49
Langage hôte où on écrit les requêtes SQL C
Utilisation de ecpg
On fait le C embarqué de postgres
Connexion à la base de donnée avec EXEC SQL CONNECT, password non présent ici
BD conçue, connue.

#51
Section de déclaration où on déclare la variable int prix
	Besoin de connecter la variable prix avec le résultat de la requête SELECT
	INTO :prix -> déverse le résultat de la requête dans prix
		prix est une liste

#52
Curseur
	Itérateur
	Donne un curseur sur l'ensemble des éléments, met un curseur sur la liste donnée

Fetch (récupérer)
	prochaine valeur du curseur et on met les valeurs dans nom et prix

Problème
	Buffer, taille du nombre d'élements récupérés
	Dès qu'il y a un fetch, si ce qu'il y a en mémoire a été consommé on va faire une autre requête SQL

Statique, en dur
Il faut connaître la structure de la BD, les attribits
Les variables nom et prix sont des variables C

#54
Application qui va intéroger l'interface client via l'API de l'interface client et le serveur va sérialiser les requêtes qui arrivent (les rendre séquentielles).
Conditions qui permettent la sérialisation d'un ensemble de requêtes. Si pas sérialisable, jetée.

Interfaces particulières (API) qui ont été standardisées

#55
Couche d'abstraction universelle pour les BD -> ODBC
API pour des langages de programmation
	-> Java avec ODBC
	-> Code

#56
Application
Paquage défini pour java
Application qui pourra intéroger une requête Oracle et une requête MySql

#57
Type 1
	Windows
	Passer forcément par ODBC
	Application Java qui va appeler les procédures dans l'API JDBC
	Driver va faire un pont entre l'API JDBC et ODBC

Type 2
	Fournisseur de BD qui a écrit une API et qui la donne
	GET nom/...

Type 3
	Cas avec l'API JDBC
	Architecture de type 3 tiers (couches)
	Peut connecter de façon flexible plusieurs bases de données
	Côté de sécurité avec le serveur intermédiaire (ex: firewall)
	- négociation

Type 4
	Modèle complètement standardisé
	Le droit de tout faire
	Possibilité d'intéroger la métatable
	Architecture de type 2 tiers (couches)
	+ rapidité

#59
JDBC
	Ensemble de méthodes offertes par le langage

Chargement du driver postgresql

url
	Serveur sur lequel on se connecte

connection
	Sans mot de passe. On créé un objet connection et on utiliset la méthode getConnection du DriverManager

#60
On fabrique une requête
	Déclaration objet Statement
		dans l'objet connection, on fait un statement vide
	Plein de primitives dans la classe Statement -> executeQuery
	executeQuery execute dans l'objet statement la requête String en paramètre
	Met ça dans l'objet res qui est un ResultSet -> Liste avec itérateur dessus

Requête montre qu'on connaît la structure de la base de données
L'api permet de récupérer des informations
	Dans la classe ResultSet -> getMetaData()
		renvoie MetaData de ResultSet: structure de la table (nom, type, attributs)
		On peut faire de l'introspection

Boucle sur le nombre de colonnes de Ordinateur (grâce au ResultSet)
	getColumnCount(): Select qui compte tous les attributs qui sont dans la table Ordinateur
	On affiche le nom de la colonne: getColumnName(i)
	Affichage du type de la colonne

Statique
	Si la base de données évolue, pas de répercution sur le programme

#61
Tant qu'il reste des éléments dans le ResultSet, on affiche le résultat de la colonne "type"
Pareil pour le prix, on sait que c'est getFloat() qu'il faut appeler car dans la métabase c'est float et on sait récupérer le type
	Besoin de tester si le getColumnType correspond

Close le tout.
Moyen d'être robuste est de limiter le nombre de connexions.
Premier objet créé Connection
	Mieux de faire un tableau et d'ajouter les Connection

Très proche de la structure de la base de données
API figée et définie sur la MetaBase

Framework:
	On a une application & un modèle de données et ce modèle va être mappé avec une table (c'est nous qui le font) -> fichier de configuration en XML
	Quand on veut modifier les applications, il n'y a plus qu'à changer ça
	Flexible parce qu'on peut ajouter des applications & des tables et c'est géré par l'API
	API générée automatiquement et on peut l'appeler (*Hybernate*)

#62
Le JDBC passe après l'API (depuis java on fait GET/SET)

#64
Approches fondées sur des framework
POJO
	Objets java de base
	Sont applatis et les valeurs sont données dans une chaîne de caractère



**GESTION DES TRANSACTIONS**
============================

#4
Quand on a un ensemble de transactions, problème de sériabilité
	On veut que ça ait le même effet que si elles arrivent dans le désordre
	Filtrer les transactions avant

2 update forment une transaction
	Attention à la panne entr eles deux requêtes (débiter sans créditer)

Transaction
	Soit les transactions osnt réalisées les 2, soit pas du tout
	Garantir un retour en arrière
		journal, fichier log
		En cas de panne, on défait le journal et on défait 

#8
Volonté de faire de la reprise après panne
S'assurer que les changements effectués sont écrits sur le disque
	Une fois que les transactions sont ok on les met sur la BD

Plus on a des CP prets, plus la transaction va utiliser beaucoup de chose mais plus elle ira sur le disque

#10
Disques répartis en secteur de 512 octets

#11
Temps d'accès, on accède plus vite à la mémoire Cache

#12
Pb de la durabilité
	Lié à la reprise après panne
	Si on reprend après panne juste après la panne -> programme durable
	Si programme long et panne à la fin et pas de CP on reprend au début

#13
Mémoire centrale trafique avec le disque avec des blocs

#14
On lit le compte C1 avec une valeur de 1000 dans t
	Le compte C1 en mémoire centrale vaut 1000
On enlève 100 de t mais on a toujours 1000 sur le disque
On écrit t en mémoire C1 et on a 900 dans mem mais toujours 1000 dans disque
Seulement aux OUTPUT que la BD est cohérente

#15
Journal pour pouvoir modéliser une BD
4 types d'entrées
T, X, v
	Changement valeur de X
	Changement mémoire centrale, pas disque
START T
COMMIT T
ABORT T

#16

