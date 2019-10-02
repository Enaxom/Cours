======================================================================================
================================ SYSTEMES CONCURRENTS ================================
======================================================================================

**INTRODUCTION**
--------------------------------------------------

Besoin d'outils pour écrire des programmes parallèles

#8
Problème quand les processus parallèles tentent d'accéder à une ressource commune pour se transmettre de l'information -> Compétition

#9
Les processus concurrents ne peuvent pas démarrer n'importe quand.
Besoin de contrôler la progression d'un processus en fonction des autres.

#10
Pour contrôler l'intéraction entre processus, on peut avoir un couplage fort : bloquer un processus en attendant qu'un autre processus le réveille. Attendre et signaler : synchronisation.

Mécanismes plus souples qui peuvent arriver à la même chose :
File d'attente utilisée pour permettre aux processus producteurs de déposer leurs résultats sans attendre que des processus veuillent les utiliser.
-> Producteur peut prendre de l'avance sur le consommateur, couplage faible
	Si le producteur produit trop vite et que le tampon est plein il ne peut plus produir jusqu'à ce que le consommateur récupère les données et est donc bloqué, le couplage faible devient fort.

Dans tous les cas, les processus doivent attendre des résultats produits par d'autres processus.

**Coopération**
	On peut avoir une vision de niveau bas : quand on résonne sur les intéractions, on résonne exclusivement sur les processus. On parle de coopération. 
	But de gérer ça automatiquement, de permettre aux utilisateurs d'avoir des objets partagés qui peuvent être utilisés par des applications.

**Compétition**
	Compétition service de plus haut niveau. Les conflits sont gérés à l'intérieur du service. Possibilité de manipuler en parallèle des fichiers sans qu'il y ai de souci au niveau bas.

Point de vu haut ou bas, problème de conflit d'accès à des objets partagés. Remède de base est de faire attendre un processus jusqu'à ce que d'autres processus fassent évoluer l'état de l'ensemble du système pour lui permettre de reprendre son exécution.

#11
Programmation concurrente intéressante :
	- Facilité de conception
	- Accroître la puissance de calcul
	- Faire des économies
	- Technologie mûre

#12
Problème de processeurs vectoriels : adaptés à faire des opérations vectorielles (simultannées sur des données identiques). 
Gain de parallélisme au niveau matériel **limité**.

#13
Ce qui caractérise les programmes concurrents : **non déterministes**.

##SYNTHESE
Programmation parallèle nécessite des outils et est nécessaire aujourd'hui.

#15
Un processus, quand il s'exécute, peut avoir son exécution résumée par sa trace.
Histoire de processus : suite d'instructions du processus.

#16
Hypothèse sur l'exécution concurrente des processus :
	L'exécution de P et l'exécution de Q sont indépendantes.

#17
Raisonnable

#18
On choisit le modèle d'exécution en entrelacement.
Intéractions entre processus, deux modèles :
	- Modèle mémoire partagée
		Plusieurs processus qui s'exécutent en parallèle et accèdent à des données communes
Pas besoin de savoir qui a écrit la donnée. Accès aux informations directement implicitement.
S'assurer que les processus ne touchent pas à la même donnée -> synchronisation nécessaire à programmer.

#19
Service de communication qui permet d'envoyer des messages d'un processus à l'autre.
Modèle client serveur, architecture répartie.

2 modèles
	Processus qui communiquent par message
	Mémoire partagée, processus n'ont pas besoin de communiquer

#20
Spécifier un programme en exprimant les propriétés souhaitées du système. 
Propriété fonctionnelle = propriété classique (ex: entrée x sortie x!).
	Insuffisantes

Nécessite des propriétés sur l'évolution / l'historique des variables au fil du temps.
	Propriété qui intègre des variables temporelles.
	Propriété sur l'ensemble des **exécutions possibles** (histoires possibles)

#21
**Propriété de sûreté**
	Il n'arrive jamais rien de mal, deux serveurs ne prennent jamais le même travail
