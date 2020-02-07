(* open Graphics *)
(* open Affichage *)

(** Création de l'écran d'affichage *)
(* let _ = open_graph " 800x600" *)

(** Fermeture de l'écran d'affichage *)
(* close_graph() *)

(* TP1 Programmation Fonctionnelle *)
(* Morgane CADEAU *)

exception CoeffInfiniException;;

(* ---------------------Exercice 2--------------------- *)
(* Fonction coefficient *)
(* Fonction qui prend en paramètres deux points 2D flottants et retourne le coefficient directeur de la droite passant par ces deux points. *)
(* Type: float * float -> float * float -> float *)
(* P1: float * float - premier point 2D (a, b) *)
(* P2: float * float - deuxième point 2D (x, y) *)
(* Précondition: P1 couple float, P2 couple float *)
(* Postcondition: retourne le coefficient directeur de la droite passant par P1 et P2 - float (y-b)/(x-a) *)
(* Lève l'exception CoeffInfiniException en cas de coefficient infini *)
let coefficient (a,b) (x,y) =
	if x -. a = 0. then raise CoeffInfiniException
	else (y -. b)/.(x -. a);;

let%test _ = coefficient (0.,1.) (1.,0.) = -1.;;
let%test _ = coefficient (1.,2.) (3.,1.) = -0.5;;
let%test _ = coefficient (5.,-2.) (-3.,-6.) = 0.5;;
let%test _ = coefficient (0.,0.) (1.,1.) = 1.;;
let%test _ = coefficient (13.,1.) (7.,1.) = 0.;;
let%test _ =
try
	let _ = coefficient (0.,1.) (0.,7.)
	in false
with
	CoeffInfiniException -> true;;

(* ---------------------Exercice 3--------------------- *)
(* int * int -> bool *)
let isFirstGreater (x, y) =
	x - y > 0;;

(* int -> bool *)
let isEven x =
	x mod 2 = 0;;

(* 'a -> 'a *)
let seeMe x =
	x;;

(* 'a * 'a -> bool *)
let isEqual (x, y) =
	x = y;;

(* 'a * 'b -> 'a *)
let getFirst (x, y) =
	x;;


exception OutOfBoundException;;

(* ---------------------Exercice 4--------------------- *)
(* Fonction getAtIndex *)
(* Retourne le ième élément d'un triplet donné en paramètre. *)
(* Type: 'a * 'a * 'a -> int -> 'a *)
(* Param 1: triplet 'a * 'a * 'a *)
(* Param 2: indice int, l'indice du triplet pour lequel on cherche la valeur. *)
(* Précondition: les éléments du triplet sont du même type *)
(* Postcondition: retourne le ième élément d'un triplet *)
(* Lève OutOfBoundException si i < 1 ou i > 3 *)
let getAtIndex (x,y,z) i =
	match i with
	| 1 -> x
	| 2 -> y
	| 3 -> z
	| _ -> raise OutOfBoundException;;

let%test _ = getAtIndex ("Bonjour","Hello","Hola") 2 = "Hello";;
let%test _ = getAtIndex (1.5, 2., 4.1) 3 = 4.1;;
let%test _ = getAtIndex (4, 5, 1) 1 = 4;;

let%test _ = 
try
	let _ = getAtIndex (1,2,3) 0
	in false
with
	OutOfBoundException -> true;;

let%test _ = 
	try
		let _ = getAtIndex (1,2,3) 4
		in false
	with
		OutOfBoundException -> true;;


(* ---------------------Exercice 5--------------------- *)
(* Fonction PGCD *)
(* Renvoie le plus grand diviseur commun de deux entiers. *)
(* Type: int -> int -> int *)
(* Param1: l'entier dont on cherche le plus grand diviseur commun avec Param2 *)
(* Param2: l'entier dont on cherche le plus grand diviseur commun avec Param1 *)
(* Précondition: x>=0 et y >= 0 *)
(* Postcondition: retourne le plus grand diviseur commun des deux paramètres x et y *)
let rec pgcd x y =
	if x = y then x
	else if x > y then pgcd (x-y) y
	else pgcd x (y-x);;

let%test _ = pgcd 45 34 = 1;;
let%test _ = pgcd 4 80 = 4;;
let%test _ = pgcd 0 0 = 0;;

(* Quelles sont les préconditions ? Peut-on lever ces conditions en utilisant une fonction locale (mécanisme dit d’ encapsulation) ? *)
(* La précondition est que x et y doivent être positifs afin que la formule utilisée dans la fonction fonctionne. On peut lever cette condition en utilisant la fonction locale abs. *)

(* Fonction abs *)
(* Renvoie la valeur absolue d'un entier *)
(* Type: int -> int *)
(* Param x: entier dont on cherche la valeur absolue *)
(* Précondition: - *)
(* Postcondition: retourne la valeur absolue de x *)
let abs x =
	if x < 0 then -x else x;;

let%test _ = abs (-12) = 12;;
let%test _ = abs 3 = 3;;
let%test _ = abs (-2) = 2;;
let%test _ = abs 0 = 0;;

(* Exercice 5 - encapsulation *)
(* Fonction PGCD *)
(* Renvoie le plus grand diviseur commun de deux entiers. *)
(* Type: int -> int -> int *)
(* Param1: l'entier dont on cherche le plus grand diviseur commun avec Param2 *)
(* Param2: l'entier dont on cherche le plus grand diviseur commun avec Param1 *)
(* Précondition: Aucune car on prend la valeur absolue de x et y *)
(* Postcondition: retourne le plus grand diviseur commun des deux paramètres x et y *)
let rec pgcd_v2 x y  =
	let x = abs x and y = abs y in
		if x = y then x
		else if x > y then pgcd (x-y) y
		else pgcd x (y-x);;

let%test _ = pgcd_v2 (-4) 80 = 4;;
let%test _ = pgcd_v2 (-47) 80 = 1;;
let%test _ = pgcd_v2 45 (-12) = 3;;
let%test _ = pgcd_v2 45 34 = 1;;

(* ---------------------Exercice 6--------------------- *)
(*1 - Fonction padovan *)
(* Fournit la valeur du nième terme de la suite de padovan *)
(* Type: int -> int *)
(* Param1: l'entier n correspondant au nième terme de la suite de padovan dont on veut la valeur *)
(* Précondition: n >= 0 *)
(* Postcondition: retourne la valeur du nième terme de la sute de padovan *)
let rec padovan n =
	if n < 2 then 0
	else if n = 2 then 1
	else padovan (n-2) + padovan (n-3);;

(* Un jeu de test pertinent *)
let%test _ = padovan 0 = 0;;
let%test _ = padovan 1 = 0;;
let%test _ = padovan 2 = 1;;
let%test _ = padovan 3 = 0;;
let%test _ = padovan 4 = 1;;
let%test _ = padovan 5 = 1;;
let%test _ = padovan 6 = 1;;
let%test _ = padovan 7 = 2;;
let%test _ = padovan 8 = 2;;
let%test _ = padovan 9 = 3;;
let%test _ = padovan 10 = 4;;
let%test _ = padovan 11 = 5;;
let%test _ = padovan 12 = 7;;
let%test _ = padovan 13 = 9;;
let%test _ = padovan 14 = 12;;
let%test _ = padovan 15 = 16;;

(* 2 -Arbre d'appel de la fonction pour n = 6 *)
(* 
padovan 6
	padovan 4
		padovan 2
			1
		padovan 1
			0
	padovan 3
		padovan 1
			0
		padovan 0
			0
=> 1 + 0 + 0 + 0

La fonction padovan_cpt ci-dessous permet de voir l'évolution des appels de la fonction.
L'ordre de complexité de cette fonction est exponentiel. C'est davantage de O(n^3), wikipédia parle de complexité exponentielle notée 2^poly(n) mais je ne connais pas cette notation.
 *)

(* Fonction padovan_cpt *)
(* Renvoie le nombre d'appels à la fonction padovan par rapport à l'entier n correspondant au nième terme de la suite de padovan *)
(* Type: int * int -> int *)
(* Param1: l'entier n correspondant au nième terme de la suite de padovan *)
(* Param2: la valeur utilisée pour le compteur qui doit être initiallement à 0 *)
(* Précondition: x = 0 et n >= 0 *)
(* Postcondition: retourne le nombre d'appels à la fonction padovan *)
let rec padovan_cpt n x =
	if n < 3 then x+1
	else padovan_cpt (n-2) x + padovan_cpt (n-3) x + 1;;

let%test _ = padovan_cpt 6 0 = 7;;
let%test _ = padovan_cpt 7 0 = 9;;
let%test _ = padovan_cpt 10 0 = 23;;
let%test _ = padovan_cpt 20 0 = 399;;


(* 3 - Fonction padovan2 *)

(* Fonction padovan_val *)
(* Calcule tous les termes de la suite de padovan jusqu'à arriver au nième terme. *)
(* Type: int * int * int * int * int -> int *)
(* Param i: L'indice correspondant à là où on en est pour le calcul des valeurs *)
(* Param n: int - L'indice où on doit s'arrêter *)
(* Param x: int - Correspond à la valeur de la suite de padovan pour n = i-2 *)
(* Param y: int - Correspond à la valeur de la suite de padovan pour n = i-1 *)
(* Param z: int - Correspond à la valeur de la suite de padovan pour n = i *)
(* Précondition: i, n, x, y, z >= 0 *)
(* Postcondition: renvoie la nième valeur de la suite de padovan *)
let rec padovan_val i n x y z =
	let next_z = x + y in
	if (i+1) = n then next_z
	else padovan_val (i+1) n y z next_z;;

(* Fonction padovan2 *)
(* Mêmes spécifications que pour padovan mais plus rapide *)
let padovan2 n =
	if n < 2 then 0
	else if n = 2 then 1
	else padovan_val 2 n 0 0 1;;

(* Un jeu de test pertinent *)
let%test _ = padovan2 0 = 0;;
let%test _ = padovan2 1 = 0;;
let%test _ = padovan2 2 = 1;;
let%test _ = padovan2 3 = 0;;
let%test _ = padovan2 4 = 1;;
let%test _ = padovan2 5 = 1;;
let%test _ = padovan2 6 = 1;;
let%test _ = padovan2 7 = 2;;
let%test _ = padovan2 8 = 2;;
let%test _ = padovan2 9 = 3;;
let%test _ = padovan2 10 = 4;;
let%test _ = padovan2 11 = 5;;
let%test _ = padovan2 12 = 7;;
let%test _ = padovan2 13 = 9;;
let%test _ = padovan2 14 = 12;;
let%test _ = padovan2 15 = 16;;

(*
La complexité de cette nouvelle version de padovan est de O(n) car on appelle padovan_val n fois.
*)

(* ---------------------Exercice 7--------------------- *)

(* Fonction premier_val *)
(* Test la divisibilité de x par n jusqu'à ce que n=2 et indique si x est premier *)
(* Type: int * int -> bool *)
(* Param x: l'entier qu'on teste pour savoir s'il est premier *)
(* Param y: l'entier qui va diviser x *)
(* Précondition: x, n > 0 *)
(* Postcondition: retourne true si x est premier, false sinon *)
let rec premier_val x n =
	if n = 1 then true
	else if x mod n = 0 then false
	else premier_val x (n-1);;

(* Fonction premier *)
(* Indique si un nombre est premier ou nom *)
(* Type: int -> bool *)
(* Param x: L'entier x à tester pour savoir s'il est premier *)
(* Précondition: x >= 0 *)
(* Postcondition: Retourne true si x est premier, faux sinon *)
let premier x =
	if x < 2 then false
	else premier_val x (x/2);;

let premier_v2 x = not x < 2 && premier_val x (x/2);;

let%test _ = premier 0 = false;;
let%test _ = premier 1 = false;;
let%test _ = premier 2 = true;;
let%test _ = premier 3 = true;;
let%test _ = premier 4 = false;;
let%test _ = premier 5 = true;;
let%test _ = premier 6 = false;;
let%test _ = premier 7 = true;;
let%test _ = premier 8 = false;;
let%test _ = premier 9 = false;;
let%test _ = premier 10 = false;;
let%test _ = premier 11 = true;;
