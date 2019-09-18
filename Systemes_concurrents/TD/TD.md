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
