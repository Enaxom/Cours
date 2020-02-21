open Assoc
open Arbre
open Chaines

(* le type trie :
    triplet arbre, 
            fonction de décomposition mot -> liste de caractères,
            fonction de recomposition liste de caractères -> mot *)
type ('a,'b) trie = Trie of ('b arbre) * ('a -> 'b list) * ('b list -> 'a)



(******************************************************************************)
(*   fonction de création d'un nouveau trie                                   *)
(*   signature  : nouveau :                                                   *)
(*          ('a -> 'b list) -> ('b list -> 'a) -> ('a, 'b) trie = <fun>       *)
(*   paramètres : - une fonction de décomposition                             *)
(*                     mot -> liste de caractères                             *)
(*                -  une fonction de recomposition                            *)
(*                     liste de caractères -> mot                             *)
(*   résultat     : un nouveau trie "vide"                                    *)
(******************************************************************************)
let nouveau fd fr = Trie(Noeud(false,[]), fd, fr)


(******************************************************************************)
(*   fonction d'appartenance d'un élément à un trie                           *)
(*   signature  : appartient : 'a -> ('a, 'b) trie -> bool = <fun>           *)
(*   paramètres : - un mot                                                    *)
(*                - un trie                                                   *)
(*   résultat   : le résultat booléen du test                                 *)
(******************************************************************************)
let appartient mot (Trie(arbre, dec, _)) = appartient_arbre (dec mot) arbre;;



(******************************************************************************)
(*   fonction d'ajout d'un élément dans un trie                               *)
(*   signature  : ajout : 'a -> ('a, 'b) trie -> ('a, 'b) trie = <fun>        *)
(*   paramètres : - un mot                                                    *)
(*                - un trie                                                   *)
(*   résultat   : le trie avec le mot ajouté                                  *)
(******************************************************************************)
let ajout mot (Trie(arbre, decompose, recompose)) = 
    Trie (ajout_arbre (decompose mot) arbre,decompose,recompose)

(** Pour les tests *)
let trie_sujet = List.fold_right ajout 
                                 ["bas"; "bât"; "de"; "la"; "lai"; "laid"; "lait"; "lard"; "le"; "les"; "long"]
                                 (nouveau decompose_chaine recompose_chaine);;


(******************************************************************************)
(*   fonction de retrait d'un élément d'un trie                               *)
(*   signature  : trie_retrait : 'a -> ('a, 'b) trie -> ('a, 'b) trie = <fun> *)
(*   paramètres : - un mot                                                    *)
(*                - un trie                                                   *)
(*   résultat   : le trie avec le mot retiré                                  *)
(******************************************************************************)
let retrait mot (Trie(arbre, dec, reco)) = Trie(normalisation ((retrait_arbre (dec mot) arbre)), dec, reco);;

(******************************************************************************)
(*   fonction interne au Module qui génère la liste de tous les mots          *)
(*   d'un trie                                                                *)
(*   signature    : trie_dico : ('a, 'b) trie -> 'a list = <fun>              *)
(*   paramètre(s) : le trie                                                   *)
(*   résultat     : la liste des mots                                         *)
(******************************************************************************)
let trie_dico (Trie(arbre, _, _)) =
	let rec aux (Noeud(bol, lb)) =
		match lb with
		| [] -> []
		| (c, Noeud(b, sa))::q -> let liste_res = ((List.map (fun l -> c::l) (aux (Noeud(b, sa))))@(aux (Noeud(b, q)))) in
					if b then [c]::(liste_res) else liste_res
in aux arbre;;


(******************************************************************************)
(* procédure d'affichage d'un trie                                            *)
(*   signature  : affiche : ('a -> unit) -> ('a, 'b) trie -> unit = <fun>      *)
(*   paramètres : - une procédure d'affichage d'un mot                        *)
(*                - un trie                                                   *)
(*   résultat   : aucun                                                       *)
(******************************************************************************)
let affiche p (Trie(arbre, dec, reco)) = List.iter (fun mot -> p (reco mot)) (trie_dico (Trie(arbre, dec, reco)))
