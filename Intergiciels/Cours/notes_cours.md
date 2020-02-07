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
**Programmation Java**

---

Thursday, 30. January 2020 10:28AM 

---

## III - Appel de procédure et de méthode à distance

Wednesday, 05. February 2020 4:15PM 

---

*#3*
Appel de procédure à distance - RPC (Remote Procedure Call)

Le code est ailleurs et quand on appelle la procédure elle va s'exécuter ailleurs (ici sur le serveur). Les paramètres de sortie reviennent au client.

*#4*
On appelle une procédure qui est sur une autre machine, dans un espace différent.
Appelant appelle la procédure et attend qu'elle soit finie.

Système de question/réponse. On demande quelque chose à la procédure elle nous répond.

Si la procédure plante, on a donc un morceau du système qui plante.
Le réseau est moins fiable que la machine.

*#5*
But que du point de vue utilisateur, il ne voie pas la différence entre appeler une procédure dans son programme ou ailleurs. Il ne faut pas que ce soit distingable.

Protocole de transport pour transporter les données, besoin de savoir un peu les particularités du protocole.

*#6*
On veut que ce soit transparent: il faut que depuis le client on appelle une procédure comme si elle était locale et que ça exécute la procédure du serveur.

Client: on appelle une procédure locale, mais de l'autre côté (serveur) il y aura un bout de code qui va appeler la procédure.
Du coup c'est les deux **talons** qui communiquent et le programme client ne sais pas que ce n'était pas un appel local.

On a des paramètres à envoyer pour la procédure. 
Je veux appeler telle procédure sur telle machine avec tels paramètres

Le talon fait ça, il fait un paquet avec tout ce qui doit être exécuté, où et avec quoi. Puis, il envoie le talon.
Le talon serveur récupère les paquets arrivant.
Le veilleur ouvre le paquet et donne la main au proxy qui s'occupe de la procédure avec les paramètres.

Puis la procédure est exécutée par le talon.

Même cheminement en sens inverse pour renvoyer les paramètres de sortie à celui qui avait fait la demande.
Le client voit donc un return et pense que c'est un appel local.

Les talons sont locaux. 

*#7*
Client qui appelle la procédure d'un serveur. Paramètres de sortie perdus.

Sémantique:

- Best effort, sans garantie

*#9*
Résistant aux pertes. Si un message est perdu, on recommence. On a le risque d'avoir plusieurs exécutions pour un retour.

*#10*
Pour pas exécuter deux fois la même procédure, il faut que la machine se souvienne des appels et des valeurs renvoyées et ne pas exécuter un double appel.
Le client doit aussi numéroter ses invocations pour que le serveur soit sûr qu'il sagisse d'un doublon.

Sémantique au plus une fois. Il y a peut être plus de réseau entre les machines.

*#12*
Espace mémoire distinct permet de séparer l'appelant et l'appelé. Isolé d'un point de vue sécurité.
L'appelé est sur que l'appelant va le déranger que pour les paramètres.

Pas de variable globale vue que les machines sont différentes.

Passage par copie. Si on a des références (ex: liste chaînée), on a 3 possibilités:

- Interdire de passer des références
- Mécanisme de sérialisation. On prend la liste chaînées et la structure va être sérialisée et transformée puis sera restructurée de l'autre côté
- Tous les pointeurs sont accessibles de partout

*#13*
1ère approche plus universelle pour des machines d'architectures similaires. 
Inconvénient: les entiers sont sur 4 octets, et les entiers sont pas rangés pareil selon les processeurs

2ème approche plus performante machines architectures différentes.

*#14*
Il faut trouver un moyen de communiquer avec la machine et son nom sachant qu'on a que le nom de la prcédure.

Pas de nom de méthode mais nom de service liée à l'opération.
À partir du module, on verra sur quelle machine il est.

*#15*
Service de nommage prend un nom de procédure et renvoie l'adresse le numéro de port.
Le serveur doit s'enregistrer dans le service d'annuaire. Tel serveur qui offre telles procédures port 626.

On veut que ce soit transparent donc c'est les talons qui vont se charger de ça, et pas le programme applicatif. Quand le proxy démarre, il va informer l'annuaire. Plus tard, il pourra faire l'appel.

Fichier de configuration ou service de nommage qui tourne sur les deux machines et le même port. 
Le service de nommage est un service à distance.

*#16*
Le talon établie le socket et fait la communication.
Le talon interroge le portmapper et le service de nommage.

*#17*
Talons spécifiques à la procédure.

```ada
declare
	x: natural
begin
	n.f(2,3,x);
	n.f(6,8,x);
end

Module m

	procedure f(a: natural, b: natural, c: out natural)
		begin
			c := a+b;
		end
```

*#19*
IDL: Langage qui est exclusivement déclaratif, pas langage de programmation.

*#21*
Appeler une procédure d'un service d'une machine (host), in comme octets d'entrée, out de sortie et deux fonctions de codage pour dire comment on a codé et comment on décode les octets de paramètre en entrée.

`callrpc` va interroger le portmapper du host en demandant sur quel port est prognum.
Il fait un socket connect vers le numéro de port renvoyé. Prend les paramètres, exécute la procédure. Décode la séquence retour et renvoie le out.

`registerrpc` 

*#23*
`atoi` prend une chaîne de caractères et renvoie l'entier qui correspond

Quand le programe démarre, il indique que la procédure est disponible. 
Programme tant et procédure 12. Si on veut l'appeler, c'est avec maproc.
Ensuite enregistré dans le portmapper et plus qu'à attendre les requêtes

