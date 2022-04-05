@doc doc"""
#### Objet

Résolution des problèmes de minimisation sous contraintes d'égalités par l'algorithme du lagrangien augmenté

#### Syntaxe
```julia
Lagrangien_Augmente(algo,fonc,contrainte,gradfonc,hessfonc,grad_contrainte,
			hess_contrainte,x0,options)
```

#### Entrées
  - algo 		   : (String) l'algorithme sans contraintes à utiliser:
    - "newton"  : pour l'algorithme de Newton
    - "cauchy"  : pour le pas de Cauchy
    - "gct"     : pour le gradient conjugué tronqué
  - fonc 		   : (Function) la fonction à minimiser
  - contrainte	   : (Function) la contrainte [x est dans le domaine des contraintes ssi ``c(x)=0``]
  - gradfonc       : (Function) le gradient de la fonction
  - hessfonc 	   : (Function) la hessienne de la fonction
  - grad_contrainte : (Function) le gradient de la contrainte
  - hess_contrainte : (Function) la hessienne de la contrainte
  - x0 			   : (Array{Float,1}) la première composante du point de départ du Lagrangien
  - options		   : (Array{Float,1})
    1. epsilon 	   : utilisé dans les critères d'arrêt
    2. tol         : la tolérance utilisée dans les critères d'arrêt
    3. itermax 	   : nombre maximal d'itération dans la boucle principale
    4. lambda0	   : la deuxième composante du point de départ du Lagrangien
    5. mu0,tho 	   : valeurs initiales des variables de l'algorithme

#### Sorties
- xmin		   : (Array{Float,1}) une approximation de la solution du problème avec contraintes
- fxmin 	   : (Float) ``f(x_{min})``
- flag		   : (Integer) indicateur du déroulement de l'algorithme
   - 0    : convergence
   - 1    : nombre maximal d'itération atteint
   - (-1) : une erreur s'est produite
- niters 	   : (Integer) nombre d'itérations réalisées
- muks : (Array{Float}) tableau des valeurs prises par mu_k au cours de l'exécution
- lambdak : (Array{Float}) tableau des valeurs prises par lambda_k au cours de l'exécution

#### Exemple d'appel
```julia
using LinearAlgebra
f(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2
gradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]
hessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]
algo = "gct" # ou newton|gct
x0 = [1; 0]
options = []
contrainte(x) =  (x[1]^2) + (x[2]^2) -1.5
grad_contrainte(x) = [2*x[1] ;2*x[2]]
hess_contrainte(x) = [2 0;0 2]
output = Lagrangien_Augmente(algo,f,contrainte,gradf,hessf,grad_contrainte,hess_contrainte,x0,options)
```

#### Tolérances des algorithmes appelés

Pour les tolérances définies dans les algorithmes appelés (Newton et régions de confiance), prendre les tolérances 
par défaut définies dans ces algorithmes.

"""
function Lagrangien_Augmente(algo,fonc::Function,contrainte::Function,gradfonc::Function,
	hessfonc::Function,grad_contrainte::Function,hess_contrainte::Function,x0,options)

	if options == []
		tol_rel = 1e-5
    tol_abs = 1e-7
		itermax = 1000
		lambda0 = 2
		mu0 = 100
		tho = 2
	else
		tol_rel = options[2]
    tol_abs = options[3]
		itermax = options[4]
		lambda0 = options[5]
		mu0 = options[6]
		tho = options[7]
	end

  n = length(x0)
  xmin = zeros(n)
	fxmin = 0
	flag = 0
	iter = 0
  muk = mu0
  muks = [mu0]
  lambdak = lambda0
  lambdaks = [lambda0]

	
	return xmin,fxmin,flag,iter, muks, lambdaks
end
