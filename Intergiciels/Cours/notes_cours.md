# Intergiciels

Tuesday, 28. January 2020 08:00AM 

---

> [Cours en ligne](http://queinnec.perso.enseeiht.fr/Ens/intergiciels.html ) 
> cours.pdf

## I - Introduction

*#5*
Intergiciel pour donner une couche logiciel à la communication entre les deux machines. Permet de faire communiquer des logiciels entre-eux.

*#14*
Abstraire l'aspect bas niveau.  
Intergiciel = service (fonctionnalité).  
Un intergiciel a forcément une API. L'API est standardisée.  

Faire communiquer deux machines différentes par le réseau. L'intergiciel doit s'appuyer sur la couche transport du réseau de communication.  
Tous les intergiciels ont un service de nommage.  

Besoin de traiter l'hétérogénéïté si on a deux machines avec des os différents par exemple. 

*#15*
Fixer un langage commun qu'on instancie sur les différentes machines: **IDL** (*Interface Description Language*).

Sinon, définir un environnement unique qui est le même partout.
Par exemple un environnement Java avec une machine virtuelle Java.


## II - Communication par flots - Interface socket

*#3*
**API socket**: API standardisée qui donne accès à la communication type TCP/UDP.

*#4*
TCP offre un flot d'octets alors qu'UDP offre des messages. 
On veut traiter la communication à distance comme la lecture d'un fichier.

*#5*
Faire communiquer deux applications sur la même machine:

- Fichiers communs
- Base de données communes
- Mémoire partagée

Deux applications sur des machines différentes:
**Notion de pipe** avec deux processus qui communiquent via un tube. 
On est en réparti donc il va falloir dire sur quelle site tourne le pipe.

*#6*
Le site a un nom global et on désigne les entités distantes par le site et le numéro de port sur ce site.
On branche ensuite les processus sur les ports.

P1 est un processus qui a des descripteur de fichiers mais on a aussi des descripteurs de fichiers associés à des ports. 

*#7*
**Socket**: descripteur de fichier qu'on va associer à un numéro de port.
**Adresse**: identifiant de machine et numéro de port.
**Liaison**: permet de faire le lien entre un descripteur de fichier et un port.
**Association**: couple d'adresses, deux liaisons. Le numéro de port sur la machine A et le numéro sur la machine B.

*#8* **Schéma**
On fait des associations entre deux adresses pour communiquer.  
Processus 1 quand il lit ou écrit sur socket 2, ça permet de communiquer avec processus 3 socket 1.  
Quand on écrit sur socket 3 (P1), ça arrive forcément sur P4 socket 1.  
C'est le couple qui définit l'association et le chemin.  

Flêche violet socket de contrôle, on ne fait pas de communication avec mais on s'en sert pour contrôler le port. 

*#9*
Ports utilisateurs et ports standarts.

*#10*
API socket offre une vision connexion (TCP). Une fois que la connexion est établie, on a des séquences d'octets qui peuvent être envoyées et reçues.  

Côté datagramme sans connexion où on peut envoyer et recevoir des messages.

*#12*
Architecture symétrique pour faire du client/serveur.  
Le client demande la connexion. Mécanisme lui permettant de trouver le serveur qui l'intéresse.

*#13*
Communication client/serveur mode non connecté.

*#14*
Communication client/serveur mode connecté.

*#16*
Opérations dans l'API C pour les communications à distance. 

*#17*
Le serveur doit dire qu'on peut établir des connections sur le port ps.  
Pour cela il faut créer un socket, le nommer et écouter.

~~~C
csv = socket();
bind(csv,ps);
listen(csv,5); /* Toujours 5 */
~~~

Connect est bloquant. Quand connect réussi c'est qu'on a établi la connexion.  
Accept renvoie un nouveau socket connecté.

*#18*
Communicatin client/serveur. Partie d'en haut obligatoire:

~~~C
socket();
bind();
listen();
accept();
/* Bloque jusqu'à une demande de connexion */
~~~

Reste partie applicative. Client qui se connecte à un serveur avec `socket(); connect();`.

*#19*
**Client**  
`adrserv` construit avec l'adresse IP et le numéro de port.  
Socket dans le monde ip: `AF_INET`. Socket connecté: `SOCK_STREAM`.  

`inet_aton` prend une chaîne de caractères et remplie les 4 octets. `htons` hots to network qui prend un octet dans la machine et construit deux octets dans le format standart network.  

`connect` peut échouer s'il n'y a pas le serveur, besoin de faire du contrôle d'erreur.

Procédure toujours pareil pour la création du socket et la connection.

*#20*
**Serveur**  

*#21*
Mode non connecté sur un schéma client/serveur.  
`sendto` permet de donner l'adresse et le port de destination.  
`recvfrom` permet d'attendre des octets qui arrivent.

*#22*
sendto(socket pour entrées/sorties, ce qu'on envoie, le nombre d'octets, 0, adresse destination)

*#23*
`bind` pour lier le socket et l'adresse avec le port.  
`recvfrom` permet d'identifier qui a envoyé les octets: adresse et port du client.

*#27*
`gesthostbyname` renvoie toutes les informations de la machine.  
Type de l'adresse IPV4 ou IPV6.

*#28*
`bind` peut échouer si le port est réservé par l'administrateur ( port inférieur à 1024).

Si il y a déjà un bind et qu'on refait un bind, erreur.

*#30*
5 de `listen`: nombre de clients en attente possibles avant de rejeter. Contrôle d'une des files d'attente mais il y a 3 files d'attente.

*#36*
`fcntl` contrôle un descripteur de fichier et permet à read de ne plus bloquer s'il n'y a rien à lire.

*#37*
`setsockopt` prend un socket lié à un port lié à une famille. On peut attaquer différents niveaux jusqu'à la couche Ethernet. Au niveau TCP, on peut attaquer TCP via la taille d'un segment ou l'algorithme de contrôle de flux.

*#38*
On peut obtenir l'adresse IP et le port local d'un socket connecté.

*#40*
