# Cat et Concat
## Auteur
[David Brousseau](mailto:dbrsseau@gmail.com)

## Contexte académique
Projet effectué dans le cadre du cours **INF3172 Principes des systèmes d'exploitation**, remis à l'enseignante **Sonia Dimassi** à l'[Université du Québec à Montréal](https://etudier.uqam.ca/) le 4 mars 2019. Ce projet a été retranscris en décembre 2020 pour le rendre public et l'insérer dans mon porte-folio.

## Description
Simulation du fonctionnement des commandes Cat et Concat à l'aide d'un [descripteur de fichier](https://en.wikipedia.org/wiki/File_descriptor). À noter que ce projet est séparé en deux exercices distincts.

## Compatibilité
Testé sous un environnement **Linux seulement**.

## Dépendances
- [GCC, the GNU Compiler Collection](https://gcc.gnu.org/), compilateur pour le language C/C++.
- [Doxygen <sup>*</sup>](https://www.doxygen.nl/index.html), outil pour générer la documentation automatique.
- [Valgrind <sup>*</sup>](https://www.valgrind.org/), outil pour vérifier qu'il n'y a pas de fuites de mémoire.

_<sup>*</sup> Dépendances optionnelles selon votre utilisation._ 

## Environnement suggéré
- [VS Code](https://code.visualstudio.com/), éditeur de texte pour modifier le code.
    - [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools), extension pour le language C/C++.
    - [Doxygen Documentation Generator](https://marketplace.visualstudio.com/items?itemName=cschlosser.doxdocgen), extension pour générer la documentation.
    - [TODO Highlight](https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight), extension pour afficher les TODOs.

## Installation
`make`, compile les deux commandes.<br>
`make cat`, compile la commande cat uniquement.<br>
`make concat`, compile la commande concat uniquement.<br>
`make doc`, génère la documentation du projet.<br>
`make memcheck`, vérifie qu'il n'y a pas de fuites de mémoire.<br>
`make clean`, supprime les fichiers compilés.

## Fonctionnement
```
# Exercice 1
bin/cat <filename>

# Exercice 2
bin/concat <input-filename> <input-filename> <output-filename>
```

## Documentations
- [C Programming Language](https://devdocs.io/c/)
- [cat(1) — Linux manual page](https://man7.org/linux/man-pages/man1/cat.1.html)
- [Doxygen manual](http://cs.swan.ac.uk/~csoliver/ok-sat-library/internet_html/doc/doc/Doxygen/1.7.6.1/html/config.html)
- [Valgrind User Manual](https://www.valgrind.org/docs/manual/manual.html)

## Référence
- [C Program to merge contents of two files into a third file](https://www.geeksforgeeks.org/c-program-merge-contents-two-files-third-file/)