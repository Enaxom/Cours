# Interconnexion des systèmes - Internet

Tuesday, 18. February 2020 07:56AM 

---

*#4*
Internet -> ensemble de tous les réseaux interconnectés.

IP permet d'interconnecter des technologies différentes (par des routeurs).

### I - IP un outil d'interconnexion

*#9*
Besoin d'interconnexion de réseaux différents entre eux pour faire un réseau mondial.

Le problème d'interconnexion vient des technologies différentes qui marchent différemment. 

*#10*
Techno 1 et techno 2 -> on met un équipement d'interconnexion, un **bridge** pour traduire 1 vers 2.

*Pont :* équipement d'interconnexion de niveau 2.

Problème : l'extension. Si on a plus de technos il faut faire 1 vers 2, 2 vers 3, 3 vers 4, etc... 
> Coûteux

Dès qu'on traduit de 1 vers 2, on perd de l'information vu qu'on perd des concepts de ce qu'il y avait dans 1 pour mettre des concepts de 2.

*Quelle méthode pour communiquer entre A et B ?*
L'adresse de B n'est pas du même format que l'adresse de A.
On invente quelque chose qui va chercher avec qui on veut parler (à préconfigurer). Pour chaque machine orange, il faut un ensemble d'adresses fictives donc on doit savoir avec qui A pourrait parler.

T1 - T2 - T1
On utilise l'encapsulation pour communiquer entre les T1.

*#11*
On passe du niveau 2 au niveau 3 sinon ça ne passe pas à l'échelle.
Permet d'englober les problèmes d'hétérogénité.
Moins on demande de choses à la techno du dessous, plus on a de chances de pouvoir l'utiliser.

IP veut que la couche du dessous soit capable d'essayer d'envoyer un message à n'importe quel autre qui utilise la technologie physique. Faut que ce soit bidirectionnel.
Pas de qualité de service ou reprise sur erreur.

Utilisation d'un adressage commun. 

*#13*
Le routage dans IP : 
T1 - *in* R *out* - T2

Le message partant de T1 et allant vers `in` contient un datagramme. Il prend le paquet le décapsule et obtient un paquet qui a l'adresse de destination.
Grâce à sa table, il sait qu'il faut l'envoyer sur le bon lien de `out`.
Il utilise un protocole d'adaptation qui va permettre de trouver quelle est l'adresse de format T2.

> Solution par encapsulation, c'est du tunel.

*#14*
Routeur, par encapsulation.

*#15*
On peut potentiellement faire de l'IP sur tout.

*Problème :* encapsuler c'est coûteux, on perd du débit. Est-ce que ce qu'on rajoute (les 20 octets en plus d'IP) est utile. On perd inutilement dans IP 4 octets dans les 20 octets.

*#19*
IP pas très performant.
IP peut ne pas être au dessus de certaines technos.

*#20*
IP ne sait pas s'encapsuler dans des cellules ATP -> AAL5

*#21*
Ip ne marche pas tout seul pour être une couche de convergence.
Une couche d'adaptation générique ne peut pas exister de base. Il faudrait prévoir toutes les technos et pas possible.

*#23*
**Insuffisant de faire de l'IP**

Si la technologie ne fait pas d'IP :
- Avion
- Bus

Gérer la qualité de service à travers IP.

*#24*
IPv4 et IPv6 incompatibles.
Problème du multicast pour avoir un protocole de routage configuré.
Overlay de multicast au travers du réseau.

Interconnexion entre AS. 

*#25*
Création des technos pour qu'elles soient compatibles avec IP.
Les AS utilisent IP aux extrémités. A l'intérieur de l'AS on sait pas peu importe.

*#26*
IP interconnecte mais pas physiquement et réellement car on a besoin de s'adapter avec des contraintes politiques, la QoS et QoE (qualité d'expérience utilisateur).

---

### II - Outils et solutions IP

Du moment que l'interlocuteur peut utiliser la même techno, on fat un tunnel.
S'il peut pas utiliser la même techno que nous, on fait de la traduction.

*#31*
Tunnels permettent d'interconnecter des sites d'entreprise. Sites qui sont éloignés physiquements mais proches grâce aux liens logiques.

Encapsule pour passer au travers d'un autre réseau, techno, domaine. Peut être la même tecno. 

On abstrait tout ce qu'il y a au milieu du réseau.

*#32*
Réseau d'accès très hétérogène -> permet de cacher ce qu'il y a en dessous

Si on a des machines connectées par des routeurs on peut choisir de dire que les machines sont des routeurs qui sont reliées directement entre elles. Chaque lien entre les machines est un tunnel dans le réseau.
On peut alors mettre en place un protocole IP multicast.

| Pile | | |
| --- | | |
| IP | | |
| BRE | | |
| IP | | IP |
| T | R | T |

*#34*
On filtre la partie donnée qu'on envoie dans un multiplexeur DSLAM.
Ensuite ça va dans un BRAS -> multiplexeur réseau qui permet d'envoyer le traffic au premier routeur.

*#35*
PPP point à point ATM pas point à point.
> PPP over ATM pour configurer VP et VC pour parler au BAS

On utilise la couche d'adaptation AAL5 pour ATM.
Pour BAS, L2TP marche sur UDP qui marche sur IP.

*#36*
PPP suffit pas tout seul pour faire des tunnels.

*#37*
Terminer la connexion PPP plus loin.
Concentrateur d'accès et network server.

*#38*
Tout protocol peut être utilisé pour faire du VPN. 

*#41*
Encapsulations obscurci le réseau.

Vrai problème des tunnels : dur à automatiser. Prévoir en avance ce qu'on veut faire. 

*#42*
Middlebox, peuvent faire parti des tunnels. Solution de sécurité.
On met ça en bordure, en entrée ou sortie du data center, du site, de l'AS.

*#44*
**Neutralité du net** : acheminer tout datagramme (message) sans prendre en compte son origine, sa destination, son contenu et le protocole qu'il utilise.

*#47*
**Conclusion**
Tunnel ou traduction.

*#49*
A quoi ça sert ?
Pourquoi c'est mis en oeuvre ?
Comment ça marche ?
Pile protocolaire, les choses à savoir

Accès entreprise 20 min (10/10)
Tunnels 30/40 min
IPv4/IPv6 30 min



