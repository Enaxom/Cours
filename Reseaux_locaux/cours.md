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
Fonctionne sur différentes topologies
Sans (adhoc) ou avec infrastructure

#25
Fonctionnement avec infrastructure
Lorsqu'on veut transmettre, il faut découvrir puis s'associer à un point d'accès
Lorsqu'on cherche un point d'accès, on fait un probe request et on aura une réponse

#27
Phase d'authentification
Règles d'authentification, on essaye de les sécuriser
	Certains matériels ne supportent pas les mécanismes de sécurité ou n'ont pas été mis à jour

#29
Partie du temps sans collision

#31
Les machines doivent avoir la même bande de fréquence pour communiquer


ÉLÉMENTS DE NORME D'ARCHITECTURE LAN
--------------------------------------------------

#4
1 octet 2 caractères hexa
6 octets dans l'adresse MAC

#5
**Représentation adresse MAC**
Octet 0 à gauche
	Premier octet transmis
	Dans trame ethernet, adresse destination en premier

#6
Deuxième bit transmis U/L
	Dit si l'adresse est universelle ou locale
Adresses locales
	Utilisées pour connexion wifi
3 octets qui identifient un constructeur

#7
Première position qui est transmise
Si adresse individuelle, identifie qu'un seul élément
Si on utilise du multicast, I/G=1 et il va y avoir plusieurs éléments car c'est une adresse de groupe

***Un réseau local est un domaine de diffusion MAC qui contient tous les éléments capables de recevoir une trame MAC de diffusion***

Le point d'accès récupère la trame de diffusion et la retransmet.

#10
Il est possible de représenter une adresse en hexadecimal ou en binaire inverse
Représentation hexadecimal : on commence par transmettre le bit de point faible de l'octet

#14
**Schema important**
Encapsulation de LAN dans IP

On va chercher l'adresse MAC de la passerelle dans la table ARP

#15

## Q1 - Comment un PC sait qu'il est destinataire d'une trame ?
Il va regarder l'adresse destination MAC

## Q2 - Une machine connaît l'adresse IP du destinataire à qui elle émet. S'il est sur le même réseau local qu'elle, comment connaît-elle son adresse réseau local ?
En faisant une requête ARP

## Q3 - Si le destinataire n'est pas sur le même réseau local, qui reçoit la trame ?
La carte du routeur qui est sur le même réseau local que la station

## Q4 - Comment le routeur sait qu'il doit relayer une trame MAC reçue sur un port 1 vers un port 2 ?
Examine l'adresse IP destination, va dans la table de routage et en fonction de ça il va savoir que le réseau de l'adresse de destination est sur le port 2

#16
Il faut rester compatible
Mécanique transparente aux utilisateurs

#18
Configurer les points d'accès en mode bridge

#20
Segmentation niveau 2/3

TCP / UDP
	Numérote par trame
	Numérote par octet

#30

## Q1 - Une station peut-elle avoir plusieurs adresses Ethernet ?
Oui si la station a plusieurs cartes Ethernet. 
Elle a une adresse ethernet, une adresse broadcast et 0 à * multicast. 

## Q2 - Que représente le OUI dans une adresse MAC ?
L'identifiant du constructeur.

## Q3 - Les adresses réseau local ont-elles une signification locale ou universelle ?
Position U/L
Une adresse peut être U ou L, les deux sont possibles. Elles ont une signification locale ou universelle, c'est précisé selon la valeur d'une position.

## Q4 - Quelle est la valeur d'une adresse MAC de broadcast ?


## Q5 - Soient deux adresses MAC en notation canonique AC DE 48 00 00 80 et AD DE 48 00 00 80 ces adresses ont-elles été allouées par le même constructeur ?


## Q6 - A quel type d'adresse correspond 01-00-5E-AB-CD-EF. Cette adresse peut elle re présente dans le champ source ?


## Q7 - Le protocole d'échange de trame entre deux stations de réseau local effectue le contrôle d'erreur et le contrôle de flux (VRAI / FAUX / ÇA DÉPEND)


**SEGMENTATION ET VIRTUALISATION**
----------------------------------

#3
Data Center Bridge

#4
On choisit de se synchroniser par le codage
Starting Frame Delimiter octet 10101011

#5
CRC
	Reste de la division polynomiale des données
Polynome de degré 32, reste de degré 31 donc 32 position de reste
	-> 4 octets de CRC

Si le CRC est juste, c'est qu'on est bien synchronisé. S'il est faux, la trame est détruite
On envoie l'adresse destination en premier

2 octets qui sont soit une longueur, soit un champ

#6
Longueur maximale pour pouvoir faire du partage
Valeurs définies pour Ethernet partagé
Data minimum 46 octets, sinon on complète et on rajoute des données

64 octets pour les collisions

#7
Champ L/T : longueur ou type

#8
Champ L/T qui va avoir comme rôle d'être une longueur
LLC source destination & contrôle
On sait si c'est de l'IP ou pas en fonction des zones LLC

Si c'est plus petit que 1536 -> longueur
Sinon -> type

#9
Les équipements parlent entre eux en LLC
On identifie en utilisant 2 octets du champ type qui avait été prévu initialement au champ value
	Deux octets de champ type et 3 octets à 0
On sait les données transportées grace au champ type

