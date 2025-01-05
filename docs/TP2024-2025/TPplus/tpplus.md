TP13 : Compilation et exécution en ligne de commande d'un programme `ocaml`
===


### Exercice 1 : Mise en jambe.

#### `ocaml`
On peut afficher un entier en `ocaml` avec la fonction `print_int :
int -> unit` (nous reviendrons en cours sur ce que signifie `unit`,
pour l'instant considérez que la fonction ne renvoie rien) et une
chaîne de caractères avec la fonction `print_string : string -> unit`
pour afficher une chaîne.

Écrire un programme `ocaml` qui affiche `bonjour` suivi d'un retour à la
ligne, le compiler en ligne de commande avec `ocamlopt` et
l'exécuter. (Rappel: l'exécution d'un programme `ocaml` est
l'évaluation de la dernière expression du code.)

L'exécuter en redirigeant sa sortie standard vers le fichier `toto`.


### Exercice 2 : Tracé de points en ascii art
Le but de cet exercice est de partir d'une description de pixels du
plan (donc d'éléments de
![](https://latex.codecogs.com/svg.latex?{\mathbb%20N}^2)) donnés sous
la forme d'une abscisse de départ et d'une suite d'ordonnées,
l'abscisse de départ étant associée à la première ordonnée et
l'abscisse augmentant de 1 à chaque nouvelle ordonnée, et de dessiner
une représentation de ces pixels à l'écran sous la forme d'espaces ` ` pour
les pixels blancs et de `x` pour les pixels noirs.


**exemple :** On a au départ :
* abscisse : 2
* ordonnées : 1, 5, 3, 4, 3
Les points à représentés sont alors : (2, 1), (3, 5), (4, 3), (5, 4), (6, 3).

Pour cela, on procède en deux phases :
* fabriquer la suite des points en les triant selon les ordonnées
  décroissantes, et si plusieurs points ont la mêm ordonnée, selon les
  abscisses croissantes; dans l'exemple, on obtiendrait : (3, 5), (5, 4), (4,
  3), (6, 3) , (2, 1);
* dessiner les points correspondants; dans l'exemple on obtiendrait :

```
   x
     x
    x x

  x

```

Le fichier d'interface pour la partie `ocaml` : [point.mli](point.mli)

Écrire les fonctions `maximum`, `liste_points` et `affiche` qui sont
documentées dans le fichier d'interface `point.mli`, en les testant au fur
et à mesure (conserver les fonctions de test dans votre code, en
commentant si besoin les lignes d'appel correspondantes).


### Exercice 3 : Algorithme de tracé de segment de Bresenham

L'algorithme de tracé de segment de Bresenham permet de tracer un
segment sur un écran, comme illustré par

![](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Bresenham_line.png/300px-Bresenham_line.png)

Un écran peut être assimilé à une partie finie du quart de plan discret
![](https://latex.codecogs.com/svg.latex?{\mathbb%20N}^2).

Considérons deux points distincts
![](https://latex.codecogs.com/svg.latex?A(x_A,y_A)) et
![](https://latex.codecogs.com/svg.latex?B(x_B,y_B)) de 
cet écran et supposons pour simplifier que
![](https://latex.codecogs.com/svg.latex?x_a<x_B)
et ![](https://latex.codecogs.com/svg.latex?y_A<y_B) et
que la pente de la droite
![](https://latex.codecogs.com/svg.latex?(AB)) est strictement
inférieure à 1. Le 
segment ![](https://latex.codecogs.com/svg.latex?[AB]) est donc situé entre les abscisses ![](https://latex.codecogs.com/svg.latex?x_A) et ![](https://latex.codecogs.com/svg.latex?x_B). On
cherche une représentation de ce segment par une suite de points
![](https://latex.codecogs.com/svg.latex?A_0=A,A_1,...,A_n=B) où ![](https://latex.codecogs.com/svg.latex?n=x_B-x_A) et l'abscisse de ![](https://latex.codecogs.com/svg.latex?A_i) est
![](https://latex.codecogs.com/svg.latex?y_i=x_A+i) pour chaque ![](https://latex.codecogs.com/svg.latex?i).

L'ordonnée du point d'abscisse ![](https://latex.codecogs.com/svg.latex?x_i) du segment ![](https://latex.codecogs.com/svg.latex?[AB]) est

![](https://latex.codecogs.com/svg.latex?y_i=\frac{y_B-y_A}{x_B-x_A}\times%20(x_i-x_A)+x_B).

Le problème, c'est que cette valeur est rarement entière. Il faut donc
faire un choix entre le partie entière inférieure et la partie entière
supérieure de cette valeur pour chaque  ![](https://latex.codecogs.com/svg.latex?i) : on prend celui des deux
qui est le plus proche de ![](https://latex.codecogs.com/svg.latex?y_i). Notons ![](https://latex.codecogs.com/svg.latex?\tilde{y}_i) le
choix qu'on fait entre les deux pour l'ordonnée du point d'abscisse
![](https://latex.codecogs.com/svg.latex?x_i):

![](https://latex.codecogs.com/svg.latex?\tilde{y}_i\in\{\lfloor%20y_i\rfloor,\lceil%20y_i\rceil\})

Par construction : ![](https://latex.codecogs.com/svg.latex?\tilde{y}_0=y_A) et ![](https://latex.codecogs.com/svg.latex?\tilde{y}_n=y_B).

L'hypothèse selon laquelle la pente de la droite ![](https://latex.codecogs.com/svg.latex?(AB)) est
strictement inférieure à 1 nous assure que :

![](https://latex.codecogs.com/svg.latex?\tilde{y}_{i+1}\in\{\tilde{y}_i,\tilde{y}_i+1\})

L'algorithme de Bresenham permet d'éviter les calculs des valeurs
exactes des ![](https://latex.codecogs.com/svg.latex?y_i).

Notons

![](https://latex.codecogs.com/svg.latex?m=\frac{y_B-y_A}{x_B-x_A}) 

la pente de la droite ![](https://latex.codecogs.com/svg.latex?(AB)) et
![](https://latex.codecogs.com/svg.latex?e) l'erreur d'arrondi accumulée. Au départ, ![](https://latex.codecogs.com/svg.latex?e=0) puisque les
coordonnées de ![](https://latex.codecogs.com/svg.latex?A) sont entières. À chaque étape, l'erreur augmente de
![](https://latex.codecogs.com/svg.latex?m):

* si ![](https://latex.codecogs.com/svg.latex?e+m\leq1/2), alors ![](https://latex.codecogs.com/svg.latex?\tilde{y}_{i+1}=\tilde{y}_i) et on
  incrémente ![](https://latex.codecogs.com/svg.latex?e) de ![](https://latex.codecogs.com/svg.latex?m)
* sinon, ![](https://latex.codecogs.com/svg.latex?\tilde{y}_{i+1}=\tilde{y}_i+1) et on affecte à ![](https://latex.codecogs.com/svg.latex?e) la
  valeur ![](https://latex.codecogs.com/svg.latex?e+m-1).
  

On conserve les types définis à l'exercice précédent (et les fonctions
déjà écrites ne devraient pas être inutiles !).

Écrire une fonction `bresenham : point -> point -> int list` telle
que `bressenham a b` renvoie la liste des ordonnées des points intermédiaires
(les pré-conditions sont supposées, mais ne sont pas à tester).

Écrire une fonction `affiche_segment : point -> point -> unit` pour
l'affichage du segment.

Écrire un programme pour tester le tout.
