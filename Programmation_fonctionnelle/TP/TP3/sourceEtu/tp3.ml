(* Exercice 1 *)
(* gray_code: int -> int list list *)
let rec gray_code n =
	if n = 0 then [[]]
	else 
		let liste = gray_code (n-1) in
		(List.map (fun l -> 0::l) liste) @ (List.map (fun l -> 1::l) (List.rev liste));;

let%test _ = gray_code 0 = [[]];;
let%test _ = gray_code 1 = [[0]; [1]];;
let%test _ = gray_code 2 = [[0;0]; [0;1]; [1;1]; [1;0]];;
let%test _ = gray_code 3 = [[0;0;0]; [0;0;1]; [0;1;1]; [0;1;0]; [1;1;0]; [1;1;1]; [1;0;1]; [1;0;0]];;

(* Exercice 2 *)
(* combinaisons: 'a list -> int -> 'a list list *)
let rec combinaisons l n =
	match l, n with
	| _, 0 -> [[]]
	| [], _ -> []
	| t::q, _ -> (List.map (fun l -> t::l) (combinaisons q (n-1))) @ (combinaisons q n);;

let%test _ = combinaisons [] 0 = [[]];;
let%test _ = combinaisons [1;2] 1 = [[1]; [2]];;
let%test _ = combinaisons [1;2] 2 = [[1;2]];;
let%test _ = combinaisons [1;2;3] 2 = [[1;2]; [1;3]; [2;3]];;
let%test _ = combinaisons [1;2;3;4] 3 = [[1;2;3]; [1;2;4]; [1;3;4]; [2;3;4]];;
let%test _ = combinaisons [1;2;3;4] 2 = [[1;2]; [1;3]; [1;4]; [2;3]; [2;4]; [3;4]];;

(* Exercice 3 *)
(* insertions: 'a -> 'a list -> 'a list list *)
let rec insertions e l =
	match l with
	| [] -> [[e]]
	| t::q -> (e::l)::(List.map (fun liste -> t::liste) (insertions e q));;

let%test _ = insertions 0 [1; 2] = [[0;1;2]; [1;0;2]; [1;2;0]];;
let%test _ = insertions 1 [2; 3] = [[1;2;3]; [2;1;3]; [2;3;1]];;

(* Exercice 4 *)
(* permutation: 'a list -> 'a list list*)
let permutation l = List.fold_right (fun t qt -> List.flatten (List.map (insertions t) qt)) l [[]];;

let%test _ = permutation [1;2] = [[1; 2]; [2; 1]];;
let%test _ = permutation [1;2;3] = [[1; 2; 3]; [2; 1; 3]; [2; 3; 1]; [1; 3; 2]; [3; 1; 2]; [3; 2; 1]]
let%test _ = permutation [3;2;1] = [[3; 2; 1]; [2; 3; 1]; [2; 1; 3]; [3; 1; 2]; [1; 3; 2]; [1; 2; 3]];;

(* Exercice 5 *)
(* partitions: int -> int list list *)
let partitions n =
	let rec aux n i =
		if n = 0 then []
		else List.map (fun l -> i::l) (aux (n-1) (i+1))@[n]
	in aux n 1;;

let%test _ = partitions 0 = [];;
let%test _ = partitions 1 = [[1]];;
let%test _ = partitions 2 = [[1;1]; [2]];;
let%test _ = partitions 3 = [[1;1;1]; [1;2]; [3]];;
let%test _ = partitions 4 = [[1;1;1;1]; [1;1;2]; [1;3]; [2;2]; [4]];;
let%test _ = partitions 5 = [[1;1;1;1;1]; [1;1;1;2]; [1;1;3]; [1;2;2]; [1;4]; [2;3]; [5]];;
let%test _ = partitions 6 = [[1;1;1;1;1;1]; [1;1;1;1;2]; [1;1;1;3]; [1;1;2;2]; [1;1;4]; [1;2;3]; [1;5]; [2;2;2]; [2;4]; [3;3]; [6]];;