**Propriété de vivacité**
	Après un nombre de pas fini, un travail déposé finit par être pris par un serveur

Logique temporelle : logique avec opérateurs qui dépendent ou varient selon le temps
 _
|_| P_ -toujours P -> P est vérifié dans tous les états de toutes les exécutions
/\
\/ P finalement P -> P est vrai dans un état pour toutes les exécutions

Deux catégories de propriétés qui varient avec le temps. Vivacité vraie au bout d'un certain temps.

#25
Modularité : pouvoir raisonner sur un bout de code indépendamment des autres.
Pouvoir contrôler les intéractions entre processus.

#26
Mécanismes qui garantissent l'atomicité
Atomique : bloc d'instruction qui peut être exécuté sans être perturbé par les autres processus.

Vérouiller un processus / Exclusion mutuelle pour l'isolation.
On met en place des protocoles qui peuvent garantir quand il y a conflit que tous les processus en conflit sont bloqués sauf un.

#27
Au moment d'une intéraction, un processus prêt va devoir attendre que les autres participants de l'intéraction soient prêts.

**Flot de contrôle** : **Point de synchronisation commun** : endroit ou les processus attendent les autres.
**Flot de données** : A l'arrivée au point de rendez-vous, le processus attend ou envoie un message. Se fait en s'appuyant sur les service de communication.

#28
Définir les intéractions indépendamment du code des processus.
Intéractions entre processus = opérations sur le tampon.
Grammaire des suites d'opérations (intéractions).

Caractérisation des exécutions concurrentes correctes
	Le nombre de dépots doit être supérieur au nombre de retraits (sur le tampon)

#34
La vitesse dépend de la complexité de l'algorithme qui traite les données.

#40
Concurrence à grain fin
Plusieurs d'étapes pour chaque **instruction**
	Obtenir les données O
	Décodage D
	Exécution X
	Ecriture du résultat W
Plusieurs étapes d'instructions différentes en parallèle.

Bulles entre les instructions pour neutraliser le pipeline.

#42
En programmation parallèle, des résultats peuvent être incorrects car les processus ont travaillé sur des donénes partagées qui se trouvaient dans des caches différents.

Pour être sûrs que les processeurs travaillent sur la même valeur, on envoie un signal pour invalider les caches.

#46
Possible de ne pas utiliser le cache à cause de problèmes de cohérence. 


**PROTOCOLES D'EXCLUSION MUTUELLE**
--------------------------------------------------

#5
On ne peut pas toujours entrelacer par souci d'incohérence.

#6
**Sections critiques** : bloc d'actions qui doivent être exécutés de manière atomique, sans autres processus.
Si un protocole assure l'atomicité, on est sûr que le résultat est S1 puis S2 ou S2 puis S1.

Atteindre l'absence d'interférence
	Implenter un protocole d'**exclusion mutuelle** "ce bloc de code se synchronise avec cet autre bloc de code"
	En controlant les résultats : **contrôle de concurrence**

#7
Exécution concurrente
	La dernière écriture l'emporte (pour -1 ou 1)

Cohérence mémoire
	Charge des valeurs dans son cache. Invalidation de y est arrivé mais pas x -> incohérence.

#8
Exclusion mutuelle : éviter que plusieurs processus exécutent le même code quand c'est une section critique.
Avant d'entrer en section critique, on va avoir un protocole qui permet de s'assurer qu'il n'y a qu'un processus qui rentre -> protocole d'entrée.
Protocole de sortie utilisé par un processus qui termine sa SC pour indiquer aux autres qu'il a terminé. 
Permet de modéliser plusieurs demandes d'un même processus.

Etat des processus
	en attente de la section critique
	en section critique
	hors section critique

∀i, j ∈ 1..N
	en_SCi => ∀j ≠ i ¬en_SCj

□∀i, j ¬(en_SCi ^ en_SCj ^ i ≠ j)
	□ = ça doit être toujours vrai

