TD
===

4 - Exercice barbier
----------------------

siege = new Semaphore(1)
evt attendus / signalés
rasé & installé = new Semaphore(0)

(1) Processus barbier
repeter
	// client installé
	installé.P()
	raser()
	rasé.V()
	balayer()
sans fin


1 siège
(plusieurs clients)
repeter
	* Prendre une chaise *
	siege.P()
	* Quitter chaise salle d'attente *
	// Début SC
	s'asseoir()
	installé.V()
	// rasage fin
	rasé.P()
	se lever()
	// Fin SC
	siege.V()
	autre()
sans fin

-------------------------------------

1 siège
#Salle d'attente avec N chaises **

siege = new Semaphore(1)
evt attendus / signalés
rasé & installé = new Semaphore(0)
chaises = new Semaphore(N)

(1) Processus barbier
repeter
	// client installé
	installé.P()
	raser()
	rasé.V()
	balayer()
sans fin


1 siège
(plusieurs clients)
repeter
	* Prendre une chaise *
	chaises.P()
	salleAttente()
	siege.P()
	// Début SC
	s'asseoir()
	* Quitter chaise salle d'attente *
	chaises.V()
	installé.V()
	// rasage fin
	rasé.P()
	se lever()
	// Fin SC
	siege.V()
	autre()
sans fin

------------------------------------
#Salle d'attente occupée, client va chez un autre barbier

siege = new Semaphore(1)
evt attendus / signalés
rasé & installé = new Semaphore(0)
int chaisesLibres = N
mutex = new Semaphore(1)

(1) Processus barbier
repeter
	// client installé
	installé.P()
	raser()
	rasé.V()
	balayer()
sans fin


1 siège
(plusieurs clients)
repeter
	mutex.P()
	si chaisesLibres > 0 alors
		* Prendre une chaise *
		chaisesLibres--
		mutex.V()
		salleAttente()
		siege.P()
		// Début SC
		s'asseoir()
		* Quitter chaise salle d'attente *
		mutex.P()
		chaisesLibres++
		mutex.V()
		installé.V()
		// rasage fin
		rasé.P()
		se lever()
		// Fin SC
		siege.V()
		autre()
	sinon
		mutex.V()
		sortir()
	fsi
sans fin


---------------------------------
Exercice Barbier avec moniteurs
===============================

1 siège, pas de salle d'attente, plusieurs clients

## 0

0. Objets partagés
	- siège
	- barbe

1. Interface
	- s'asseoir()
	- se lever()
	- raser()

2. Prédicats d'acceptation
*À quelle condition peut-on exécuter l'opération sans devoir attendre ?*
	s'asseoir()
		- le siège est libre (et client barbu)
	se lever()
		- barbe rasée
	raser()
		- barbe présente

3. Variables
	libre, rasee booleans = V, V
	invariant: ¬(¬rasee ^ libre) = rasee ^ ¬libre

4. Prédicats logiques
	libre
	rasee
	rasee

invariant (quels sont les états possibles)

libre |   V   |   F   
----------------------
rasee |---------------
  V   |  ok   |  ok   
  F   |  ko   |  ok   

¬(¬rasee ^ libre)
	L'invariant

5. Variables conditions
Interface
AP - s'asseoir() est possible
LP - se lever() est possible
RP - raser() est possible

6. **s'asseoir**
si ¬libre alors
	AP.attendre()
fsi
{libre}
libre = F
rasee = F
{¬libre ^ ¬rasee}
RP.signaler()

**se lever**
si ¬rasee alors
	LP.attendre()
fsi
{rasee}
libre = V
{libre}
AP.signaler()

**raser**
si ¬(¬rasee) alors
	RP.attendre()
fsi
{¬rasee}
rasee = V
{rasee}
LP.signaler()


**7 - Les lecteurs et les rédacteurs**
======================================

-> accès à un fichier partagé
	lecteurs lire()
	rédacteurs ecrire()

0. Fichier

1. Interface
	lire() encadré par DL() TL()
	ecrire() encadré par DE() TE()
Pb: opérations du moniteur exclusives

->	DébuterLecture() // Opération du moniteur
	lire() // non opérée par le moniteur
	TerminerLecture() // Opération du moniteur

+ lecteurs prioritaires (politique)
	Si on a à choisir entre faire passer un lecteur ou un rédacteur, on fait passer un lecteur

Quelque soit la politique, il faut une exclusion entre une écriture et toute autre opération

DL() : pas d'écriture en cours
DE() :	pas de lecture en cours,
		pas d'écriture en cours,
		*pas de lecture en attente* (contrainte spécifique à la priorité des lecteurs)
			LP.vide() (lecture possible)
		nl = 0 ^ ¬red ^ LP.Vide()

-> variables d'état : étape 3
red: boolean (un rédacteur occupe le fichier)
nl: entier (nb lecteur)
nla entier (nb lecteur en attente)

¬(red ^ nl > 0)

Interfaces (étape 1)
**DE**
	¬(red ^ nl > 0)
	pas de lecteur en attente
variable condition EP pour écriture possible -> pas d'écriture, de lecture en cours et de lecteurs en attente : étape 2
	¬red ^ nl = 0 ^ nla = 0
---------
si ¬(¬red ^ nl = 0 ^ LP.Vide()) alors
	EP.attendre()
fsi {¬red ^ nl = 0 ^ nla = 0}
red = vrai
{red ^ nl = 0}
-------

**DL**
Variable condition LP pour lecture possible -> pas d'écriture en cours (¬(¬red) <- étape 4)
---------
si ¬(¬red) alors // On attend la condition pour démarrer la lecture
	LP.attendre()
