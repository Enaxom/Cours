# Programmation fonctionnelle

Monday, 27. January 2020 04:15PM

---

## Cours 1 - Introduction à la programmation fonctionnelle et à OCAML

> *cours1.pdf*
>> cours1_bis.pdf en complément avec des exercices

> Évaluation en bureau d'étude, 2h de programmation

*#4*
On a toujours le même résultat quand une fonction est appelée en programmation fonctionnelle pure.

*#9*
**Inférence de types:** Les types sont calculés et on ne donne pas explicitement les types dans le programme.

**Statique** à la compilation.
**Dynamique** à l'exécution.

*#13*
Opérations par types primitifs. On ne peut pas multiplier un entier et un flotant.

*#15*
**Définition**

- globales
- simultanées
- locales
- globalité-localité

x = 7 global masqué par une définition locale (x=4).

*#19 - 24*

~~~
let a = 5 in 
let a = 4 and b = a in
b

b = 5
~~~

*#29*
Spécitication de la fonction.

*#33*
Exemple spec et tests.

*#37*
Fonction à deux paramètres. 

*#44*
Type = : 'a -> 'a -> bool
Trois paramètres, 3 fmêches avec f, g, x et le retour.

---

Wednesday, 29. January 2020 10:15AM 

---

*#48*
~~~
let f x y z = if z then x z else y z z;;

x -> y -> z -> 'a
(bool ->  'a) -> (bool -> bool -> 'a ) -> bool -> 'a
~~~

*#49*
Structures de contrôle:

- Conditionnel
- Définition
- Appel de fonctions

*#50*
~~~
fst: ('a * 'b) -> 'a
snd: ('a * 'b) -> 'b
~~~

*#52*
~~~
let a = (1,2,3) in
let (x,y,z) = a in // Filtre et donnée de filtrage

----

toto: 'a -> 'b -> 'a * 'b * 'a
let (a,b,c) = toto x y

~~~

*#68*
**Modules**
Spécification dans un fichier `.mli`.
Implantaton dans un fichier `ml`.

---

## Cours 2 - Fonctions récursives, analyse récursive, terminaison et complexité

> *cours2.pdf*
>> cours2_bis.pdf en complément avec des exercices

*#3*
~~~
let rec fact n =
	if n = 0 then 1
	else n * fact (n-1);;
val fact : int -> int = <fun> 
~~~

*#5*
Récursivité **terminale** et **non terminale**.

*#6*
**Suite de Fibonacci**
~~~
let rec fibonacci n =
	if n = 0 then 0
	else if n = 1 then 1
	else fibonacci (n-1) + fibonacci (n-2);;

---

let rec fibonacci n =
	if n <= 1 then n
	else fibonacci (n-1) + fibonacci (n-2);;
	
---

let rec fibonacci x =
	match x with
	| 0 -> 0
	| 1 -> 1
	| _ -> fibonacci (x-1) + fibonacci (x-2);;
~~~

**Puissande n-ème entière d'un nombre**
~~~
let rec puissance x n =
	if n = 0 then 1.
	else x *. puissance x (n-1);;
~~~

*#12*
Analyse pour la rédaction d'une fonction récursive.

*#14*
**Exemple du PGCD**
Maximum de taille: `x+y`.
Précondition: `x, y > 0`.
Tests:
`(0,3) -> 3`
`(3,0) -> 3` 
`(0,0) -> 0`
`(3,5) -> `
`(5,3) -> `
`(4,20) -> `
`(20,4) -> `

*#23*
**Compléxité Fibonacci**
~~~
n = 1/0 -> qu'un appel
C(n) = 1 + C(n-1) + C(n-1)
C(n) = n
~~~

**Complexité factorielle**
~~~
0! = 1
n! = n * (n-1)!

C(0) = 1
C(n) = 1 + (n-1)
=> C(n) = n + 1

O(n)
~~~

**Puissance**
$$x^n = x * x^{n-1}$$
~~~
C(0) = 0
C(n) = 1 + C(n-1)

O(n)
~~~

**Puissance**
$$x^{2n} = x^n * x^n$$

~~~
C(0) = 0
C(2n) = 1 + C(n)
C(2n + 1) = 2 + C(n)
~~~

*#24*
Quand on divise en deux, la complexité est en log.

*#28*
Différentes complexités.

*#31*
PGCD récursivité terminale.

*#35*
**Factorielle récursivité terminale**
*Autre version #36*
~~~
let fact n =
let rec_aux n acc =
if n = 0
then acc
else rec_aux (n-1)
in rec_aux n 1;;
~~~

---

Tuesday, 04. February 2020 08:00AM

---

## Cours 3 - Listes, itérateurs de listes et tris

 *#2*
 Entier -> type récursif.
 
 *#3*

 []
 a::l
 el liste
 'a 'a list

`::`: 'a -> 'a list -> 'a list

*#4*
**Structure oCaml liste**
`[1;2;3] = 1::[2;3]`
Même type pour tous les éléments de la liste.

*#5*
`List.hd`: head
`List.tl` : tail

*#6*
*1. Écrire les fonctions hd et tl*
~~~
let head list =
	match list with
	|h::_ -> h
	| [] -> failwith "Empty list";; // Peu importe l'endroit

let tail list =
	match list with
	| _::t -> t
	| [] -> failwith "Empty list";;
~~~

*2. Écrire la fonction taille qui renvoie la longueur d'une liste*
~~~
let rec size list =
	match list with
	| [] -> 0
	| _::t -> (size t) + 1;;
~~~
Complexité linéaire n. Taille de la liste.
~~~
C(0) = 1
C(n) = 1 + C(n-1)
~~~

*3. Écrire la fonction append qui renvoie la concaténation de deux listes*
~~~
let rec append list1 list2 =
	match list1 with
	| [] -> list2
	| h::t -> h::(append t list2);;
~~~
Complexité linéaire par rapport à la taille de list1. Constant.

*#7*
*1. Type de l'itérateur List.map*
`('a -> 'b) -> 'a list -> 'b list`

*2. Écrire cet itérateur*
~~~
let rec map fun list =
	match list with
	| [] -> list
	| h::t -> (fun h)::(map fun t);;
~~~

*3. Écrire `string_of_int_list` qui transforme une liste d'entiers en une liste de chaînes de caractères en utilisant List.map*
~~~
let string_of_int_list l = map string_of_int l;;
~~~

*#10*
*1. Type de `fold_right` et `fold_left`*
`fold_right: ('a -> 'b -> 'b) -> 'a list -> 'b  -> 'b`
`fold_left: ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a`

*2. Écrire les itérateurs*
~~~
let rec fold_right f l e =
	match l with
	| [] -> e
	| h::t -> f h (fold_right f t e);;
~~~

~~~
let rec fold_left f acc l =
	match l with
	| [] -> acc
	| h::t -> fold_left f (f acc h) q;;
~~~

*3. Fonction `rev`*
~~~
let rec rev l =
	match l with
	| [] -> []
	| h::t -> (rev q)@[t]
Complexité O(n²)
	
let rev l =
let aux l acc =
	match l with
	| [] -> acc
	| t::q -> aux q (t::acc)
in aux l [];;
Complexité O(n)

let rev list = fold_right (fun t rq -> rq@[t])

let rev list = fold_left (fun t acc -> t::acc) []
~~~

*#17*
Meilleure complexité -> `n * log n`

*#19*
**Tri par insertion**