#9
Propriété de vivacité -> quelque chose de bien finit par se produire.
	Tout processus, quand il est rentré en section critique, finit par en sortir

∀i attend_SCi => ◊ in_SCi
	◊ = eventually
	≡ ∀i attend_SCi eventually leads to in_SCi

#11
Solutions pour garantir l'exclusion mutuelle

2 processus qui accèdent à une section critique, on veut pas qu'ils les exécutent les sc en même temps

P1
	while(in_sc != false) {}
	in_sc = true
	sc
	in_sc = false
P2
	while(in_sc != false) {}
	in_sc = true
	sc
	in_sc = false

#12
Solution du protocole ci-dessus

#13
P1 peut rester bloquer si P0 ne va jamais à sa section critique

#14
Risque d'attente infinie si i et j mettent demande à vrai

#15
Algorithme de Peterson fonctionnel pour l'exclusion mutuelle
Le tour départage deux processus qui seraient bloqués en même temps

sûreté
pi et pj jamais simultanément en sc

pi en SC
tour ≠ j -> Pj à la ligne tour <- i ou après, reste bloqué dans son while
et
!demande[i] -> Impossible pour Pj de passer en section critique

Donc impossible que Pi / Pj soit bloqué à l'entrée de la section critique

Consommation de temps de processeur pour rien, très gourmand en temps processeur

#16
L'ordre des deux premières instructions du protocole d'entrée

#17
Sureté
	Arguments de tickets uniques donc il n'y a pas deux processus qui ont le même indice. File d'attente et ils passent un par un.
Autorise des lectures et écriture non atomiques

#18
Opération qui fait en même temps un test et va écrire cette valeur et renvoie l'ancienne valeur du booléen.

#19
Un seul processus à la fois qui peut faire TestAndSet car atomique
On a la sûreté
Mais il n'est pas vivace
Défaut de cette solution

#20
Tour afficheur
Ticket distributeur de numéro
Vivace

#22
Eviter que le processeur qui attend répète ses tests

#24
Si la section est occupé, il se met dans la file d'attente des demandeurs et se suspend

P1 en SC + demandeurs vide
P1 sort de SC
P1 ? demandeurs -> vide
P2 arrive et démarre le protocole d'entrée occupé = vrai -> ajout + suspension
P1 occupé = faux

Problème
	Variables globales utilisées par des processus différents potentiellement en même temps
	Si P1 et P2 accèdent à demandeurs en même temps ça peut poser problème
	Les codes du haut et du bas sont des sections critiques et on aurait du les protéger
	On a besoin aux << >> de parenthéser par un accès à un protocole d'entrée et de sortie d'exclusion mutuelle

**SÉMAPHORES**
--------------------------------------------------

#5
Définir un objet qui soit minimal et suffisament puissant pour permettre de répondre aux besoins qu'on a en terme de synchronisation
	Isolation : exclusion mutuelle, atomicité
	Possibilité de permettre à un processus d'attendre : synchronisation

#6
Besoin de faire une opération qui permet de se bloquer et d'une opération qui permet de débloquer un processus qui a été bloqué.
-> Opération bloquante & débloquante

On va poser une contrainte simple sur un entier. L'opération bloquante va amener à rendre la contrainte fausse

V fait monter le cran vers la droite
P déplace l'état d'un cran vers la gauche

Synchro dans le fait que l'opération P ne peut se terminer que si l'état d'arrivé est un état positif
Si l'état interne du sémaphore est 0, on attend que V fasse quelque chose avant d'utiliser P 
Ne pas le voir comme un compteur

#7
P prendre
V libérer

#10
Sémaphores binaires autant puissants que sémaphores généraux.


#12
Exclusion mutuelle
On définit un sémaphore associé à l'accès d'une section critique.
Avant d'accéder à la section critique, on prend un jeton. A la sortie, on le pose.

