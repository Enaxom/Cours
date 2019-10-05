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

red: boolean (un rédacteur occupe le fichier)
nl: entier (nb lecteur)
nla (nb lecteur en attente) ou LP.vide()
