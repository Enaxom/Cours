======================================================================================
================================ SYSTEMES CONCURRENTS ================================
======================================================================================

INTRODUCTION
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


PROTOCOLES D'EXCLUSION MUTUELLE
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

SÉMAPHORES
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


