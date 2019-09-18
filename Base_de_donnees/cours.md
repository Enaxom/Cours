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