#13
Repérer les éléments qu'on doit bloquer avant d'effectuer une opération

#14
Pour implanter ça, A doit attendre que B soit arrivé d'où les instructions.
On ne peut pas inverser signaler l'arriver et attendre l'arrivée de l'autre car ils se seraient bloqués à attendre l'arrivée de l'autre.


Pareil en N processus

Semaphore[] tab = new Semaphore[N];
for (int i = 0; i < N; i++) {
	tab[0] = new Semaphore(0);
}
....
int i = index; // Besoin de faire une autre classe

for (int j = 0; j < N; j++) {
	if (j != i) {
		tab[i].V();
		tab[j].P;
	}
}

Correction

arrive : tableau[1..N] de Semaphore
// 1 évènement "arrivé" pour chaque processus
pour i := 1 à N faire
	arrive[i] := new Semaphore(0)
fin pour
pour i := 1 à N faire
	arrive[j].V()
	arrive[i].P()
fin pour

#16
Nombre variable de producteurs et de consommateurs
Tampon borné, taille fixée de manière statique au démarrage du système

#17
Producteur / Consommateur
Contrôler les accès au tampon pour faire en sorte qu'on extrait pas dans un tampon vide et on écrit pas dans un tampon prêt

**producteur**

produire(i) {i : Item}
libre.P()
{ il y a des places libres }
mutex.P()
	{ dépôt dans le tampon }
	tampon[prod] := i
	prod := prod + 1 mod N
mutex.V()
{ il y a des places occupées }
occupe.V()


**consommateur**

occupé.P()
{ il y a des places occupées }
mutex.P()
	{ retrait du tampon }
	i := tampon[cons]
	cons := cons + 1 mod N
mutex.V()
{ il y a des places libres }
libre.V()
consommer(i) {i : Item}

#18
Opération qui pioche dans les ressources pour en libérer

#20
Problème lecteur / rédacteur
Pour une ressource on a des utilisateurs et ils sont différents donc on distingue des classes d'utilisateurs et politiques différentes selon la classe.

#22
Besoin d'un état et de processus pour implémenter un sémaphore

#23
L'appel à V consiste à regarder s'il y a des processus bloqués, l'extrait des bloqués et le réveille.
Si pas de bloqués, incrémentation des jetons.
Méthodes qui s'éxécutent en exclusion mutuelle.

#24
Utilisation de sémaphores binaires pour réaliser un sémaphore général.

#25
OS temps réel

Temps réel dur
	On a des tâches qui ont des temps d'exécution, échéances
	S'assurer que l'ordonnancement permette que chaque tâche rencontre ses échéances
	Un processus peu prioritaire qui a obtenu le passé du sémaphore peut bloquer des processus plus prioritaires
Temps réel mou


**INTERBLOCAGE**
--------------------------------------------------

Problèmes qui se posent quand plusieurs processus sont en compétition pour plusieurs ressources et non une seule

#5
Processus vont prendre dans un tas de ressource
Opération demander où un processus peut demander un certain nombre de ressources
Peut libérer tout ou une partie des ressources attribuées

#6
Propriété de sûreté
	Garanti qu'il n'y a pas d'interblocage

Deux types de vivacité
	Vivacité faible
		Si on a un groupe de processus en attente d'une ressource, c'est bien si un des processus est servi
	Vivacité forte
		Processus servi au bout d'un moment (progression individuelle)

**Famine**
	Processus en famine quand sa requête n'est jamais satisfaite
	Famine = ¬ vivacité forte

#8
Non réquisitionnables
	On ne peut pas reprendre une ressource allouée à un processus avant qu'il ne la libère
Non partageables
	Allouer une ressource pour un processus et un seul
Pas de dépendance entre une demande et une autre demande

Problème
	Instant 4 P1 bloqué car demande B et B alloué à P2
	Attent que P2 libère B
	Mais vu que P2 demande A P2 ne libère pas B

