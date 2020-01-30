# Interconnexion des systèmes

Tuesday, 28. January 2020 10:15AM

---

> 2 cours papier - Interconnexion de Réseaux 1 et 2
> [Cours](http://irt.enseeiht.fr/beylot/enseignement/index.html) 

## Interconnexion de Réseaux - 1

*#3*
**Architecture de réseau**: modèle de référence qui permet de décrire les moyens physiques et logiques nécessaires à la mise en place de communications entre machines distantes.

*#4*
**Modèle OSI**
Beaucoup de problèmes à traiter quand on veut faire communiquer deux machines distantes.
Faire un découpage modulaire pour découper le problème en sous-problèmes.

**Notion de hiérarchie**
*Voir schéma #10*
**Architecture de réseaux**: définir le comportement de chacune des couches.
L'implantation est laissée aux fabricants de cartes réseaux/ordinateur.

Une entité de niveau N va proposer des services au niveau supérieur N+1.

*#5*
Un service est découpé en plusieurs fonctions élémentaires appelées **primitives de service**:

- La requête: primitive de service entre le client et le téléphone quand on demande à faire un appel. N+1 vers N.
- L'indication: indique à N+1 qu'il y a une demande d'appel téléphonique.
- Réponse: l'utilisateur décroche. N+1 vers N.
- Confirmation: appel confirmé. N vers N+1.

Les services de déconnexion sont en deux primitives de services: requête et indication.

*#7*
**Protocole**: consiste à gérer des dialogues entre des entités homologues.
A chaque niveau protocolaire, on y ajoute des informations pour qu'il se déroule correctement.

*#8*
Dialogues entre niveaux N et N+1 avec SAP (*Service Access Point*).
Sur une même machine, les données échangées sont des SDU (*Service Data Unit*). Données envoyées par l'entité N+1 vers l'entité N.

On peut envisager pour la concaténation:

- On prend plusieurs N+1 PDU et on fabrique un seule SDU et on demande à N de l'envoyer.
- On prend plusieurs N-SDU et on fabrique une seule N-PDU

La concaténation peut être réaliser au niveau du service ou protocolaire.
Une N+1 PDU ne peut pas être découpée en plusieurs SDU.

*#9*
Volonté de minimiser les échanges entre couches.

Contrôle d'erreur:

- Détection d'erreur
	- Partie redondance cohérente et pas de retransmission
	- Pas cohérente donc on restransmet
- Mécanisme de retransmission
	- Accusé de réception positif/négatif

Contrôle de flux:

- Accusé de réception

Modèle OSI pour identifier les fonctions à mettre en oeuvre et essayer de faire en sorte qu'un niveau s'occupe de choses homogènes.

*#11*
Sur chaque niveau protocolaire, on cherche à savoir si c'est un service avec ou sans connexion.
Protocole qui propose avec ou sans connexion: HDLC, LAPD.

**Multiplexage**: service qui permet d'envoyer au travers d'une connexion de niveau N des données de niveau N+1.

Erreur de transmission != perte due à la congestion.
Contrôle de flux avec le mécanisme à fenêtre.

*#13*
Plus la couche physique est fiable, plus la couche laison de données sera légère.

*#14*
Couche réseau qui a pour objectif d'acheminer les messages entre chaque extrémité. N-PDU ou paquet.

*#16*
On peut mettre des points de synchronisation pour pouvoir reprendre au dernier point synchronisé en cas de panne.

*#17*
On doit connaître la représentation de la machine interne pour pouvoir convertir les données.
Compression -> algorithme qui compresse au niveau de l'émetteur, algorithmes souvent lents.

*#22*
IEEE Couche physique, mac, llc.
Pas de dépendance entre la couche mac et physique.
La description des standarts IEEE se fait de manière assez conforme au modèle OSI. 

*#23*
Modèle du monde télécom. On a plusieurs piles de protocoles en parallèle plutôt qu'une pile de protocole.

---

Tuesday, 28. January 2020 02:00PM 

---

*TD Réseau n°1 - TD1.md + TD1 feuille*

---

Wednesday, 29. January 2020 02:00PM 

---

*Fin TD1 Réseau - TD1 feuille 2*

---

# Interconnexion de Réseaux - 2

*#3*
Interconnexion par encapsulation (ex IP sur Ethernet)
Interconnexion par Traduction: Traduire les messages du réseau R1 pour le réseau R2.

*#4*
**Interconnexion par traduction**
Problèmes lorsqu'un réseau est sans connexion et veut communiquer avec un réseau mode connecté.
Exemple: On repère les flux actifs et lorsuq'il y en a un nouveau on lance une connexion.

*#5*
**Interconnexion par encapsulation**
Problèmes quand on est entré dans le réseau R2 pour trouver l'adresse de sortie du sous-réseau R2.

---

## Interconnexion de Réseaux télécoms de transmission de données

***Exemples utilisés: ATM, Frame Relay, X25***

*#7*
Les extrémités fonctionnent en X25 et coeur en Frame Relay.
Problème d'interconnexion de la famille **encapsulation**. On veut encapsuler les paquets X25 et les faire passer sur un réseau Frame Relay.

**Adressage**
*Pb:* Trouver le point de sortie du réseau FR qui permet d'atendre l'entité X25 à l'extrémité droite.
FR n'utilise pas d'adressage. Il va falloir trouver l'adresse X25 du commutateur avant dernier à droite.

**Mode connecté/non connecté**
X25 -> mode connecté.
Frame Relay -> mode connecté.

Les opérateurs ont choisi des connexions permanentes entre toutes les extrémités. Quand il y a une demande de connexion X25, il suffit de l'envoyer en fonction de l'@ destination, les paquets X25 trame Q922 avec DLCI qui les fait ressortir à l'avant dernier commutateur.

Si connexions Q922 non permanentes
Regarder s'il y a une connexion X25 Q922 ouverte entre commutateur 2 et 4 et s'il y en a pas, on regarde l'adressede destination avant. Si on a une connexion Q922 établie c'est fini sinon on demande à 33 ouverture 22 entre 2 et 4.
Quand 922 établi par 933, on envoie la demande de connexion X25 à l'intérieur de la connexion qu'on vient d'ouvrir. 

**Qualité de service**
Si on a une erreur de transmission, Q922 détruit. Une perte de paquet va se traduire par un paquet manquant par X25.
X25 attend de recevoir un paquet correct qui ne porte pas le même numéro et enverra une demande de retransmission.
X25 va pallier les quelques manques du réseau Q922.

*#8*
**X25 dur TCP**
Extrémités en X25. Interconnexion par encapsulation.
Protocole XOT entre X25
 et TCP -> X25 over TCP.

**Adressage**
On connaît l'adresse X25 va falloir trouver l'adresse IP de sortie. Deux adressages incompatibles.
Le nombre de réfractaire est faible donc on peut garder en dur dans une table les correspondances entre adresses.

**Mode connecté**
TCP: connecté
X25: connecté
Quand on a une demande de connexion X25 on ouvre une connexion TCP puis on envoie une demande de connexion X25.

Connexion permanente -> pas de procédure de connexion.
Pour TCP, on a la liste des connexions permanentes et quand on a plus rien sur une des connexions X25 on ferme la connexion TCP et quand on revoie un paquet sur la connexion on réouvre la connexion TCP.

**Qualité de service**
X25 et TCP fiables.

*#9*
**FR sur ATM**
Frame Relay sur une AAL, ici AAL 5 mais on aurait du mettre AAL 3/4.

**Adressage**
Q922 n'a pas de format d'adresse.
3/4 formats d'adresse pour ATM.

**Connexions**
FR mode connecté.
ATM mode connecté.

Cas le plus simple -> connexions ATM permanentes et connexions FR permanentes.

Connexion FR commutée sur connexion ATM commutée -> voir X25 sur FR

Connexions FR commutées et connexions ATM permanentes

Connexions FR permanentes et connexions ATM commutées -> plus compliqué

**Qualité de service**
ATM 4 classes de services: CBR, ABR, VBR, UBR.
La classe de service qui correspond aux connexions FR est ABR.
Débit maximal: somme du débit garanti.
CIR de FR = minimum cell rate d'ATM.
Le relayage de trame ne s'occupe pas de la gigue.

CIR, EIR, taux de perte délais.

