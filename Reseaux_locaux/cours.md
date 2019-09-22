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
Latence = 10/10^9
	10 machines, et une interface 1 bit par station de la boucle.

#18
Méthodes distribuées
	Méthodes avec collision
	Méthodes sans collision
Méthodes centralisées
	Pas de méthodes avec collision

#19
Le récepteur peut recevoir sur deux fréquences différentes, il n'y a pas de collision.

Collision
	Pas de décodage
	Transmission en tension, filaire

#20
En sans fil, on traite des fréquences.
Au delà de 90dbm, on ne reçoit pas.

#21
**Méthodes à collision**

CSMA/CD sur Ethernet
	Carrier Sense Multiple Access / Collision Detection

#22

**Aloha**
3 phases
	1. Emission
	2. Détection de collision
	3. Réémission, retransmission

Méthode 

#23
Détection de collision quand on ne reçoit pas de ACK.
Retransmission en cas de collision, mais aucune garantie que ça fonctionne.

#24
Algorithme aloha. Retransmettre dès que c'est bon.

**Slotted aloha**
Attendre un début de slot.
Mettre en place un système de synchronisation.

#25
Le temps qu'il y a entre deux slots est constant.
On considère qu'on transmet un appel durant un slot, taille fixe de paquet.
Le paquet va être émis durant l'interval commençant par top. 
***A chaque top son paquet.***

#26
Avec quels paquets P2 rentre t-il en collision en Aloha ?
	Avec P1 et P3.
En slotted Aloha ?
	Moins, diminution des collisions.

#27
Les paquets partent au prochain top.
Aloha - Premier cas
	P1 P2 P3 P4 en collision
	**Interval de collision 2TE**
Slotted Aloha - Deuxième cas
	P1 P2 P3 en collision
	P4 part au prochain top
	**Interval de collision 1TE** (1 Slot)

#29
**Efficacité Aloha - Modélisation**

G : nombre de paquets total durant TE
N : nombre de stations
S : paquets neufs qui arrivent par TE
C : paquets en collision

G = S + C

Loi poisson λ

( (λt)^k / k! ) e^-λt

Hypothèse
	Le temps est compté en slot de TE.

Nombre de paquets en collision :
G X p

p = probabilité qu'un paquet soit en collision
p = 1 - paquet pas en collision
p = 1 - 0 paquets arrivés durant TE
p = e^-2G
	2G car interval de collision 2TE

G = S + (1 - e^-2G)G
S est max pour G = 0.5
S = Ge^-2G
S = e^-1 / e
S max = 1/2e = 0.18

**Efficacité Slotted Aloha**

On ne peut utiliser que 18% du système.

Ce qui change avec le slotted Aloha
	Un seul G, interval de collision = TE

On peut utiliser 36% du système.

Efficacité doublée car interval de collision réduit de moitié.

#32
*Combien de stations émettant à 100 kbps peuvent utiliser un canal type slotted aloha à 9600 kbps ?*
9600 x 0.36 / 100 = 34

#34
Une fois qu'un paquet a eu une collision, tout le monde retransmet. Si les stations ne sont pas au même endroit physique, elles ne reçoient pas les ack au même moment.
On utilise **random** pour décaler les retransmissions. 

#36
Ethernet CSMA/CD
Différence : écoute avant émission par rapport à Aloha. 

#40
Si le temps d'écoute est rapide -> CSMA
Sinon -> Aloha

Est-ce que l'écoute supprime la collision ? Quel est son intérêt ?
Non, si deux écoutent en même temps et émettent en même temps. L'intérêt est que ça diminue la collision. 

#41
Contraintes :
	Taille minimale de trame
	L / C temps pour réémettre la trame
	Besoin d'être en train d'émettre pour que la collision se produise.
	Pas de fullduplex en sans fil. Détection par logiciel

#42
En tout pour détecter une collision, il faut 2TP.

#43
Algorithme Binary Exponential Back off pour l'attente avant retransmission

#44
Plus les trames sont courtes, plus il y aura de collision.

#47
Gestion des timer dans le wifi.
Il faut que ce soit équitable. 

#48
La norme 802.11 indique que les intervalles de temps réduits entre trame, les SIFS, doivent être plus petit que ceux définis entre trames, les DIFS, pourquoi ?
	Pour donner la priorité à la transmission de l'acquittement devant une trame
	Eviter que l'acquittement soit en collision

Comment se passe la détection de collision pour les trafics destinés à plusieurs stations (broadcast) ?
	On ne peut pas faire de détection de collision quand c'est du broadcast, on ne renvoie pas d'acquittement.

#49
Problème avec station cachée (stations pas dans la même zone).

#50
Prévenir tout le monde par RTS/CTS
Ecoute virtuelle

#51
Mécanismes utilisés sur tous les wifi haut débit

#52
Wifi CSMA/CA avec RTS/CTS

#53
Si une station émet un 0 et l'autre un 1 : Celle qui émet le ° ne détecte pas la collision elle reçoit 0.
Canal retour / Canal echo avec ce qui a été reçu qui a été envoyé. S'il a reçu quelque chose différent de ce qui a été envoyé, il y a collision.

#54
1 j'envoie rien
0 différence de tension

#55
ref synthese1.png

#56 - QUESTIONS RAPPEL

