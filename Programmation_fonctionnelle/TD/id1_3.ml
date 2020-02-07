(* Exercice 3 *)

(* Spécifications *)
(* Le type abstrait de la file *)
type 'a queue;;

(* Fonction push: ajoute un élément 'a à la file *)
val push: 'a queue -> 'a -> 'a queue;;

(* Fonction pop: retire le dernier élément ajouté à la file *)
val pop: 'a queue -> ('a queue, 'a);;

(* Fonction empty: envoie une file vide *)
val empty: unit -> 'a queue;;

(* Fonction size: renvoie le nombre d'éléments de la file *)
val size: 'a queue -> int;;

(* Implantation *)
type 'a queue = 'a list;;

let push queue el = queue@[el];;

let pop queue =
	match queue with
	| t::q -> (q, t);;
	| _ -> failwith "Préconditions non respectées";;

let empty = [];;

let rec size queue =
	match queue with
	| [] -> 0
	| t::q -> 1 + (size q);;

let size_v2 queue = List.fold_right (fun e qt -> 1 + qt) queue 0;;