#9
Interblocage si ensemble de processus où chaque processus est en attente d'une ressource qui a été allouée à un autre processus de l'ensemble

Famine = ¬ vivacité forte
Interblocage ≡ ¬ vivacité faible
Vivacité forte => vivacité faible
Absence de famine => Absence d'interblocage
Interblocage => Famine

#10
Situation d'interblocage lorsqu'un ensemble de processus est pris dans un cycle

Prévention
	Eviter que des cycles se forment dans le graphe
Guérison
	Tuer le processus pour récupérer les ressources et casser le cycle

#12
P -> A
	P demande A
P <- A
	P possède A

Empêcher qu'il y ait des arcs sortant du processus (demande de ressource)
Quand un processus demande une ressource, il l'obtient tout de suite
Opération qui renvoie faux en cas de bloquage
S'il y a un cycle, tout processus a au moins un arc entrant et un arc sortant

#13
Empêcher qu'un processus ait des arcs entrant et sortant
	Processus soit en attente des ressources soit les a obtenues toutes
	Processus demande l'ensemble de ses ressources et tant qu'on ne peut pas le servir on lui en donne aucune
	Donc jamais arcs sortants et entrant simultanément

Pas de cycle donc pas d'interblocage
	**Allocation globale**

Toute ressource allouée finit toujours par être libérée

## Inconvénients

1. Statique et suppose qu'un processus à l'avance connait l'ensemble des ressources dont il a besoin
	Donc processus demandent plus que ce qu'ils ont réellement besoin -> surréservation
2. Risque de famine

Infinité de processus P1 P2 P3 P4 .. P∞
3 ressources A B C
Scénario avec famine pour P1
P2 <- A  | P2 obtient A
P1 -> A,B,C
P3 <- B
P2 libère A
P4 <- A
P3 libère B
P5 <- B
P4 libère A
P6 <- A

#14
Empêcher la formation de cycle
Empêcher qu'il y ait à la fois des arcs entrant et sortant

Si P1 est bloqué sur la ressource C, il doit libérer A et B et redemander A B C
Garanti qu'il ne peut pas y avoir d'interblocage

N'impose pas de savoir en avance les ressources à utiliser
Risque de famine dès le moment où on est en attente d'une ressource si une ressource est toujours prise

#15
Ordre sur les ressources
Un processus doit demander les ressources en respectant l'ordre établi
Pas de cycle possible
	S'il y a des arcs entrant dans le processus, c'est des arcs qui impliquent de plus petits numéros que les ressources qu'on attent
	Pour cycle il faudrait qu'un processus soit en attente d'une ressource plus petite que celle déjà obtenue -> ne respecte pas l'ordre de prise de ressource

#16 - TD : Philosophes et spaghetti
Situation où il peut y avoir interblocage

Contrainte: pour manger un philosophe doit utiliser
	fourchette de gauche
	fourchette de droite
1 assiette par philosophe
Assurer l'accès exclusif aux fourchettes

Philosophe i, i ∈ [0..N-1]
Semaphore fourchettes[N] = new Semaphore(1)[]
Boolean libre[N]
Semaphore mutex = new Semaphore(1)

while true
	Boolean continue = true
	penser(i)
	while continue
		mutex.P
		fourchettes[i].P
		libre[i] = false
		if (libre[(i+1)%N]]) {
			fourchettes[(i+1)%N].P
			libre[(i+1)%N]] = false
			continue = false
		} else {
			fourchettes[i].V
			libre[i] = true
		}
		mutex.V
	manger(i)
	mutex.P
	fourchettes[i].V
	fourchettes[(i+1)%N].V
	mutex.V

repeter
	penser(i)
	F[i].P()
	F[i-1].P()
	manger(i)
	F[i].V()
	F[i-1].V()
Interblocage si ils prennent une fourchette chacun

1. Assymétrie entre philosophes
2. Prise de fourchettes en bloc
3. Prise de fourchettes non bloquante
4. Limiter le nombre d'accès (table)

