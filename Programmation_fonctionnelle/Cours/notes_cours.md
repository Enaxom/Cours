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