*#24*
Possibilité de faire du broadcast.

*#26*
`RPCGEN` génère les talons clients et talons serveurs. 

*#28*
`rproca` 2 paramètres
`rptocb` pas de paramètre

*#29*
Programme serveur doit écrire le code applicatif -> `rproca`

*#30*
Construction d'applications éparpillées sur plusieurs machines sans changer de façon de coder. 

Obligé de mettre le nom de la machine
Le client demande au serveur. Le serveur fait et répond.
=> Pas le même rôle.

*#31*
XML-RPC passe par HTTP. Ils prennent XML comme remprésentation standart.

SOAP cache le protocole de communication.

---

Thursday, 06. February 2020 08:00AM 

---

*#33*
**Appel de méthode à distance**
L'objet sur lequel on appelle la méthode est défini ailleurs. On parle d'objet distant.

Client exécute le code d'une méthode, appel d'une méthode sur B, B objet distant.

*#35*
Aspect dynamique -> différence avec appel procédural.
On peut créer une réalisation d'un service grâce à l'objet qui peut être utilisé pour plusieurs méthodes.

*#36*
Deux instances d'objet Agenda. 
Client fait appel à une méthode ver serveur 1 en donnant en paramètre l'agenda de s2.


*#37*
Passage par copie pour les classes sérialisables, non primitif ni accessible à distance.

*#38*
La sérialisation doit gérer les cycles.

*#39*
Par défaut, rien n'est sérialisable.
Il faut marquer que la classe est sérialisable. 

```java
// Tous les attributs doivent être serialisables
public class otherClass extends Serializable {
}

public class myClass extends Serializable {
	otherClass p1;
	otherClass p2;
}

// Aussi par implantation
public class A implements Serializable {
	// Méthodes de Serialisable
}
```

*#40*
Sérialisation permet d'enregistrer l'état du programme.

*#41*
Mécanisme de gestion de version qui vérifie si les versions de classe sont les mêmes. 

Pour cela, il faut un attribut `serialVersionUID`:
```java
private static final long serialVersionUID = 12345678L;
```
Si la classe n'a pas cet attribut, il sera rajouté à la compilation et il choisira le numéro de version par rapport aux types et attributs.

Quand on désérialise c'est à un autre moment avec potentiellement une autre version de la classe.

*#42*
Proxy qui est un objet local. On appelle la méthode dessus et le proxy peut discuter à distance.
L'objet accessible à distance peut être appelé localement depuis l'autre serveur (servant). 
Le servant peut récupérer le socket utilisé par le premier objet et peut donc faire un appel local.

Deux intermédiaires: le **proxy** et le **servant**.

Service de nommage donne des noms globaux à des objets accessibles à distance.

*#43*
Il faut un objet local pour contacter le servant. 

Proxy a la même interface que l'objet distant (pA que A).
Proxy sur A qui permet d'appeler les méthodes sur A (sA).

Proxy par service de nommage ou parce que il y a eu un appel de paramètre à distance.

*#45*
Mécanisme proxys et appels de méthodes.
On ades paramètres et il faut qu'à la fin on ait des proxy associés pour ces paramètres. 

*#46*
**Différentes configurations de créations de proxy par rapport aux paramètres**

*#47*
Java propose une construction dynamique des proxy.
C'est à l'exécution que les classes des proxy vont être construits.

```java
// Machine A
Interface A extends Serializable {
	void blbl();
}

class X {
	foo(A a)
}

// Machine B
class ImplA {
	int x;
	void blbl();
}

x.foo(new ImplA();
```
Mécanisme d'échange de code.

*#48*
`class ObjetImpl_Stub` -> code du proxy. Créé automatiquement.
Juste à écrire ce qui est en bleu.

*#49*
Les méthodes appelées qui échouent lèvent une exception `RemoteException`.

*#50*
Toute instance d'Agenda est un objet accessible à distance.

*#55*
Service de nommage créé dans serveur qui est accessible via le nom de la machine et le port 1099.

*#56*
Cas où le service de nommage est ailleurs. On s'enregistre dedans en metant l'adresse du service).

*#57*
Le client obtient un proxy qui est une implémentation d'Agenda.
`Objet proxy = (Objet) dns.lookup("name");`


*#58*
Appels de méthodes sur un objet à distance depuis plusieurs endroits.
Là où est l'objet, on a un thread pour chaque appel de méthode. Exécution de méthodes en concurrence. 

*#59*
**Service de nommage `Registry`**

*#60*
Créer ou accéder à un service de nommage.

*#61*
Pas besoin de mettre tous les objets accessibles à distance dans le service de nommage.

*#62*
Service de nommage = objet accessible à distance qui réalise l'interface `Registry`.

*#63*
Appel de méthode côté client

*#64*
Appel de méthode côté serveur (servant)
A partir d'un objet à distance, on a un socket d'écoute.

*#65*
Le client va faire une demande au serveur et le serveur rappelle le client.
Le client doit avoir un objet accessible à distance que le serveur peut appeler.
Quand le client a envoyé sa requête, l'objet sur lequel le rappeler était précisé afin que le serveur sache comment rappeler le client.

*#66*
Le serveur a un proxy qui le permet d'appeler l'objet distant.

*#71*
RMI permet de faire des appels de méthodes à distance avec code dynamiquement généré.

Problème du ramasse miette. Besoin d'éteindre les objets non utilisés.









