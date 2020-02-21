(* TD3 *)

(* Exercice 1 *)
type 'a arbre = Noeud of bool * 'a branche list
and 'a branche = 'a * 'a arbre;;

(* Exercice 2 *)
(* appartient: 'a list -> 'a arbre -> bool *)
let rec appartient_arbre elt (Noeud(b, abr_list)) =
	match elt with
	| [] -> b
	| t::q -> match (appartient_list t abr_list) with
				| None -> false
				| Some ss_abr -> appartient q ss_abr;;

let rec appartient_list elt liste =
	match liste with
	| [] -> None
	| (t, a)::q -> if t = elt then Some a else if (elt > t) then None else appartient_list elt q;;

(* Exercice 3 *)
(* ajout: 'a list -> 'a arbre -> 'a arbre *)
let rec ajout elt (Noeud(b, abr_list)) =
	match elt with
	| [] -> Noeud (true, abr_list)
	| t::q -> let arbre_res =
				match (appartient_list t abr_list) with
				| None -> Noeud(false, [])
				| Some ss_abr -> ss_abr
			in Noeud(b, maj t (ajout q arbre_res) abr_list);;

(* 'a -> 'b -> ('a * 'b) list *)
let rec maj c b lfils =
	match lfils with
	| [] -> [(c, b)]
	| (k, v)::q -> if k = c then (k, b)::q else if (k > c) then (c, b)::(k, v)::q else (k, v)::(maj c b q);;