Q1
---
a) Pourquoi l'utilisation d'un canal dont l'accès par plusieurs sources est géré en mode Aloha est-elle limitée ? Indiquez cette limitation, indiquez un moyen d'augmenter l'utilisation.
	L'utilisation est limitée car il va finir par y avoir des collisions. Limitation de **18%**. Le moyen d'augmenter l'utilisation à **36%** est d'utiliser **Slotted Aloha**.

b) Quelle différence y a-t-il entre les méthodes Aloha et CSMA ? Y a t-il une limite d'utilisation pour une gestion en CSMA ?
	Différence dans synthèse. Oui puisqu'il y a des collisions (entre 30% et 70% de l'utilisation globale).

Q2
---
Une application réalisée par un poste client et un poste serveur consomme en communication presque 100% de la bande passante d'un support partagé à 10Mbps. L'administrateur installe le poste serveur et le poste client sur un réseau Ethernet, qu'en pensez-vous ?
	C'est une mauvaise idée car l'utilisation sera limitée et il y aura donc inévitablement des collisions.

Q3
---
Soit deux stations qui émettent en même temps une trame de longueur L sur un canal de diffusion de débit C et tp le temps de propagation entre les deux stations, y aura-t-il une collision détectable matériellement si tp < L/C ?
	Détection collision
	temps max 2tp < L/C
	On sait que tp < L/C
	On peut pas savoir si 2tp < L/C

Q4
---
Quelle est la probabilité qu'une station Ethernet choisisse une valeur = K après la 5ème collision ?
	Voir slide 43
	2^5 - 1 = 31
	k = 1/31

#57
Les méthodes sans collisions
Synchronisation centrale
	Il y a un point central qui est chargé de distribuer des intervalles de temps, mais pas du polling qui donne la parole, c'est les machines qui disent ce qu'elles veulent.
	Chaque machine demande et le point central distribue.

#59
Envoi de requête sans collision
	Méthode de multiplexage statique avec canal spécifique
	Méthode par polling
Avec collision
	CSMA/CA

#60
Dans le sens descendant, il n'y a pas de collision car il est tout seul à émettre
Fréquences séparées avec le sens montant, pas de collision

#61
Méthode jeton
	Problème de complexité, complexe de l'implanter

#62
Timer associé pour pas que quelqu'un garde le jeton trop longtemps

#63
Si le temps d'émission est très grand devant le temps de propagation et le temps de latence
	La méthode qui a été normalisée est celle de #62
	On commence à récupérer avant d'émettre

#65
Contraintes physique
	Si trop longue distance, pas d'écoute
Contraintes de qualité de service liées au trafic
	Types d'application différente

#66
Deux classes de trafic
Trafic avec garantie (délai, débit, perte)
	
Trafic sans garantie


NORMALISATION ET MODÉLISATION DES MÉTHODES D'ACCÈS
--------------------------------------------------

#4
Modélisation
	On veut standardiser en définissant un modèle et ses composants vont être standardisés
	Modèle fonctionnel, on va définir toutes les fonctions qu'il y a dans le réseau local
	Modélisation hiérarchique

#5
3 niveaux
	Echange de trames
		Trame par trame, on vérifie si le support est libre
	Accès au support
		Méthode MAC : Medium Access Control
	Transmission sur le support
		Transmission sous forme de 0 et de 1 sur le support

#6
Toutes les versions d'éthernet n'utilisent pas le protocole
Versions d'ethernet sans méthode d'accès quand ils ne partagent plus le support. 

#9
On part d'un paquet IP
Paquet géré par le SE
Transmis à la carte de communication
	Carte a les trois niveaux
Le premier niveau ajoute le SAP -> 06 parce qu'il s'agit d'IP
Ajout des adresses MAC src et dest
	adresses réseau local
On ajoute des infos à la fin (ex CRC SFD)
Une fois fini, transmission physiquement sur le support

L'architecture fonctionne par encapsulation. Fait que chaque niveau ajoute des informations au niveau d'avant.

#10 
Echanges en réseau local se font de station paire en station paire (parité, sont pareil)

#12
RAN réseau régional

#13
Virtualisation VLAN

**802.3 -> CSMA/CD**

#17
Mécanisme de surveillance
Trame active qui s'envoie toutes les x secondes

#19
SD		Starting Delimiter (1 octet)
AC		Access Control (1 octet)
	PPP	3 bits de priorité
	T	(tocken), 1 si c'est une trame car jeton utilisé
	M	contrôle de coût
	RRR	3 bits pour modifier la priorité
ED		End Delimiter (1 octet)

Un tocken se transforme en trame, une trame peut se transformer en abort

#20

Mécanismes de surveillance et de réparation de panne
	Méthode centralisée

Monitaire actif a la position binaire M qui est dans le jeton et dans la trame de donnée
Automate opérationnel s'occupe d'avoir accès à un jeton
Automate moniteur passif qui observe

Détection de panne de moniteur avec le bit M = 0
S'il détecte une panne, il récupère ce qu'il y a dans la boucle et regénère un jeton

#21
Principe de recevoir des informations des voisins et si leur information est bonne, elle est transmise. Sinon, on ne dit rien.
On va chercher l'id le plus petit de moniteur.

#22
Intérêt topologie de boucle : fiabilité de fonctionnement
Utilisation de deux boucles et redondance pour que s'il y a une panne, le réseau continue à fonctionner
Si ça tombe en panne, on ferme l'anneau à l'endroit où il y a une panne et ça fait un C

#23
Méthode d'association pour que les stations connaissent le point d'accès

#25

