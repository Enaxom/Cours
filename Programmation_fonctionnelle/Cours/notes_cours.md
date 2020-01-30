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
