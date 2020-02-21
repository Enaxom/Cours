P({}) = { {} }
P({1}) = { 1, {} }
P({1,2}) = { {}, {1}, {2}, {1,2} }
P({1,2,3}) = { {}, {1}, {2}, {3}, {1,2} ... }
-> 2^n

(* Exercice 1 *)
P(0) = 1
P(n) = 2 * P(n-1) = 2^n

(* Exercice 2 *)

(* ajout *)
(* 'a -> 'a list list -> 'a list list *)
let rec ajout e ll =
	match ll with
	| [] -> []
	| l::lq -> l::(e::l)::(ajout e lq);;

let ajout e ll = List.fold_right (fun l qt -> l::(e::l)::qt) ll [];;
let ajout e ll = ll@(map (fun l -> e::l) ll);;

(* parties *)
(* 'a list -> 'a list list *)
let rec parties l =
	match l with
	| [] -> []
	| t::q -> ajout t (parties q);;

let parties l = List.fold_right ajout l [[]];;

(* Exercice 3 *)
P(0) = 1
P(n) = n! = (n-1)! * n
permutation [] = [[]];;
permutation [1] = [[1]];;
permutation [2;1] = [[2;1];[1;2]];;
permutation [3;2;1] = [[3;2;1];[2;3;1];[2;1;3];[3;1;2];[1;3;2];[1;2;3]];;

(* Exercice 4 *)
(* 'a -> 'a list -> 'a list list *)
let rec insertions e l =
	match l with
	| [] -> [[e]]
	| t::q -> (e::l)::(List.map (fun liste -> t::liste) (insertions e q));;

(* 'a list -> 'a list list *)
let rec permutation l =
	match l with
	| [] -> [[]]
	| t::q -> List.flatten (List.map (fun liste -> insertions t liste) (permutation q));;

let rec permutation l =
	match l with
	| [] -> [[]]
	| t::q -> List.flatten (List.map (insertions t) (permutation q));;

let permutation l = List.fold_right (fun t qt -> List.flatten (List.map (insertions t) qt)) l [[]];;

(* Exercice 5 *)
P(n, k) = k parmis n

let rec combinaisons l = List.map permutation (parties l);;
