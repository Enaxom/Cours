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