fsi {¬red ^ nl > 0}
nl++
{nl > 0 ^ ¬red}
LP.signaler() // réveil en chaine ses lecteurs
-------

**TL**
	Pas de condition pour terminer lecture
---------
nl--
{¬red ^ nl >= 0}
si (nl = 0) alors {¬red ^ nl = 0 ^ nla = 0}
	EP.signaler()
fsi
-------

**TE**
	Pas de condition pour terminer écriture
---------
red = faux
{¬red ^ nl = 0}
si nla = 0 alors
	EP.signaler()
sinon
	LP.signaler()
fsi
-------

Etape 5
Variables conditions
LP
	Lecture possible
EP
	Ecriture possible


Lecteurs rédacteurs FIFO
	-> accès par ordre chronologique lecteur ou rédacteur
==========================================================

-> Une seule file d'attente
Variable condition **Accès** où les lecteurs et les rédacteurs vont se ranger

**DL**
	pas de rédacteur en cours, personne n'attend -> LP
------
si ¬(¬red ^ Acces.Vide()) alors
	Accès.attendre()
fsi {¬red ^ personne devant}
nl++
{¬red ^ nl > 0} -> vrai si le suivant est un lecteur, faux si c'est un rédacteur
---

**DE**
	pas de rédacteur en cours
	pas de lecteur en cours, personne n'attend -> EP
		-> *LP.Vide() ^ EP.Vide()* devient Accès.Vide()
------
si ¬(¬red ^ nl = 0 ^ Acces.Vide()) alors
	Acces.attendre()
fsi {¬red ^ nl = 0 ^ personne devant}
red = vrai
---

**TL**
	pas de condition d'acceptiation
------
nl--
{¬red ^ nl >= 0}
si nl = 0 alors
	Acces.signaler
fsi
---

**TE**
	pas de condition d'acceptiation
------
red = faux<
Acces.signaler()
---

Au dessus, réponse à FIFO
En dessous, optimisation:
	Permettre à une série de lecteurs en attente d'accéder aux fichiers en parallèle

**DL**
	pas de rédacteur en cours, personne n'attend -> LP
------
si ¬(¬red ^ Acces.Vide() ^ sas.vide()) alors
	Accès.attendre()
fsi {¬red ^ personne devant}
nl++
{¬red ^ nl > 0} -> vrai si le suivant est un lecteur, faux si c'est un rédacteur
Acces.signaler()
---

**DE**
	pas de rédacteur en cours
	pas de lecteur en cours, personne n'attend -> EP
		-> *LP.Vide() ^ EP.Vide()* devient Accès.Vide()
------
si ¬(¬red ^ nl = 0 ^ Acces.Vide() ^ sas.vide()) alors
	Acces.attendre()
fsi {¬red ^ nl = 0 ^ personne devant}
si nl > 0 alors // réveil en chaine donc se rendormir
	Sas.attendre() // Création variable condition pour ranger l'écrivain qui se fait réveiller 						par erreur (réveil en chaine)
fsi // personne devant et acces ok
red = vrai
---

**TL**
	pas de condition d'acceptiation
------
nl--
{¬red ^ nl >= 0}
si nl = 0 alors
	si sas.Vide() alors
		Acces.signaler()
	sinon
		sas.signaler()
	fsi
fsi
---

**TE**
	pas de condition d'acceptiation
------
red = faux
Acces.signaler()
---


EXERCICE 5 - VOIE UNIQUE
========================

processus train
	direction: direction; (OE, NS)
	demarrer(direction);
	repeter
		arriver_au_tronçon();
		Entrer(direction);
		passer le tronçon;
		Sortir();
		arriver_à_destination();
		direction := successeur(direction);
	sans fin
fin train

 // Chaque train envoie un message sur le canal quand il dépose une requête !_
boucle
	arrêt gare E
	* entrer_E() !_
	rouler sur la voie unique
	* sortir !_
	arrêt gare W
	* entrer_W() !_
	rouler sur la voie unique
	* sortir() !-
fboucle

Algorithmes des actions Entrer et Sortir

## Un train seulement peut se trouver sur le tronçon à voie unique


## Un nombre illimité de trains peuvent circuler en même temps sur le tronçon à voie unique (à condition qu'ils aillent dans le même sens)
Pour chaque requête, j'ai un canal
3 branches dans le select qui correspondent aux 3 requêtes

canaux: entrer_E, entree_W, sortir
variables: 

boucle
	-> entrer_E ?_
☐
	-> entrer_W ?_
☐
	-> sortir ?_
fin boucle

entrer_E:
	pas de train sur la voie unique ou la direction courante est l'ouest
entrer_W:
	pas de train sur la voie unique ou la direction courante est l'est
sortir:
	/ - On suppose que tous les trains qui sortent sont rentrés

variables d'état
	nbtrains: entier := 0
	dc (E,W) := E

boucle
	nbTrains = 0 V dc = W -> entrer_E ?_ ;
	nbTrains++;
	dc = W;
☐
	nbTrains = 0 V dc = E -> entrer_W ?_ ;
	nbTrains++;
	dc = E;
☐
	-> sortir ?_ ;
	nbTrains--;
fin boucle

## Au plus N train speuvent circuler en même temps sur le tronçon à voie unique. Considérer les risques de privation dans ce cas, et donner les moyens de les éviter.

TRANSACTIONS
============

# 12
Mémoire stable: disque dur

Capable de défaire le travail de n'importe quelle transaction
	On a l'atomicité

Si une transaction abandonne, on peut la défaire pour retourner à l'état initial

# 13
Quand on annule une transaction, il faut annuler son travail mais également toutes les transactions qui ont utilisé des valeurs écrites dans la première transaction.


