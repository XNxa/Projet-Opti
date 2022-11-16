# Projet d'optimisation numérique

Pour récupérer les sources, il faut cloner ce dépot git : 

```bash
git clone https://gitlab.irit.fr/toc/mathn7/optimisation-numerique/projet-optinum.git
```

Les sujets liés au projet se trouvent dans les notebooks du répertoire `src`. Voici l'ordre des sujets :

* Newton
* Régions de confiance
* Lagrangien augmenté

Pour réaliser le projet vous aurez besoin de cette [documentation](doc-projet.pdf) qui décrit les différents algorithmes à implémenter. 

**Attention**, seuls les fichiers dans le répertoire `src` sont à modifier !

## Utilisation de `julia` dans les salles d'enseignement

### Via Jupyter notebook

La première étape consiste à ajouter dans le path, le chemin contenant l'exécutable Julia. Pour cela, ajouter dans le fichier `~/.bashrc` la ligne suivante.

```bash
export PATH="/home/ocots/Public/bin":$PATH
```

Ensuite, ouvrez un terminal et exécuter la commande `julia`. Cela doit ouvrir une version `1.8.2` de Julia. Pour utiliser `Jupyter notebook` 
il faut au préalable installer le noyau Julia.  Pour cela, exécuter les commandes :

```julia
using Pkg
Pkg.build("IJulia")
```

Maintenant, il est possible d'ouvrir Jupyter pour exécuter des notebooks Julia. Pour cela, toujours dans `Julia` faites :

```julia
using IJulia
notebook()
```

### Via VS Code

Si vous désirez utiliser VS Code, il vous faudra installer certains packages sur votre compte personnel ce qui peut vous faire dépasser votre quota.
En principe, pour ce projet, il y a très peu de packages supplémentaires à installer.

1. Pour utiliser des notebooks Julia dans VS Code, il faut tout d'abord installer les extensions [Julia](https://marketplace.visualstudio.com/items?itemName=julialang.language-julia) et [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter) dans `VS Code`.

2. Il faut ensuite donner le chemin de l'exécutable Julia. Pour cela, ouvrir les préférences `File -> Preferences -> Settings` et faire la recherche `julia path`. Dans l'option `Julia: Executable Path`, écrire 

```bash
/home/ocots/Public/bin/julia_vs_code
``` 

3. Fermer et réouvrir `VS Code`.

4. Ouvrir le dossier du projet et exécuter (SHIFT + ENTER ou CTRL + ENTER) la première cellule de code du fichier `src/algo_newton.ipynb`. Vous devez alors sélectionner le code `Julia` qui sera utilisé, choisissez la version `1.8.2`.

Attention, si certains `using` ne fonctionnent pas, c'est parce que vous devez ajouter des packages. Il faudra alors faire les commandes suivantes dans 
n'importe quelle cellule du notebook, on appelle `pkg-name`, le nom du package à installer.

```julia
using Pkg
Pkg.add("pkg-name")
```