table = new Semaphore(N-1)
repeter
	penser(i)
	table.P()
	F[i].P()
	F[i-1].P()
	manger(i)
	F[i].V()
	F[i-1].V()
	table.V()

repeter
	penser(i)
	if i != 0
		F[i].P()
		F[i-1].P()
	else
		F[i-1].P()
		F[i].P()
	manger(i)
	F[i].V()
	F[i-1].V()

table = new Semaphore(N-1)
repeter
	penser(i)
	table.P()
	F[i].P()
	F[i-1].P()
	table.V()
	manger(i)
	F[i].V()
	F[i-1].V()

les2[i] = false
tant qie les2[i] faire
	F[i].P()
	si non F[i-1].tryP()
		F[i].V()
	sinon
		les2[i] = vrai
	fsi
ftq

## Inconvénient
Possibilité de situations où un philosophe mange et N-1 attendent
Classes ordonnées philosophe trop rapide autres arrivent en même temps

Proposer une solution "optimale" dans le sens où un philosophe qui a faim et dont les voisins ne mangent pas peut manger sans attendre

etat.tableau[0..N-1] de (pense, faim, mange) = (pense, ...pense)
semPhi tableau[0..N-1] de new Semaphore(0)

peut_manger(i:0..N-1)
	

repeter
	penser()
	si !peut_manger(i) alors
		// Attendre que le philosophe i puisse manger
		semPhi[i].P()
	fsi
	manger()
	si peut_manger(i+1) alors
		semPhi[i+1].V()
	fsi
	si peut_manger(i-1) alors
		semPhi[i-1].V()
	fsi
sans fin

#18
Regarder si la demande courante introduit un risque d'interblocage
Dans le pire des cas, il faut être capable de servir tous les processus qui ont demandé des ressources

#19
P1 demande 1 ressource en plus
On regarde si ça passe dans le pire scénario avec 6 **4** 2
Après situation ou P1 a terminé et on peut servir le maximum de P0
Une fois que P0 est servi et a rendu ses ressources, il reste assez pour servir le max de P2

Si P2 demande une ressource au début pas possible car max P0 trop grand, max P2 trop grand
Après vu que P2 est incrémenté pas de combinaison possible pour donner le max à tout le monde

Développer un arbre avec tous les scénarios possibles et changer de branche en cas d'échec

#23
Algorithme de détection
	Pas de contrainte à l'exécution et regarder s'il y a interblocage détecter les cycles
	Algo coûteux

Guérison
	Défaire la victime puis mort des processus interbloqués
	Perte du travail du processus
	Pas toujours possible

S'il y a beaucoup d'interblocage
	Perte de beaucoup de processus et de travail

#25
L'interblocage -> situation peu fréquente
	Laissé à l'utilisateur
	Coût de la prise en charge > coût de l'inconvénient

Système ouvert contraints par le temps
	Exigence sur temps de réponse
	Détection guérison pas adapté
	Méthodes pessimistes basées sur la prévention

Techniques qui permettent de gérer des exécutions sans blocage


**MONITEURS**
--------------------------------------------------

#5
Sémaphores permettent de développer tous les schémas de synchronisation qu'on souhaite mais c'est sensible (exemple barbier), on entrelace le code de synchronisation (appels au P et V) mélangé au code de l'application (barbier avant de raser attend qu'un client soit assi).
Si on modifie le code d'un des participants, ça peut avoir un impact (barbier besoin de modifier le code des clients).
On tisse deux aspects, conception qui manque de modularité
Difficile de voir ce qu'il se passe car quand on regarde on est ammenés à dérouler des scénarios
	Voir s'il y a une famine

#7
Moniteur une classe (un objet) avec de la synchronisation
Problème de synchronisation à cause des processus qui travailllent en même temps sur un objet partagé
Moniteur: concentration sur l'objet partagé et on définit quel est le bon protocole d'accès à cet objet partagé
On définit un objet partagé et on choisit le moyen de l'utiliser correctement lorsqu'il est accédé de manière concurrente

