TP15 : Quadtrees et Images
==

Le but de ce TP est d'utiliser une structure arborescente pour
représenter et réduire des images.

Pour chaque question, il est indiquée si elle doit être faite en `C`,
en `ocaml`, ou les deux. Pour les questions en `C`, vous devez
compiler en ligne de commande et écrire vos tests (mais je vous
fournis un certain nombre de fonctions utiles pour cela). Pour les
questions en `ocaml`, allez sur le [serveur de
TP](http://mp2ipvc-klimann.learn-ocaml.org/) car il vous manque certaines
structures de données pour faire un programme complet.

## Des couleurs

Il y a plusieurs façons de coder des couleurs. Nous considérons le
codage RGB obtenu par mélange des trois couleurs rouge (*r*ed), vert
(*g*reen) et bleu (*b*lue) :
chaque couleur est représentée par un triplet d'entiers `(r, g, b)`,
chaque entier étant compris entre 0 et 255. Par
exemple :

| couleur | RGB |
|---------|-------|
| blanc | (255, 255, 255) |
| noir | (0, 0, 0)|
| bleu | (0, 0, 255) |
| violet | (255, 0, 255 ) |
| gris clair | (200, 200, 200) |


Les types sont fournis en `C` et en `ocaml`.

Les signatures des fonctions à écrire dans les exercices qui suivent
sont également fournis. À vous de les documenter.

Les fichiers pour le `C` : [ppm.h](ppm.h) / [ppm.c](ppm.c) /
[image.h](image.h) / [image.c](image.c) / [quadtree.h](quadtree.h) /
[quadtree.c](quadtree.c).

Rappel : utilisez `gcc` avec les options `-Wall -Wno-unused
-pedantic`; vous pouvez compiler en donnant plusieurs fichiers `.c` en
argument.

Pour `ocaml`, tout est fourni dans les préludes sur le [serveur de
TP](http://mp2ipvc-klimann.learn-ocaml.org/).

### Exercice 1 : comparer deux couleurs [ `C` et `ocaml` ]
Écrire une fonction `meme_couleur` qui teste si les deux couleurs
passées en argument sont identiques.

### Exercice 2 : mélanger des couleurs [ `C` et `ocaml` ]
Écrire une fonction `melange2` qui prend en argument deux couleurs et
renvoie un mélange de ces deux couleurs, c'est-à-dire pour chaque
composante, la moyenne des deux composantes correspondantes
dans les deux couleurs à mélanger.

Je vous fournis deux fonctions pour tester votre code (fonctions
extraites en gros de ce que vous aviez à faire pour le TP8) :
`canevas` et `affiche`.

Tester la fonction `melange2`. (Rappel : le nom d'un fichier image
au format `PPM P3` doit porter l'extension `.ppm`, la commande
`display` permet de visualiser le fichier.)

Écrire (en combinant des appels à `melange2`) une fonction `melange4`
qui renvoie le mélange de 4 couleurs et la tester.

## Quadtrees
Un _quadtree_ est un arbre dont tous les nœuds internes possèdent 4
fils. On peut utiliser un tel arbre pour diviser le plan ou une zone
du plan en quatre, c'est pourquoi nous appelleront les 4 fils d'un
nœud interne `se`, `so`, `ne`, `no` (pour sud-est, sud-ouest,
nord-est et nord-ouest).


Dans ce TP, nous travaillerons sur des images carrées dont le côté est
une puissance de 2 (il n'y aura jamais besoin de tester cette
propriété, mais il faudra la documenter). Une telle image peut être
représentée de la façon suivante par un quadtree :

* la racine représente l'image entière,
* chaque nœud interne représente une partie de l'image; si on coupe
cette image en quatre parties égales, chacune des parties obtenues est
représentée par un des fils de ce nœud (le fils `se` pour la partie
sud-est, etc.) 
* une feuille représente une partie de l'image d'une seule couleur.

exemple : (fils 1 = no, fils 2 = ne, fils 3 = se, fils 4 = so)

<a title="Wojciech Muła, Public domain, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Quad_tree_bitmap.svg"><img width="512" alt="Quad tree bitmap" src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Quad_tree_bitmap.svg/512px-Quad_tree_bitmap.svg.png"></a>

### Exercice 3 : d'une image à un quadtree [ `C` ]
Écrire une fonction `image2quadtree` qui prend en argument un pointeur
sur image, un indice de début d'abscisse `debi`, un indice de début
d'ordonnée `debj` et une taille supposée être une puissance de 2 et renvoie
un pointeur sur un quadtree représentant la sous-image carrée
correspondante tel que le quadtree résultant soit un
quadtree parfait (toutes les feuilles au même niveau, correspondant
chacune à un pixel dans l'image). La valeur du champ `c` d'un nœud
interne est le mélange (au sens de la fonction `melange4`) des champs
`c` de ses fils.

Cette fonction est utilisée dans la fonction `img2qt` déjà écrite.

Vous pouvez tester (de façon imparfaite) votre fonction avec les
images [arc.ppm](arc.ppm) (de taille 512x512) et [ordi.ppm](ordi.ppm)
(de taille 256x256), en comptant le nombre de nœuds internes de votre
arbre (fonctions `lecture` pour obtenir une image à partir d'un
fichier et `taillei` pour obtenir le nombre de nœuds internes d'un
quadtree fournies).

### Exercice 4 : nombre de nœuds internes d'un quadtree [ `ocaml` ]
En `C` je vous ai fourni une fonction comptant le nombre de nœuds
internes d'un quadtree. Écrivez cette fonction en `ocaml` [serveur de
TP](http://mp2ipvc-klimann.learn-ocaml.org/).

### Exercice 5 : d'un quadtree à une image [ `C` ]
Écrire une fonction `quadtree2image` qui prend en argument un pointeur
sur quadtree, l'adresse d'une image, un entier `debi`, un entier
`debj` et une taille supposée être une puissance de 2 et remplit la
zone correspondante de l'image à partir du quadtree. Attention, dans
ce sens-là, on ne suppose plus que le quadtree est parfait. (Mais on
suppose que le quadtree est bien formé sans avoir à le vérifier.)

Cette fonction est utilisée dans la fonction `qt2img2` déjà écrite.

Vous pouvez tester cette fonction en combinant `img2qt` et `qt2img` et
vérifiant (visuellement, en utilisant la fonction fournie `affiche` et
la commande `display` dans le terminal) que vous avez la
même image.

### Exercice 6 : nettoyer la mémoire [ `C` ]
Écrire la fonction `liberer_quadtree`.

### Exercice 7 : d'une image à un quadtree simplifié [ `C` et `ocaml` ]
Noter le nombre de nœuds interne des quadtrees associés aux images
[arc.ppm](arc.ppm) et [ordi.ppm](ordi.ppm).

Quand les 4 fils d'un nœud interne d'un quadtree sont des feuilles de
même couleur, l'existence de ces feuilles n'apporte rien : la couleur
et la taille de la zone correspondante dans l'image sont de fait déjà
stockées dans le nœud. On peut donc supprimer ses fils. Écrire une
fonction `simplifier` qui exécute cette opération pour un nœud.

Ajouter un appel à `simplifier` dans la fonction `image2quadtree` de
sorte que le quadtree obtenu ne contienne aucun nœud
interne dont tous les fils sont des feuilles de même couleur.

Vérifier (visuellement) que les images obtenues sont toujours
équivalentes et comparer le nombre de nœuds internes des nouveaux
quadtrees avec `taillei`.

### Exercice 8 : rotation d'images [`C` et `ocaml`]
On peut faire tourner une image représentée par un quadtree d'un quart
de tour en appliquant la même permutation circulaire sur les fils de tous
les nœuds internes du quadtree.

Implémenter la fonction `tourner` qui effectue cette opération. Tester
votre fonction sur les images fournies.

### Exercice 9 : réduction d'images [ `C` et `ocaml` ]
On peut utiliser un quadtree pour compresser une image : si dans une
zone représentée par un nœud interne du quadtree, les couleurs sont
semblables, alors on va transformer ce nœud interne en feuille et lui
attribuer la moyenne des couleurs de ses descendants. Ce sera l'objet
d'un TP plus tardif dans l'année, quand vous saurez écrire dans des
fichiers.

Pour l'instant, nous allons nous contenter d'une manipulation simple
de réduction d'image : pour réduire la taille d'une image représentée
par un quadtree, il suffit de modifier les champs `taille` des nœuds
et de couper la partie inférieure du quadtree.

Implémenter la fonction `reduire` qui effectue cette opération. Tester
votre fonction sur les images fournies.

