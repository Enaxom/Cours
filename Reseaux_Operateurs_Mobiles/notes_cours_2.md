# Architecture des réseaux mobiles

[Les cours](http://irt.enseeiht.fr/beylot/enseignement/index.html) 

Thursday, 13. February 2020 10:23AM 

---

*PDF: Reseaux_mobiles.pdf*

*#3*
GSM: Global System for Mobile communications (1980)

Premier lien sans fil puis on retombe sur des liens filaires.
Système GPRS ressemble à RNIS.

GPRS: General Packet Radio System (1990)
UMTS: Universal Mobile Telecom System (2000)

Mode circuit ou mode paquet ?
-> **Mode paquet**

Transport de paquet en mode circuit -> sous-utilisation chronique des ressources, solution peu adéquate sur le contexte de réseau d'accès.
Gachi de débit.

C'est mieux de faire du paquet.

*Inconvénient du mode paquet*
Délai constant et faible, quand on fait ça sur le mode paquet on rajoute de la gigue. Complexité protocolaire supplémentaire de faire passer du circuit sur du paquet.

Pas de problème pour le routage.

LTE: Long Term Evolution
Particularité par rapport à UMTS -> on a anticipé la disparition du réseau téléphonique commuté. Le service de voix proposé dans LTE n'est plus de type circuit mais un envoi et une prise en charge de la voix de type voix sur IP.

UMTS on rattrape la gigue sur le réseau d'accès.

*#4*
Permettre à l'utilisateurde se déplacer avec un équipement mobile et à pouvoir communiquer même s'il sort de son réseau d'origine -> nomadisme.

Problème du nomadisme: gestion d'adresses.
Passage à l'échelle et mise en place de protocole pour mettre à jour automatiquement le contenu de la base de données.

*#5*
Réseaux cellulaires

Infrastructure d'équipements déployés par des opérateurs mobiles. Permettent de couvrir une certaine zone géographique.
Signal faiblit avec la distance, au moins le carré de la distance.

Une même ressource fréquentielle pourra être utilisées dans une distance suffisamment éloignée car il ne pourra pas y avoir d'interférence.

Prendre des cellules de plus en plus petites, puissances d'émissions de plus en plus faibles.

Zone de localisation: l'utilisateur peut se faire localiser à la cellule près.
Inconvénient -> engendre un signal important car ça met à jour dès qu'il change de cellule.

Zone de localisation contient un certain nombre de cellules -> moins de mises à jour, seulement quand il change de zone.

Plus la zone est grande, plus le temps pour l'atteindre est important et plus le signal est important.

*#6*
Problème d'accès au support de communication. 

Méthode d'accès aléatoire -> simple mais s'effondre facilement avec la charge. Monde télécom évite ça.

Les communications instaurées en réseau mobile sont des communications terminaux -> réseau ou inverse.

Sens décendant émetteur et destinataire. Problème de type ordonnancement.

Support physique communication -> identifier ressources radio. Découpage du spectre de communication en bande fréquence séparé. MDMA. Multiple access, plusieurs émetteurs.

TDMA -> temporel.

Combinaison entre découpage fréquentiel et temporel.
Marche bien pour les communications à débit constant. Il suffira d'attribuer un interval de temps sur une fréquence donnée pour toute une communication.

-> **Solution retenue par le GSM**
Téléphonie simple à gérer dans un contexte de type circuit.
Dans tous les autres cas de figure, pas efficace car allouer un débit de ressource radio pour une durée longue à l'utilisateur ne marche pas bien car besoin de débit variable. Revient à faire du paquet sur du circuit.

Deux visions d'accès multiple sur le réseau mobile.

Deux parties dans l'allocation des ressources

- Partage au niveau physique
- Partie vers les couches réseaux pour partager ces ressources radio.

CDMA alloue dynamiquement les ressources (pas couche physique)

Support utilisé -> sans fil.
Quantification de chiffrement, on chiffre les informations.

Problème du transfert inter-cellulaire -> Handover

- **Partie protocolaire**: échanges entre le terminal mobile et le réseau pour procéder au handover, standardisé. Le réseau aura la décision, l'initiative du handover.

- **Partie algorithmique**: pas normalisée, quand est-ce qu'on déclenche le handover et dans quelle cellule on envoie l'utilisateur.
	- *Règles*: Si la différence entre le niveau de puissance de la cellule actuelle et d'une autre est significative pendant un certain temps alors on déclence le handover. 

 Si on est couvert par deux cellules et une qui est moins occupée que l'autre, ça déclenche un handover.
 
 **Paging** problème de localisation de l'utilisateur. Besoin quand on veut communiquer avec lui de le prévenir. Diffuser des messages paging. 
 
*Dimensionnement du réseau*
 
- Possibilité que le réseau reffuse l'accès car pas assez de ressource radio -> **blocage**
- On se déplace et pas de ressource radio dans la zone où on est -> **coupure**

Probabilité de refus d'un appel doit être < à 10^-2

Calcul proba de blocage avec la formule d'erland D.

Donner une priorité au transfert intercellulaire par rapport aux nouveaux appels:
Mécanisme à seuil, tant que le nombre d'appel en cours est inférieur à un seuil on accepte sinon non et on fait du transfert intercellulaire.

*#7*
Dans le contexte GSM trois fonctions à mettre en oeuvre:
Fonction de routage pas besoin de mettre en oeuvre.

- **Mobility Management** (Gestion de la mobilité): comment gérer le déplacement de l'utilisateur en sachant qu'on doit pouvoir mettre à jour la localisation.
	- Traité avec une base de données **temporaire** **VLR** qui stock momentanément les informations de l'utilisateur pour réaliser les phases d'authentification, de chiffrement, de droit. Stocké proche. 
	- Base de données **permanente** **HLR** qui stock l'intégralité des informations de l'uti. Stockée proche de l'utilisateur donc peut appartenir à un opérateur différent de celui de l'uti.
- **Call Management**: on s'est resservi des protocoles du RNIS. Q921 protocole dans RNIS et GSM.
	- SMS consiste à envoyer des messages courts. Pris en charge par de la signalisation. Pas beaucoup de données et qualité de service attendue de même nature. D'un point de vue fonctionnel pareil que la signalisation. 
- **Gestion des ressources radios**: pas présent dans RNIS. 

Demande d'appel X25 usager - usager.
Demande d'avoir un canal usager - réseau

*#8*
Interface dans le monde télécom: découpage entre les équipements, permet de délimiter les responsables et a le mérite de tenter de délimiter les devoirs des intervenants les uns par rapport aux autres.

Plein d'interfaces normalisées. 

*#9*
GSM fait pour coexister avec le réseau téléphonique commuté.
On s'interface avec un réseau de coeur.
Réseau mobile réseau d'accès qui comprend le mobile et la station de base. 

Topologie arborescente qui part du MSC.
Accorder l'ensemble des équipements du réseau d'accès au travers de boucles de type SDH.

Les liens logiques du schéma entre les stations de base et le controller peut être un lien virtuel sur un anneau SDH.

*#10*
Plan de données du GSM: coder la voix au format GSM, débit inférieur à 64 Kbit/s. Mettre ça dans des intervalles de temps attribué.

Partie radio: LAPDm (m = mobile, canal D du RNIS)
On se ressert des protocoles RNIS pour fiabiliser les échanges. 

Entre BSC et MSC on utilise la pile de protocoles de SS7. Protocoles du réseau sémaphore.

*#11*
En RNIS surtout signalisation canal D et données canal B. B 64 Kbit/s D 16 Kbit/s.

Dans GSM 12 types de canaux avec chacun leur pile de protocole.
Canaux du GSM ont tous un débit constant mais pas tous le même débit.

Différence entre GSM et RNIS -> dans RNIS à l'échelle de la trame et le nombre de débit alloué dépend du nombre de débit qu'on veut obtenir.
Ici chaque cellule va gérer un certain nombre de fréquences.
Sur chaque fréquence 8 interval de temps par du découpage temporel. 8*n interval de temps. 

Pour différencier les canaux aux débits différents on joue sur la période des intervalles de temps.

Que des canaux à débit constant et marche bien pour la téléphonie.

*Canaux de données en premier (pour la téléphonie):*

- **TCH**: ceux avec le débit le plus élevé. Téléphonie ou éventuellement pour de la transmission de données. Equivalent canaux B. Canaux bidirectionnels.

*Signalisation*

- **DCCH**: équivalent canaux D, bidirectionnels. Avoir des canaux de signalisation dédiés. Un utilisateur aura son canal de signalisation.
	- *Avantage*: pas de collision potentielle.
	- *Inconvénient*: ressources perdues quand on ne les utilise pas.
	- FACCH pour handover
	- canal se configure entre SDCCH et FACCH
	- SACCH canal de contrôle qui peut remonter une infraction de type mesure, canal pour transfert intercellulaire.

*Au dessous pas partagé, là canal partagé*

- **CCCH**: prévenir l'ensemble des utilisateurs dans la zone qu'on cherche à joindre un utilisateur.

Tous les réseaux mobiles ont besoin de méthode d'accès aléatoire sur RACH qui va permettre dans le sens montant à un utilisateur de rentrer dans le réseau.
Protocole mis en place sur RACH sera un slotted Aloha. Interval de temps RACH périodique sur la couche physique.
La station de base utilise le canal AGCH pour répondre. Permet de donner des ressources aux utilisateurs. Canal d'accès aléatoire est utilisé peu souvent pour dire peu de choses.

- **BCH**: Premiers canaux canaux couche physique. BCCH canal de broadcast qui permet aux stations de base d'envoyer des informations à tous les équipements dans la zone de couverture. Informations qui permettent à l'uti de savoir où il est et de connaître la puissance du signal.

---

Monday, 17. February 2020 02:00PM 

---

A chaque canal, il y a une pile de protocole.
Piles de protocoles complètes pour DCCH.

*#12*
1 trame = 8 slots
Chacun des canaux a des slots attribués sur des temps périodiques.

*#13*
Pas de fiabilisation sur la plupart des canaux sauf DCCH, BCH, CCCH.
LAPDm protocole sur DCCH.
Une trame va rentrer dans un slot.
Si la trame ne termine pas le slot, on fait du padding.

Longueurs courtes: 23 octets. Donc mécanisme de fragmentation.
Dans X25 c'est la couche réseau.
Dans IP c'est IP (niveau 3).

LAPDm niveau 2 donc fragmentation au niveau 2.
Dans le champ longueur bit mort pour savoir si c'est le dernier fragment.

Champ commande pareil que HDLC.

Canaux dédiés donc partagés entre un terminal et la station de base donc l'adresse qui apparaît ne sert à rien.
Dans LAPD on a un id de terminal et un id d'accès au service. 

Envoi de message de signalisation et SMS avec les canaux indiqués. 

Pas de concaténation.
Vu que ca a une taille constante et que c'est sur un slot, pas besoin de fanion de début et de fin.

*#15*
Protocole de niveau supérieur RR, MM ou CM.
Même format de message que Q921.

Champs obligatoires de longueur variable pour les numéros de téléphones.

Attribuer à chaque champ un identifiant de champ pour dire à cet endroit il y a tel champ, qui a telle valeur et voilà la valeur.

Messages lourds à traiter.
Champs optionnel: non présentation du numéro par exemple.

Discriminateur de protocole sert à différencier RR MM CM.

Identificateur de transaction pour le double appel par exemple.

*#16*
Couche RR gère les ressources radios, traitée surtout par le contrôleur de base.

*#17*
Entre station de base et contrôleur, on a en parallèle des canaux de trafic et de signalisation.

*#18*
Contrôleur de station de base et station de base à droite.

Messages transparents CM et MM qui transitent entre le contrôleur de la station de base et la station de base.

En sortie la station de base a LAPDm.

La station de base a comme équipement d'interconnexion de niveau 2: un pont.
Pont pas transparent car il faut que la station de base sache sur quel canal SDCCH doit envoyer le message de signalisation -> besoin d'informations sur l'identité du terminal. Obligé d'aller voir dans le contenu du message pour voir le destinataire.

*#20*
Controleur station de base et commutateur de raccordement (droite).
Transfert inter-cellulaires qui imposent de repasser par le commutateur de raccordement.

*#21*
Accès aléatoire sur le canal RACH.

Tout commence par le terminal qui demande des ressources.

La station de base ne prend pas beaucoup de décision, c'est le contrôleur de la station de base qui calcule le canal SDCCH qui va être attribé. Puis la station de base alloue un canal AGCCH à l'utilisateur.

L'utilisateur récupère le canal SDCCH, utilise SABM pour indiquer ce qu'il veut faire.

Tout ça pour demander des ressources.

*#22*
On diffuse en broadcast à la zone de localisation pour trouver le terminal destinataire.

On sait dans quelle zone on est, on envoie un message en broadcast aux stations d ebase en demandant où est l'utilisateur.

L'utilisateur se reconnait grace à l'identifiant terminal. 
Pas de ressource dédiée pour faire une ressource au paging donc on se sert du canal en accès aléatoire et l'utilisateur fait comme dans *#21*. 

Sauf que là le message sur le canal SDCCH est la réponse au paging.

*#23*
**Téléphonique sortant**
L'utilisateur reçoit un canal SCCH. Il dit qu'il veut téléphoner donc on passe à la phase d'authentification.

Requête d'authentification : nombre aléatoire avec clé publique.

Comment MSC/VLR sait que la réponse est la bonne ?
On stock dans la VLR la réponse qu'il faut rendre. L'opérateur fait les calculs de couples correctes nombres aléatoires/réponses.

Ensuite on passe en mode chiffré : on détermine la clef de chiffrement utilisée par la suite avec le nombre aléatoire qu'on a reçu avant.

Triplet:
- nombre aléatoire
- réponse
- clef de chiffrement utilisée par la suite

Après on lance la mise en place de l'appel téléphonique (topologie RNIS).
D'un point de vu fonctionnel le commutateur de raccordement se comporte comme une super passerelle. D'un côté Q931 de l'autre ISUP: niveau applicatif.

Dans RNIS le codage de la voix retenu est le même que dans le réseau téléphonique commuté.
Codage de la voix du GSM doit être transcodé pour le réseau téléphonique commuté.

Double passerelle.
Plan de données transcription de a voix GSM vers RTC.
Dans le plan de contrôle on traduit les messages Q931 en ISUP.

En dessous (RR) on alloue un canal TCH.

*#24*
Problème: on cherche à joindre un téléphone portable.
Le numéro de téléphone arrive sur le commutateur de raccordement (ici dans un commutateur d'abonné).

On se sert de l'adressage géographique et qui permet de commencer par identifier que c'est un numéro de téléphone français (+33).

On route l'appel jusqu'à atteindre la france. On arrive sur un commutateur, on repère que c'est un 6 ou 7 et on sait que c'est un utilisateur mobile.

Pour le trouver, il faut atteindre le HLR de l'opérateur du client. On poursuit le routage pour atteindre la gateway GMSC donc on utilise le numéro pour trouver la plateforme.

La c'est le protocole ISUP de GMSC et là on peut interroger la HLR. Protocole MAP pour envoyer une requête à la base de données.

La BD garde en mémoire la zone de localisation.
La BD renvoie le numéro de téléphone temporaire qui renvoie à la localité du MSC.
Le MSC couvre jusqu'à 10k numérs temporaires. On poursuit la mise en place de l'appel téléphonique comme si c'était un numéro normal.

Limite de nombre de numéros attachés au MSC.
Pas optimal car c'est comme si on faisait deux appels téléphonique: de CA à GMSC et de GMSC au MSC.

Le CA pourrait envoyer la requête directement à l'HLR. Cette solution imposerait que les CA connaissent tous les HLR de tous les opérateurs.

Paging pour savoir dans quelle cellule il est puis mise en place de l'appel téléphonique.

Il va falloir stocker dans l'ancien HLR l'adresse de l'HLR de notre nouvel opérateur. Si on change une deuxième fois d'opérateur on met à jour dans l'HLR de l'opérateur d'origine l'adresse du nouveau.

*#25*
Handover à l'initiative du réseau.
Dans les sytèmes GSM, le choix retenu est le Handover dans lequel on coupe l'utilisateur dans l'ancienne cellule pour le mettre à une autre.

Canal SACCH couplé au SDCCH pour remonter des informations de type mesure, niveau de puissance des cellules voisines.

Informations de type mesure envoyées dans des trames UI.
Handover: on enlève les ressources de l'ancienne ressource pour les attribuer dans la nouvelle.

Nouveaux canaux et station de base mais on ne connait pas la distance.
On utilise pas le slot de temps entier (au milieu à peu pres) et la station de base déduit le temps de propagation puis la distance.

Si on change de contrôleur de station de base on doit remonter l'information au niveau du MSC qui doit redécendre l'information jusqu'au nouveau contrôleur.

**Changement de commutateur de raccordement**
Problème quand on change de MSC : impact sur le numéro de téléphone et le réseau de transport.

*#26*
**Mise à jour de la localisation**
L'utilisateur capte en permanence depuis les canaux SCCH dans quelle zone il se trouve.
Si le téléphone se rend compte qu'il n'est plus dans la bonne zone, il envoie une mise à jour.

L'information circule en clair donc on a un identifiant temporaire de terminal attribué dans l'ancienne zone de localisation.

La VLR va demander à l'ancienne VLR des informations.
Message sémaphore avec adresse source du MAP l'adresse de la VLR2 et destination VLR1.
On trouve VLR1 avec l'identifiant donné par l'utilisateur.
VLR1 renvoie l'ensemble des triplets de sécurité non utilisés.

Nouvelle VLR va procéder à l'authentification. Si ça réussi on prévient la HLR qu'on est dans une nouvelle zone de localisation.

Si y'a plus de triplet disponible, on demande à l'HLR d'avoir des triplets supplémentaires.

Mise à jour de la localisation demandée de nouvelle VLR à HLR mais annulation de l'ancienne localisation envoyé par HLR. Comme ça c'est l'opérateur qui prend la décision.

*#27*
**SMS**

Centre de stockage des messages courts hors du réseau sémaphore (SC).
Entre centre de stockage et passerelle non standardisé.
Au milieu pile de protocole du réseau sémaphore.
Gauche pile réseau d'accès. Fiabilisation LAPDm, CM.
Fiabilisation TCAP, MTP2.

Niveau applicatif SM-AL.

*#29*
Quand on envoie un SMS, plus besoin d'interroger pour savoir le numéro temporaire.
Juste besoin d'avoir l'adresse sémaphore du MSC qui nous gère.












