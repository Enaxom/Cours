(* open Graphics *)
(* open Affichage *)

(** Création de l'écran d'affichage *)
(* let _ = open_graph " 800x600" *)

(** Fermeture de l'écran d'affichage *)
(* close_graph() *)

exception CoeffInfiniException;;

(* Exercice 2 *)
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

(* Exercice 3 *)
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

(* Exercice 4 *)
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


(* Exercice 5 *)
(* Fonction PGCD *)
(* Renvoie le plus grand diviseur commun de deux entiers. *)
(* Type: int -> int -> int *)
(* Param1: l'entier dont on cherche le plus grand diviseur commun avec Param2 *)
(* Param2: l'entier dont on cherche le plus grand diviseur commun avec Param1 *)
(* Précondition: Aucune car on prend la valeur absolue de x et y (x et y doivent être positifs) *)
(* Postcondition: retourne le plus grand diviseur commun des deux paramètres x et y *)
let rec pgcd x y =
	if x = y then x
	else if x > y then pgcd (x-y) y
	else pgcd x (y-x);;

(* Quelles sont les préconditions ? Peut-on lever ces conditions en utilisant une fonction locale (mécanisme dit d’ encapsulation) ? *)
(* La précondition est que x et y doivent être positifs afin que la formule utilisée dans la fonction fonctionne. On peut lever cette condition en utilisant la fonction locale abs. *)
