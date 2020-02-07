(* TD1: Listes *)
(* 06/02/2020 - Programmation fonctionnelle *)

(* Exercice 1 *)

(* 1. Fonction second: 'a list -> 'a *)
(* Précondition: length(list) >= 2 *)
(* Postcondition: renvoie le deuxième élément de la liste *)
let second list =
	match list with
	| _::second::_ -> second
	| _ -> failwith "Non respect des préconditions";;

let bad_snd (_::x::_) = x;;

(* 2. n_a_zero: int -> int list *)
(* Précondition: n entier naturel (>=0) *)
let rec n_a_zero n =
	match n with
	| 0 -> [0]
	| _ -> n::n_a_zero (n-1);;

let rec n_a_zero_2 n =
	if n = 0 then [0]
	else  n::(n_a_zero (n-1));;

(* zero_a_n: int -> int list *)
(* Précondition: n entier naturel (>= 0) *)
let zero_a_n n =
	let rec accu n l =
		match n with
		| 0 -> 0::l
		| _ -> accu (n-1) (n::l)
	in accu n [];;

(* 3 - Liste des indices/positions d'un élément e dans une liste l*)
(* indices: 'a -> 'a list -> int list *)
(* Précondition: - *)
let indices e l =
	let rec accu e liste i liste_f =
		match liste with
		| [] -> liste_f
		| t::q -> if t = e then accu e q (i+1) (i::liste_f) else accu e q (i+1) liste_f
	in accu e l 0 [];;

let indices_2 e l =
	let rec accu e liste i =
		match liste with
		| [] -> []
		| t::q -> if t = e then i::(accu e q (i+1)) else accu e q (i+1)
	in accu e l 0;;

let rec indices_3 e l =
	match l with
	| [] -> []
	| t::q -> if t = e then 0::(map (fun e -> e+1) indices_3 e q)
			else map (fun e -> e+1) indices_3 e q;;

let rec indices_4 e l =
	match l with
	| [] -> []
	| t::q -> let indices_decales = map (fun x -> x + 1) (indice e q) in
			if t = e then 0::indices_decales
			else indices_decales;;

let indices_v3 e l = List.fold_right (fun p_e qt -> if p_e = e then 0::(List.map (fun x -> x+1) qt) else List.map (fun x -> x+1) qt) l [];;

(*Exercice 2*)

(*1. map *)
(* map: ('a -> 'a) -> 'a list -> 'a list *)
(* Précondition: - *)
let rec map_ f list =
	match list with
	| [] -> list
	| h::t -> (f h)::(map_ f t);;

let map f l = List.fold_right (fun e q -> (f e)::q) l [];;

(* 2 - flatten: 'a list list -> 'a list *)
(* Pré: - *)
let rec flatten_ liste =
	match liste with
	| [] -> []
	| t::q -> t@(flatten_ q);;

let flatten_v1 liste = List.fold_right (fun e qt -> e@qt) liste [];;
let flatten liste = List.fold_right (@) liste [];;

(* 3 - fsts: ('a * 'b) list -> 'a list *)
(* Pré: - *)
let rec fsts_ liste =
	match liste with
	| [] -> []
	| t::q -> (fst t)::(fsts q);;

let fsts liste = List.fold_right (fun e qt -> (fst e)::qt) liste [];;
let fsts_v2 = List.map fst;;

(* 4 - split: ('a * 'b) list -> 'a list * 'b list *)
(* Pré: - *)
let split_ liste =
	let rec accu liste couple =
		match liste with
		| [] -> couple
		| t::q -> accu q ((fst couple)@[fst t], (snd couple)@[snd t])
in accu liste ([], []);;

let split liste = List.fold_left (fun accu t -> ((fst accu)@[fst t], (snd accu)@[snd t])) ([], []) liste;;
let split_v2 l = List.fold_right (fun (a,b) (l1,l2) -> (a::l1, b::l2)) l ([], []);;

(* 5 - Supprime les doublons d'une liste *)
(* del_doublon: 'a list -> 'a list *)
(* Pré: - *)
let del_doublon_ liste =
	let rec accu liste set =
		match liste with
		| [] -> set
		| t::q -> let new_set =
			if List.mem t set then set else set@[t]
		in accu q new_set
	in accu liste [];;

let del_doublon liste = List.fold_left (fun accu t -> if List.mem t accu then accu else accu@[t]) [] liste;;

let del_doublon l = List.fold_right (fun el tq -> if List.mem el l then tq else el::tq) l [];;
