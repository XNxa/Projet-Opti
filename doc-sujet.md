# Documentation pour le projet d'optimisation numérique

La première partie de ce TP-projet concerne les problèmes d’optimisation sans
contraintes. On étudie la méthode de Newton et sa globalisation par l’algorithme des
régions de confiance. La résolution du sous-problème des régions de confiance sera
réalisée de deux façons, soit à l’aide du point de Cauchy, soit par l’algorithme du Gra-
dient Conjugué Tronqué.
La seconde partie du projet exploite la partie précédente pour résoudre des problèmes
d’optimisation avec contraintes par l’algorithme du Lagrangien augmenté. 

## Optimisation sans contraintes

Dans cette partie, on s’intéresse à la résolution du problème

``\min _{x \in \mathbb{R}^{n}} f(x)``

où la fonction ``f`` est de classe ``C^{2}`` sur ``R^{n}`` . On cherche donc à exploiter l’information fournie
par ses dérivées première et seconde, que l’on représente en tout point x par le vecteur
gradient ``\nabla f (x) \in R^{n}`` et la matrice Hessienne ``\nabla^{2} f (x) \in R^{n\times n}``.

[1) Algorithme de Newton local](docs/newton.md)

[2) La méthode des régions de confiance](docs/regions-de-confiance.md)


## Optimisation avec contraintes

Dans cette partie, nous nous intéressons à la résolution des problèmes sous contraintes. Le problème se présente donc sous la forme suivante :

``\min _{x \in \mathbb{R}^{n}} f(x)`` sous la contrainte ``x \in C``

où C est un sous-ensemble non vide de ``\mathbb{R}^{n}``.

[3) Lagrangien Augmenté](docs/lagrangien-augmente.md)
