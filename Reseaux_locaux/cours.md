=========================================================================================
============================== ARCHITECTURE RESEAUX LOCAUX ==============================
=========================================================================================

#4
**Réseau local**
	Topologie diffusée (broadcast)
	Quand quelqu'un émet, tous les équipements du réseau local reçoient et filtrent par rapport à l'adresse.

#5
Noms de réseaux locaux (LAN) :
	Ethernet
	Bluetooth
	Wifi
	Token ring
	LoRa

Méthodes d'accès, adresses, diffusion.
	Diffusion : "air", topologie filaire.

Noms de topologie :
	Etoile
	Bus
	Boucle / Ring

2 adresses IP pour encapsuler un paquet sur un cable réseau local entre PC et imprimante
	L'adresse de l'émetteur (PC)
	L'adresse du récepteur (imprimante)

Soit A, B, C reliés par un réseau local sans fil, A émet des paquets IP à B
	C reçoit le paquet, regarde l'adresse de destination
		Si c'est pour elle, envoyé au système d'exploitation
		Si non, destruction du paquet
		Traitement : filtrage par l'adresse de destination

#7
Méthodes d'accès pour partager du temps d'emission afin de
	Faire des économies
	Utiliser un support non filaire partagé

Ordonnancement
	Pas forcément d'unicité, plusieurs peuvent communiquer en même temps

#8
Méthode d'accès

**Statique**
	Allouer un temps de parole fixe
	Le système peut être mal dimmensionné

**Dynamique**
	Temps de parole qui varie
	Allouer le temps de parole selon les besoins

#9
Multiplexage statique temporel
	MIC : *Modulation par Impulsion et Codage*

L'espace est partagé entre plusieurs antennes -> multiplexage statique

En quoi l'allocation statique de la bande passante est-elle un inconvénient pour le trafic de données ?
	Si on a besoin de plus de bande passante momentanément et que les autres n'en ont pas besoin, on ne peut pas l'utiliser -> **problème d'efficacité d'utilisation**

Quel est l'intérêt d'une allocation dynamique à une demande de la bande passante ?
	Efficacité

#10
Partage dynamique avec méthode centralisée
	Protocole de polling : maître / esclave

En quoi l'algorithme de polling est-il non scalable (ne supporte pas le passage à l'échelle) ?
	Plus il y a d'esclaves, plus le temps est perdu et les machines peuvent attendre longtemps avant d'émettre.

#11
Le maître reçoit des demandes d'émission et donne des intervalles de temps aux esclaves pour émettre.


Quel est l'intérêt des solutions de partage du support décentralisées ?
	Si le chef meurt, la méthode centralisée ne marche plus.

#12
Méthode distribuée, chacun determine son ordre d'émission. Chacun se débrouille seul.

Inconvénient : aspect contrôle
Si une station transmet davantage et prend toutes les ressources, il faut rajouter des fonctions de qualité de service pour pouvoir contrôler l'affectation de la transmition.

#13
Domaines d'application des méthodes d'accès.
En réseau local filaire il n'y a plus de méthodes car il n'y a plus de partage. 

Méthodes pour sans fil / satellites, mais pas en filaire.
Pour qu'il y ait une méthode d'accès, il faut diffuser à tout le monde.

#14

SYNTHESE
--------


#15
Equité : tout le monde a de la bande passante proportionnellement à ses besoins.
Coût : complexité

#16
Méthodes d'évaluation
	Formulation
	Simulation
	Emulation
	Métrologie

#17
TE = L/C
	L : longueur du paquet en bit
	C : débit

Tp = d/v
	d : distance
	v : vélocité du signal (ref vitesse de la lumière)

T latence = équivalent bit / C
Ex : T latence 1 bit -> on perd 1/C de temps

Temps total TE + Tp + T latence

Indiquez les composantes du délai pour transmettre une information de 64 octets et qu'elle fasse le tour de la boucle de 1km à 2 * 10^8 m/s et 1 Gbps avec une interface 1 bit par station de la boucle.
TE = 64 * 8 / 10^9 = 5.12 * 10^-7s
Tp = 1000 / 2 * 10^8 = 2.6s
