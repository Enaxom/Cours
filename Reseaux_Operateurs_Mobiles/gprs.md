# GPRS

> GPRS.pdf

*#3*
Opérateurs ont déployé de nombreux équipements pour GSM et GPRS a pour but de s'adapter à l'interface.
Transfert de données sporadiques. Savoir attribuer les ressources aux utilisateurs quand ils en ont besoin.
Opérateurs vont exploiter leur trame GSM avec canaux pour le GSM et canaux GPRS.

Système 5G accès en 1ms.

---

Tuesday, 18. February 2020 10:15AM 

---

*#4*
HLR identique, gestion des SMS identique.

Pour atteindre internet depuis RNIS, fallait passer par le réseau téléphonique commuté. Limité en terme de débit par le RTC (64 Kbit/s).

Ici, on a une infrastructure commune sur le réseau d'accès (station de base et contrôleur de station de base), dès le noeud suivant on sépare les flux de voix et de données, on passe par un réseau d'opérateur mobile.
> Réseau de collecte, en mode **paquet** car on transmet 100% des données.
>>Fonctionne sous le principe de **IP** mais n'est pas internet. IP dans IP ou X25 dans IP, besoin de **tunnels**.

Les SGSN sont aussi nombreux que les MSC téléphoniques. 
En revanche, les opérateurs ont très peu de GGSN (Orange en ont 4 ou 5).

La passerelle du réseau internet est directement sur le GGSN.

*#5*
GGSN fait passerelle et doit s'interfacer avec HLR, problème d'interconnexion.

*#7*
*Pile de protocole du plan de données*

- **Network layer :** peut être IP ou X25. On transporte en un seul bond des paquets entre le terminal et le GGSM. Adresses IPv4 ou IPv6 fournies par le GGSM à l'utilisateur.
Besoin de changement d'adresse en cours de communication si on change de GGSM => on ne changera pas de GGSM en cours de communication donc pas besoin de changer d'adresse.
Changement d'adresse si on se réenregistre dans le réseau.

En cours de communication on peut changer de SGSN donc il faudra changer le tunnel. Sur la partie réseau d'accès, pas d'adresse IP.
Après 3G, on voit le monde IP dans le réseau d'accès. Mais là en 2G IP n'est que sur la partie droite.

- Ni la couche 1 ni la couche 2 ne sont spécifié dans le standart GPRS : couches L2.
ATM AAL5 sur un réseau SDH.
Ethernet avec PPP ou SDH. 
- **GTP :** Établir des tunnels entre le GGSN et le SGSN. Protocole applicatif, au dessus de TCP.

Partie gauche, réseau d'accès.

- **SNDCP :** Algorithme de compression sans perte et avec perte : avec perte pas exactement les même données.
Un algo de compression sur les entêtes, un sur les données. Compression sans perte on gagne plus sur l'entête que sur les données, taux de compression plus élevé.
Compression des informations entre le termina et SGSN.

**Equipement intermédiaire SGSN** -> passerelle. Couche présentation. SNDCP niveau 3/2,5. 

Nature de la topologie du réseau d'accès : arborescente.

**LLC :** contrôle d'erreur. Fiabiliser les échanges entre le terminal mobile et le SGSN. Protocole qui ressemble au protocole HDLC. Sert à rattraper ce qui n'a pas été rattrapé et sert pout les phases de Handover.

**Phase de handover :** lors des transferts inter-cellulaires, on va purger les buffer des équipements du réseau d'accès et on laisse la couche LLC pour faire les retransmissions quand c'est bon.

**Frame Relay :** Q933, connexions permanentes. 

On véhicule un grand flux de données utilisateur sur la station de base et son contrôleur.
=> Mettre en place de la qualité de service différenciée, jouer sur l'ordonnancement des messages envoyés entre eux.

Mais GPRS pas construit comme ça, peu de QoS.

Entre la station de base et le contrôleur de la station de base les communications se font en **mode circuit**.

**Couche RLC :** Fiabiliser le lien radio. 
**Couche MAC :** Medium Access Control, partage des ressources entre les différents utilisateurs. Ici la couche RR disparait et est remplacée par un protocole MAC. 

