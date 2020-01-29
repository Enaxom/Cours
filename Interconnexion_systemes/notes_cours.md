# Interconnexion des systèmes

*Tuesday, 28. January 2020 10:15AM*

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

*TD Réseau n°1 - TD1.md*
