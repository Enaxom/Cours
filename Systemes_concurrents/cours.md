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