- **Sens montant de communication :** couche MAC dans le sens descendant, il s'agit simplement d'un problème de type ordonnancement. On choisit l'ordre dans lequel on envoie les trames à l'utilisateur. Rand robin pour ordonnancer les paquets. 
- **Sens descendant :** sens montant de la couche MAC. On répond au problème de l'allocation des ressources avec du MFTDMA. Pour allouer les ressources MFTDMA aux utilisateurs, l'utilisateur dit qu'il veut des ressources, on lui attribue un canal SDCCH pour toute sa communication. Après le reste se fait de façon implicite.
Difficulté: le besoin en ressource va fluctuer au cours du temps. 

On met en place une algorithmique pour partager dynamiquement les ressources entre les utilisateurs. 

Problème méthodes d'accès aléatoires : perte de ressource à cause de collisions potentielles.
Méthode d'accès distribuée (token ring/bus) : pas approprié à la situation.
Problème du polling : Ne s'utilise pas tout seul, les utilisaters doivent rentrer dans le réseau. Besoin d'un bout de méthode d'accès aléatoire.

C'est quand on rentre dans le réseau, à la mise en place de la communication, qu'on dit ce dont on a besoin.
Application d'un algorithme de partage de ressource pour savoir à quel moment les ressources seront partagées entre les utilisateurs.

*#8*
**Plan de contrôle**
Assez proches des piles de protocole de plan de données. 
Diffère sur les couches supérieures.

Fonction qu'on laisse dans le plan de contrôle :
Protocole RR gestion des ressources radios. Délégué à la couche **MAC**.
Protocole MM (Mobility Management) pour gérer la localisation de l'utilisateur. Géré par GMM.
Protocle GMM pour le chiffrement. 
GMM gestion de la mobilité et du handover.

LLC distinguer les flux qui viennent du plan de données et du plan de contrôle : identifiant de point d'accès au service pour les protocoles. 

**Dialogues entre le GGSN et le HLR**
*GGSN* passerelle entre le réseau de collecte de transmission de l'opérateur mobile et internet.
*HLR* situé dans le réseau sémaphore.

GGSN utilise des protocoles IP.
HLR protocoles SS7.

Besoin de mettre en place une passerelle niveau applicatif pour que GGSN et HLR puissent communiquer. Transcription entre monde SS7 et monde IP.

*#10*
Pour GSM, le terminal est : éteint, en communication ou allumé.
Définir un niveau d'activité de l'utilisateur. 
Quand on a besoin de transmettre, on a pas besoin de repasser par les étapes longues d'authentification.

*#14*
4 niveaux de QoS par 4 identifiants de point d'accès au service (0,2,4,6).

*Couche LLC*
*Couche RLC/MAC*
On met des informations sur le support de commnication et la on limite la taille des messages.
Segmentation des messages grâce à la couche RLC.

Regrouper de façon logique plusieurs slots entre eux.
Fréquence temporel dans la couche physique on a 8 slot + plusieurs bandes de fréquences.

GSM, partage des ressources figées, on sait les slots attributés à un canal physique.

Dans GPRS, on va regrouper les slots par groupe de 4 du même canal physique pour constituer une unité élémentaire d'allocation des ressources dans lequel on insère une RLC PDU.

Qualité du support de GPRS (Hertzien) fluctue dans le temps. 
On fait évoluer la partie utile de la trame en fonction de la qualité du support. Si c'est de bonne qualité, on réduit la redondance.

Durée pendant laquelle on peut émettre une RLC PDU : pendant 4 slots consécutifs. Comme le taux de codage dépend, le volume de quantité de données envoyées vari.

Modulation de phase, ce qui porte l'information est la phase utilisée. 

Dans le système edge, on fait évoluer le taux de codage en fonction de la qualité du support mais on fait aussi évoluer le nombre de modulation. Le récepteur saura les décrypter. 

Dans GPRS on a une modulation et plusieurs taux de codages. Dans edge on fait fluctuer le taux et la modulation. Dans GPRS c'est quand on ouvre le flux qu'on choisit le taux de codage et dans le contexte edge ça va etre très régulièrement qu'on revoie la modulation et le codage. 

---

Wednesday, 19. February 2020 04:13PM 

---

*#16*
Protocole LLC pour fiabiliser les échanges entre le terminal mobile et le GSM.

3 formats de communication. 2 sans mise en place de connexion et sans acquittement.

Mode de fonctionnement avec acquittement et fiabilisation de LLC justifié par le transfert de fichier par exemple. Pas logique pour les applis en temps réel car ça donnerait un délai variable à cause de tous ces ack.

Si on utilise TCP, on va utiliser ce type de protocole là car TCP gère les messages manquants par de la congestion. On confondrait erreur de communication et congestion. 
TCP, qui apporte de la fiabilité, aime utiliser quelque chose de fiable.