Un moniteur: objet/classe

Besoin de faire de la synchronisation à cause d'objets partagés donc on défini un objet partagé.
Dans le code de la classe qui est gérée par le moniteur, on a des opérations de synchronisation qui ressemblent à des sémaphore mais sans mémoire -> condition qui représentent des événements.

#8
Partie synchronisation définie à l'intérieur du moniteur
	Besoin d'objet interne au moniteur permettant de gérer la synchronisation à l'intérieur du moniteur
Objets qui permettent de réaliser la synchronisation au sein des moniteurs
	Variables de type condition (événement != boolean)

Attendre un événement ou signaler un événement
Quand on attend un événement on se bloque jusqu'à ce qu'il y ait un signalement

condition vs sémaphore
	Condition pas d'état et pas de mémoire
	Sémaphore compte le nombre de fois où on appelle V
	condition si on appelle signaler et que la file est vide ça fait rien 

#9
Le moniteur: objet qui va gérer l'intéraction entre client serveur et propose 4 opération déposer/prendre travail lire/rendre résultat.

après passage de signaler/signaleur
1 client
deposer_t

2. signaler
lire_res
-----------
2 ouvriers
prendre_t

5. O2 prend
rendre_res
4. 2 ouvriers
6. req = null

Le client n'a pas déposé de travail
1. Ouvrier 1 attend
3. ouvrier peut poursuivre


#10
déposer_travail(t)
	si req != null alors
		prise.attendre()
	fsi
	//req = null
		On est certains que req = null une fois qu'on a pris le travail
	req <- t

prendre_travail(out t)
	si req = null
		depot.attendre()
	fsi
	//req != null
	t <- req
	req <- null

lire_resultat(out r)

#11
Variante des moniteurs plus faccile à utiliser
Lorsqu'on fait un appel à signaler, on note qu'il va falloir faire appel à un processus.
	Le processus signalé va être sorti de la file d'attente et rangé dans une FA de processus qu'il faut reprendre le plus vite possible

Priorité au signalé ou priorité au signaleur
	Priorité au signaleur meilleur
	Plus efficace en terme de commutation de ressource
	Economie d'une commutation de contexte



#20
Idée qu'on va centrer toute la synchro dan sun objet
On gagne de la modularité
Définir l'ensemble des états autorisés/légaux pour le moniteur
Si en faisant l'action j'obtiens un état valide je passe sinon jattends
L'état légal est qu'il faut pas extraire une requête nulle
Une fois l'action faite, réveil des processus

#21
1. On détermine l'ensemble des actions proposées par le moniteur (moniteur = objet)
2. Pour être bien clair sur quelle est la condition où on attend pour pouvoir passer, il faut écrire en français les prédicats d'acceptation -> les conditions qui permettent de faire l'action sans bloquage
3. Trouver les variables d'état qui permettent de décrire l'état du moniteur
4. Décrire les contraintes, quel est l'ensemble d'états permis (invariant du moniteur)
5. On associe à chaque opération une variable condition

#22
Vérifier que chaque fois qu'on signale une condition ça implique bien un prédicat d'acceptation qui était attendu

#23
Moniteur qui gère un tampon de taille bornée
Voir next slide

#24
Tampon borné de taille N
_A quelle condition peut-on déposer sans devoir attendre ?_
	Si le tampon n'est pas vide
Invariant
	Valeurs possibles pour les variables d'état (entre 0 et N)
Variables conditions

deposer(in v)
	si non (nbOccupées < N)
		depot_possible.attendre()
	fsi
	{nbOccupées < N}
	nbOccupées ++ // + deposer effectivement

#25

Nombre de moniteurs >= 0
Si on l'incrémente on est sur que > 0
Condition attendue PasVide donc on la signale

#26
Pour être sûr qu'une condition attendue est vraie, on met un while au lieu d'un if.

