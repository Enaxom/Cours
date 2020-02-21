open Assoc

type 'a arbre = Noeud of bool * ( ('a branche) list)
and 'a branche = 'a * 'a arbre

(* Pour les tests *)
let bb = ('b',Noeud(false,[('a',Noeud(false,[('s',Noeud(true,[]));('t',Noeud(true,[]))]))]))
let bd = ('d',Noeud(false,[('e',Noeud(true,[]))]))
let bl = ('l',Noeud(false,[('a',Noeud(true,[('i',Noeud(true,[('d',Noeud(true,[]));('t',Noeud(true,[]))]));('r',Noeud(false,[('d',Noeud(true,[]))]))]));
						   ('e',Noeud(true,[('s',Noeud(true,[]))]));
						   ('o',Noeud(false,[('n',Noeud(false,[('g',Noeud(true,[]))]))]))]))
let b1 = [bb;bd;bl]
let arbre_sujet = Noeud(false,b1)

(******************************************************************************)
(*   fonction d'appartenance d'une liste d'éléments à un arbre                *)
(*   signature  : appartient : 'a list -> 'a arbre -> bool                    *)
(*   paramètres : - une liste d'éléments (caractères dans le cas d'un dico)   *)
(*                - un arbre n-aire                                           *)
(*   résultat   : le résultat booléen du test                                 *)
(******************************************************************************)
let rec appartient_arbre lc (Noeud (b,lb)) =
  match lc with
	  (* on a épuisé la liste : le résultat est le booléen du noeud sur
		lequel on est arrivé *)
	  [] -> b
	  (* sinon on cherche la branche correspondant au premier
		caractère de la liste :
		  - elle n'existe pas : le mot n'appartient pas au trie
		  - on la trouve, on relance aux avec le reste de la liste
			et l'arbre de cette branche *)
	| c::qlc -> match (recherche c lb) with
				  | None -> false
				  | Some a -> appartient_arbre qlc a


let%test _ = appartient_arbre ['b';'a';'s']  arbre_sujet
let%test _ = appartient_arbre ['b';'a';'t']  arbre_sujet
let%test _ = appartient_arbre ['d';'e']  arbre_sujet
let%test _ = appartient_arbre ['l';'a']  arbre_sujet
let%test _ = appartient_arbre ['l';'a';'i']  arbre_sujet
let%test _ = appartient_arbre ['l';'a';'i';'d']  arbre_sujet
let%test _ = appartient_arbre ['l';'a';'i';'t']  arbre_sujet
let%test _ = appartient_arbre ['l';'a';'r';'d']  arbre_sujet
let%test _ = appartient_arbre ['l';'e']  arbre_sujet
let%test _ = appartient_arbre ['l';'e';'s']  arbre_sujet
let%test _ = appartient_arbre ['l';'o';'n';'g']  arbre_sujet
let%test _ = not (appartient_arbre ['t';'o';'t';'o'] arbre_sujet)
let%test _ = not (appartient_arbre ['b';'a']  arbre_sujet)
let%test _ = not (appartient_arbre ['l';'o';'n']  arbre_sujet)

(******************************************************************************)
(*   fonction d'ajout d'une liste éléments dans un arbre                      *)
(*   signature  : ajout : 'a list -> 'a arbre -> 'a arbre                     *)
(*   paramètres : - une liste d'éléments (caractères dans le cas d'un dico)   *)
(*                - un arbre n-aire                                           *)
(*   résultat   : l'arbre n-aire avec le mot ajouté                           *)
(******************************************************************************)
let rec ajout_arbre lc (Noeud (b, lb)) =
  match lc with
	  (* on a épuisé la liste : le résultat est le noeud sur lequel on
		 est arrivé avec son booléen mis à vrai *)
	| [] -> Noeud (true, lb)
	  (* sinon on cherche l'arbre arbre_c de la branche correspondant
		 au premier caractère de la liste;
		 si on ne le trouve pas, le résultat de cette recherche est un arbre
		 avec une liste de branches vide.

		 Le résultat de aux est le noeud en paramètre
		 que l'on met à jour en remplacant dans sa liste de branches,
		 la branche du premier caractère par la branche dont l'arbre est 
		 le résultat de l'ajout du reste des caractères à l'arbre arbre_c
	   *)
	| c::qlc -> let arbre_c = 
				  let l = (recherche c lb) in
					match l with
					  | None   -> Noeud (false, [])
					  | Some a -> a
				in Noeud(b, maj c (ajout_arbre qlc arbre_c) lb)

let arbre_sujet2 = ajout_arbre ['b';'a';'s'] (
				  ajout_arbre ['b';'a';'t'] (
				  ajout_arbre ['d';'e'](
				  ajout_arbre ['l';'a'](
				  ajout_arbre ['l';'a';'i'](
				  ajout_arbre ['l';'a';'i';'d'](
				  ajout_arbre ['l';'a';'i';'t'](
				  ajout_arbre ['l';'a';'r';'d'](
				  ajout_arbre ['l';'e'] (
				  ajout_arbre ['l';'e';'s'](
				  ajout_arbre ['l';'o';'n';'g']  (Noeud(false,[]))))))))))))

let arbre_sujet3 = ajout_arbre ['b';'a';'s'] (
				  ajout_arbre ['l';'a';'i';'t'](
				  ajout_arbre ['b';'a';'t'] (
				  ajout_arbre ['l';'e'] (
				  ajout_arbre ['d';'e'](
				  ajout_arbre ['l';'a';'i'](
				  ajout_arbre ['l';'a';'i';'d'](
				  ajout_arbre ['l';'e';'s'](
				  ajout_arbre ['l';'a';'r';'d'](
				  ajout_arbre ['l';'a'](
				  ajout_arbre ['l';'o';'n';'g']  (Noeud(false,[]))))))))))))

let%test _ = arbre_sujet2 = arbre_sujet
let%test _ = arbre_sujet3 = arbre_sujet

(******************************************************************************)
(*   fonction de retrait d'une liste d'éléments dans un arbre                 *)
(*   signature  : retrait : 'a list -> 'a arbre -> 'a arbre                   *)
(*   paramètres : - une liste d'éléments (caractères dans le cas d'un dico)   *)
(*                - un arbre n-aire                                           *)
(*   résultat   : l'arbre n-aire avec le mot enlevé                           *)
(******************************************************************************)
let rec retrait_arbre lc (Noeud (b, lb)) =
	match lc with
	| [] -> Noeud(false, lb)
	| c::qlc -> let arbre_c =
				  let l = (recherche c lb) in
					match l with
					| None -> Noeud (false, [])
					| Some a -> a
				in Noeud(b, maj c (retrait_arbre qlc arbre_c) lb);;

let arbre_sujet4 = retrait_arbre ['b';'a';'s'] (
				  retrait_arbre ['l';'a';'i';'t'](
				  retrait_arbre ['b';'a';'t'] (
				  retrait_arbre ['l';'e'] (
				  retrait_arbre ['d';'e'](
				  retrait_arbre ['l';'a';'i'](
				  retrait_arbre ['l';'a';'i';'d'](
				  retrait_arbre ['l';'e';'s'](
				  retrait_arbre ['l';'a';'r';'d'](
				  retrait_arbre ['l';'a'](
				  retrait_arbre ['l';'o';'n';'g']  (arbre_sujet3)))))))))));;

let bb = ('b',Noeud(false,[('a',Noeud(false,[('s',Noeud(false,[]));('t',Noeud(false,[]))]))]))
let bd = ('d',Noeud(false,[('e',Noeud(false,[]))]))
let bl = ('l',Noeud(false,[('a',Noeud(false,[('i',Noeud(false,[('d',Noeud(false,[]));('t',Noeud(false,[]))]));('r',Noeud(false,[('d',Noeud(false,[]))]))]));
						   ('e',Noeud(false,[('s',Noeud(false,[]))]));
						   ('o',Noeud(false,[('n',Noeud(false,[('g',Noeud(false,[]))]))]))]))
let b1 = [bb;bd;bl]
let arbre_vide = Noeud(false,b1)

let%test _ = arbre_sujet4 = arbre_vide;;

(* Exercice 5 *)
(******************************************************************************)
(*   fonction de normalisation qui élimine les branches inutiles              *)
(*   signature  : normalisation: 'a arbre -> 'a arbre                         *)
(*   paramètres : - un arbre n-aire                                           *)
(*   résultat   : l'arbre n-aire avec les branches inutiles enlevées          *)
(******************************************************************************)
let rec normalisation (Noeud(b, arb)) =
	if arb = [] then Noeud(b,[])
	else let arb_norm = 
		List.fold_right (fun (c, sa) qt -> let norm_abr = normalisation sa in 
			if norm_abr = Noeud(false,[]) then qt else (c, norm_abr)::qt) arb [] in
		if (not b) && (arb_norm = []) then
			Noeud(false,[])
		else
			Noeud(b, arb_norm);;

let arbre_test = normalisation (retrait_arbre ['n';'o';'u';'v';'e';'a';'u'] (ajout_arbre ['n';'o';'u';'v';'e';'a';'u'] arbre_sujet));;
let%test _ = arbre_test = arbre_sujet;;