Sans acquittement avec protection d'en-tête seule : applis en temps réel.

Sans acquittement avec FCS : SMS.

- ACK -> cas de figure où dans l'ensemble de la fenêtre du contrôle de flux qu'on examine on a que l'avant dernière trame de la fenêtre qui manque. Le ACK permet de renvoyer qu'une seule trame.

- SACK -> permet de faire des ack sélectifs. En une seule fois, on peut dire dans l'ensemble de la fenêtre quelles trames ont été reçues correctement et non reçues. En une seule fois on peut demander plusieurs trames consécutives.
	- On a limité dans HDLC le champ de commande donc il avait ses limites.
Faire un bitmap de toutes les trames de la fenêtre avec un 0 si pas reçue et 1 si trame reçue. Ça rentre dans 1 octet. 
	- Dans HDLC, le piggybacking permet de mettre dans une trame un ack pour l'autre sens de communication (que des ack positifs). Amélioration de LLC car on peut acoler n'importe quel type de trame S dans une trame I. (J'envoie ça, je redemande ça).
	
*#19*
Dans le contexte du GSM, grand nombre de types de canaux logiques. Chacun avec un débit constant.
Débit constant convient pour la voix, pas de sens pour GPRS.

Dans GPRS, le débit constant ne convient pour aucune des applications faites par les canaux GPRS. Pas de répartition constante de la présence de canaux logiques sur une couche physique GPRS. 
L'ensemble des flux de données aura un débit variable.
Ils vont se partager un même canal physique GPRS.
Définit sur un interval de temps d'une fréquence porteuse, partagé dynamiquement entre plusieurs utilisateurs entre plusieurs utilisations.
Dans GSM, partagés de façon statique.

Périodicité qui va réapparaître. L'allocation de sressources ne se fait pas à l'échelle d'un slot mais ce sera 4 slots consécutifs.
> 4 slots = 1 bloc.

Les slots qui sont dans un même bloc ne sont pas continus.
Chaque slot est dans une trame différente de la couche physique.
Une matrice qui représente la trame physique GSM/GPRS.
Chaque cellule gère une matrice fréquentielle et temporelle.

Allocation des ressources on alloue un slot d'une trame physique, un de la trame d'après, et pareil pour les 2 autres.

Contrairement à GSM, on ne dit pas l'utilisation des différents blocs. Canaux physiques dans le sens montant et déscendant.

Le contrôleur de la station de base choisit l'utilisation des blocs.

Avec GPRS on peut se reservir de canaux GSM (canaux communs). On peut imaginer que le service de paging soit commun. Canal d'accès aléatoire pareil il peut être commun avec le GSM ou un canal dédié au GPRS.
L'opérateur choisit le nombre de canaux pour GSM et GPRS.

*#20*
1 bloc a une durée constante (car correspond à 4 slots).
Le nombre de données utiles qu'on peut rentrer dans un bloc dépend du niveau de codage. Plus y'a de la redondance moins il y a d'information.

Dans GPRS on choisit le taux de codage à l'échelle d'un flux.
Dans edge, c'est à l'échelle du bloc qu'on choisit l'ordre de modulation et le taux de codage. Peut changer au fur et à mesure de la communication.

Bloc LLC et bloc MAC.
Couche MAC: Contrôle
Couche LLC: Contrôle et données utiles

*#21*
Considérer les flux aussi courts que possibles car la dynamique des échanges se traduit par le fait qu'on a des infos qui circulent de manière irrégulière.
Ce qui déclenche l'ouverture d'un flux RLC -> quand on a une LLC PDU à transmettre.
S'il n'y a pas de flux ouvert on déclenche l'ouverture d'un flux RLC.
Objectif de garder le flux RLC ouvert le moins longtemps possible.

La couche RLC peut être fiable ou non fiable avec ou sans ack.
On regarde s'il y a un flux RLC ouvert qui correspond aux caractéristiques de qualité de service.

Il faut un niveau LLC en mode connecté.
Sur une échelle de temps courtes, on a surtout des flux unidirectionnels donc on va ouvrir des flux unidirectionnels en fonction des besoins de la couche LLC.

On ferme les fluxs RLC quand on a plus rien à transmettre.

Dans le sens descendant qu'un message.
Dans le sens montant l'utilisateur dit qu'il veut mettre en place une communication dans le canal aléatoire.
Station donne le numéro de flux et le numéro du canal GPRS pour communiquer. Donner aussi un bloc dans le sens montant pour qu'il dise ce qu'il veut faire et le volume qu'il veut envoyer.
Ensuite l'utilisateur dit quel volume il veut envoyer. 

En fonction du taux de codage et du volume, la station alloue un nombre de blocs et les numéros de bloc dans le sens montant.

Beaucoup plus lourd sens montant que descendant.

*#21*
**Couche RLC**
Mode connecté, connection sens montant ou descendant. Flux de données dans les deux.
Ack montant dans le sens descendant et vice versa. Pas de piggybaking car unidirectionnels. Blocs dédiés aux acquittements.

Dans le sens montant et descendant, sur un même canal GPRS, on aura pas que des données utiles mais aussi des données de contrôle.

La station de base envoie des blocs de données à l'utilisateur (descendant) et veut savoir ce qu'il a reçu (montant). Le controleur choisit les blocs utilisés pour l'utilisateur et les lui indique pour qu'il dise ce qu'il a reçu ou pas.

Pour que ce soit robuste, on fait l'équivalent d'un mécanisme de polling en disant dans tant de bloc c'est à toi dans le sens montant.

Il y a maximum 6 terminaux qui se partagent un canal physique GPRS.

La station de base envoie des blocs à l'utilisateur, en fonction de ce qui n'a pas été reçu correctement on réattribue dans le sens déscendant un certain nombre de blocs.

Flux RLC ouvert. On veut transmettre une trame LLC. Il n'y a que le contrôleur de station de base qui alloue les blocs.
Comment demander ? Sachant qu'on a pas de ressources ?
On peut piggybaker la demande dans la dernière trame LLC dans le sens montant. (Si le flux est encore ouvert c'est que l'émission de la trame d'avant est pas fini).
Ce qui a été retenu : de temps en temps la station de base a des blocs qu'elle jette aux utilisateurs pour que les utilisateurs fassent la requête si ils ont encore un truc à transmettre et que est fux RLC est ouvert -> un numéro d'USF réservé pour ça. 

*#25*
*Exemple mécanisme RLC*
4 blocs, 2 qui échouent.
Dans Packet Downlink Ack/Nack, l'utilisateur indique qu'il a reçu 2,3 et qu'il n'a pas reçu 1 mais il ne peut rien dire sur le bloc 4 parce qu'il sait pas qu'il était censé le recevoir.

Du coup le contrôleur retransmet 1 et 4.

*#26*
Quand elle en a envie, la station de base va dire ce qu'elle a reçu et n'a pas reçu. Là pas le même problème qu'avant car la station de base sait exactement le nombre de blocs attribués à l'utilisateur.

*#28*
Un utilisateur GPRS aura potentiellement plusieurs canaux de données en parallèle dans le sens montant et descendant. On va avoir plusieurs canaux utilisés par les même utilisateurs. On attribue jusqu'à 8 canaux pour 1 utilisateur.

Edge 2,75G on va changer le nombre de bits utiles qu'on va pouvoir mettre dans un bloc et à l'échelle du bloc.
Si le signal s'est déterrorié on revoie le taux de codage qui a été utilisé, mettre moins de bit utiles par blocs.

Un bloc ne suffit pas pour renvoyer un bloc qui a échoué à la transmission.
Calculer la différence et rattribuer le nombre de ressource nécessaire.
Chaque bloc contient un nombre entier de mini blocs. 

# 3G - UMTS

*Voir cours papier*

*#7*
Les équipements physiques GSM/GPRS pareil mais on sépare le plus qu'on peut la parole des donénes.
La couche physique a été réutilisée.

*#8*
Passage à l'UMTS -> les utilisateurs vont utiliser des flux extremement variés. Au lieu d'avoir un contexte de transmission de données, un uti va en avoir plusieurs en paramètre, chacun avec ses paramètres de qualité de service. Gain qualicatif énorme.

*#9*
4 classes de traffic.
On vise le délai et la gigue.

*#10*
Paramètres de qualité de service dans GPRS : peu nombreux.

*#12*
Station de base = Node B
Contrôleur de la station de base = RNC

*#13*
Toutes les interfaces ont été renomées.

Strate applicative pour la communication web, voix sur ip
-> réseau d'accès, coeur de réseau

Strate personnelle liée à l'abonnement. Echanges entre le terminal et le couer de réseau de l'opérater mobile. Equivalent du protocole AMM.

Strate de service pour les services

Strate d'accès radio pour les ressources radios







	
	
	
	
