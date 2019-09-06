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
