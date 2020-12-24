# Cat et Concat
## Auteur
[David Brousseau](mailto:dbrsseau@gmail.com)

## Contexte académique
Projet effectué dans le cadre du cours **INF3172 Principes des systèmes d'exploitation**, remis à l'enseignante **Sonia Dimassi** à l'[Université du Québec à Montréal](https://etudier.uqam.ca/) le 4 mars 2019. Ce projet a été retranscris en décembre 2020 pour le rendre public et l'insérer dans mon porte-folio.

## Description
Simulation du fonctionnement des commandes Cat et Concat à l'aide d'un [descripteur de fichier](https://en.wikipedia.org/wiki/File_descriptor). À noter que ce projet est séparé en deux exercices distincts.

## Environnement suggéré
- [Terminal Linux](https://doc.ubuntu-fr.org/terminal), terminal pour lancer des commandes.
- [VS Code](https://code.visualstudio.com/), éditeur de texte pour modifier le code.
- [C/C++ Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools), extension du language C réservé à l'usage de VS Code.
- [TODO Highlight](https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight), extension d'affichage des TODOs réservé à l'usage de VS Code.
- [Doxygen](https://www.doxygen.nl/index.html), outil pour générer la documentation automatique.
- [Valgrind](https://www.valgrind.org/), outil pour vérifier qu'il n'y a pas de fuites de mémoire.

## Compatibilité
Testé sous un environnement **Linux seulement**.

## Installation
`make`, compile les deux commandes.<br>
`make cat`, compile la commande cat uniquement.<br>
`make concat`, compile la commande concat uniquement.<br>
`make doc`, génère la documentation du projet. **(requiert Doxygen)**<br>
`make memcheck`, vérifie qu'il n'y a pas de fuites de mémoire. **(requiert Valgrind)**<br>
`make clean`, supprime les fichiers compilés.

## Fonctionnement
### Cat
```
bin/cat <filename>
```

### Concat
```
bin/concat <input-filename> <input-filename> <output-filename>
```

## Références
- [cat(1) — Linux manual page](https://man7.org/linux/man-pages/man1/cat.1.html)
- [C Program to merge contents of two files into a third file](https://www.geeksforgeeks.org/c-program-merge-contents-two-files-third-file/)
- [Doxygen manual](http://cs.swan.ac.uk/~csoliver/ok-sat-library/internet_html/doc/doc/Doxygen/1.7.6.1/html/config.html)
- [Valgrind User Manual](https://www.valgrind.org/docs/manual/manual.html)