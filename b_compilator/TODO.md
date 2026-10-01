# Plan — ce qu'il reste à faire sur le compilateur B

État au 2026-10-01, après correction du bug de nettoyage de pile dans `function_call`
(l'ordre `push eax` / `add esp, N` était inversé, voir git history / commentaires de session).

Vérifié par `grep` : les tokens suivants sont déclarés dans `y_compilator.y` mais
n'apparaissent dans **aucune règle de grammaire** — rien n'est câblé pour eux.

## Ce qui marche déjà
- Déclaration de variables locales (`auto`), assignation, arithmétique (`+ - * / %`)
- Appels de fonction avec paramètres
- `if`/`else`, `while`
- Retour de fonction avec valeur
- ✅ Comparaisons (`==`, `!=`, `<`, `<=`, `>`, `>=`) via `comp_operation` +
  `cmp`/`setX`/`movzx`, précédence correcte entre `ASSIGN` et `PLUS MINUS`
  (conflit shift/reduce résolu avec `%prec EQUAL` sur la règle
  `expression comp_operation expression`, nécessaire car le dernier symbole
  de la règle est un non-terminal donc n'a pas de précédence propre)

## 1. Structures de contrôle manquantes
- `for` — token déclaré, zéro règle.
- `do` / `repeat` — idem.
- `switch` / `case` / `default` — idem, plus complexe (table de saut ou chaîne de comparaisons).
- `break` — nécessite de connaître le label de fin de boucle courante
  (la pile de labels `labels`/`push_label`/`pop_label` existe déjà et est réutilisable).
- `goto` / labels utilisateur / `next` — pas de mécanisme de labels nommés par
  l'utilisateur pour l'instant (seulement les labels internes générés).

## 2. Données composées
- Tableaux / vecteurs B (`O_BRACKET`/`C_BRACKET` déclarés, inutilisés) —
  déclaration `auto tab[10];` et indexation `tab[i]`.
- Chaînes de caractères (`D_QUOTES`) et caractères (`S_QUOTES`) — le lexer ne
  capture même pas le contenu entre guillemets actuellement, juste le symbole.

## 3. Variables globales / `extrn`
- `var_declaration` fait toujours `sub esp, N`, ce qui suppose un contexte de
  fonction. Utilisé hors fonction (variable globale), ça génère du code
  assembleur invalide hors section `.text` exécutable. Distinguer déclaration
  globale (section `.data`/`.bss`) vs locale.
- `extrn` pour référencer des variables définies ailleurs n'est pas câblé du tout.

## 4. Opérateurs manquants au lexer
- Pas de `&&`, `||`, `!` (logique).
- Pas d'opérateurs bit à bit (`&`, `|`, `^`, `~`, `<<`, `>>`) — absents même du `.l`.
- Pas de `++`/`--`.
- Pas de moins unaire (`-a`) : la grammaire n'a que `expression MINUS expression` en binaire.
- Pas de commentaires `/* ... */` dans le lexer — un fichier `.b` commenté cassera le lex.

## 5. Finitions
- `return;` sans expression n'est pas supporté (la règle exige toujours une expression).
- Pas de gestion d'erreur de syntaxe utile au-delà du `yyerror` générique (pas de
  ligne/colonne affichée alors que `col`/`tok_col` existent déjà dans le lexer —
  calculés mais jamais utilisés dans un message d'erreur).
- `TOO_LONG_ID` est renvoyé par le lexer mais aucune règle ne l'attrape → erreur
  de parsing brute sans message clair pour l'utilisateur.

## Ordre conseillé
1. ~~Comparaisons~~ — fait.
2. `break` + `for` — réutilisent l'infra de labels déjà en place.
3. Reste des structures de contrôle (`do`/`repeat`, `switch`/`case`, `goto`).
4. Tableaux puis chaînes/caractères.
5. Variables globales / `extrn`.
6. Opérateurs manquants au lexer, puis finitions.
