# flutter_layouts_corrige_m3_2_ex2
## ✅ Corrigé de l'Exercice 2 : Flexible vs Expanded 📐

Cet exercice de Palier 2 a pour but d'analyser la différence de comportement entre **`Expanded`** et **`Flexible`** en comparant deux implémentations côte à côte.

-----

### 💻 Code Complété et Exécuté

Le code ci-dessous complète les sections **TODO 1** et **TODO 2** avec les widgets demandés, utilisant `Expanded` dans le premier cas et `Flexible` dans le second :

```dart
// ... (début du code)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Exemple 1 : Expanded', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              
              // TODO 1 : Créez une Row avec 2 Expanded (flex: 1)
              Container(
                height: 60,
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    Expanded( // 🎯 Expanded 1
                      flex: 1,
                      child: Container(
                        color: Colors.red[300],
                        child: const Center(child: Text('Court')),
                      ),
                    ),
                    Expanded( // 🎯 Expanded 2
                      flex: 1,
                      child: Container(
                        color: Colors.blue[300],
                        child: const Center(child: Text('Texte')),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              const Text('Exemple 2 : Flexible', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              
              // TODO 2 : Créez une Row avec 2 Flexible (flex: 1)
              Container(
                height: 60,
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    Flexible( // 🎯 Flexible 1
                      flex: 1,
                      child: Container(
                        color: Colors.red[300],
                        padding: const EdgeInsets.all(8), // Ajout de padding comme indice
                        child: const Center(child: Text('Court')),
                      ),
                    ),
                    Flexible( // 🎯 Flexible 2
                      flex: 1,
                      child: Container(
                        color: Colors.blue[300],
                        padding: const EdgeInsets.all(8),
                        child: const Center(child: Text('Texte')),
                      ),
                    ),
                  ],
                ),
              ),
// ... (suite du code)
```

-----

### 🔍 I - Investigate (Investigation)

#### ❓ Quelle est la différence visuelle entre les 2 exemples ?

Dans ce cas précis, les deux exemples **apparaissent visuellement identiques** (les deux containers Rouge et Bleu ont la même largeur, 50% de l'espace disponible).

**Pourquoi ?**

  * **`Expanded`** (qui est un type de `Flexible` avec `fit: FlexFit.tight` par défaut) **force** l'enfant à occuper tout l'espace restant dans l'axe principal (horizontal pour une `Row`). Avec `flex: 1` et `flex: 1`, ils se partagent l'espace restant en deux parts égales.
  * **`Flexible`** (par défaut avec `fit: FlexFit.loose`) permet à l'enfant d'être plus petit que l'espace disponible, mais le force à ne pas dépasser cet espace. Cependant, dans cet exemple, l'enfant (le `Container` sans largeur spécifiée) n'a pas de largeur intrinsèque, il prend donc **aussi** la largeur disponible, agissant comme `Expanded`.

La véritable différence est mise en lumière dans la section **Modify**.

-----

### ✏️ M - Modify (Modification)

#### Tâche : Dans l'exemple Flexible, changez "Court" en "Texte très long qui dépasse"

En modifiant le texte du premier `Container` de l'exemple **Flexible** :

```dart
// Exemple 2 : Flexible
// ...
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.red[300],
                        padding: const EdgeInsets.all(8), 
                        child: const Center(child: Text('Texte très long qui dépasse')), // 🎯 Changement
                      ),
                    ),
// ...
```

**Observation Clé :**

  * **Expanded (Exemple 1) :** Le texte long aurait été **tronqué** ou aurait fait déborder la `Row` (Erreur de pixel overflow) s'il était trop large, car **`Expanded` prend la place qui lui est donnée (50%)**, même si son contenu ne rentre pas.
  * **Flexible (Exemple 2) :** Le widget **s'adapte** à la taille de son contenu (le texte long), et le deuxième `Flexible` (le bleu) prend **tout l'espace restant**. Le `Flexible` Rouge est plus large que le `Flexible` Bleu, car le texte long lui donne une largeur intrinsèque plus grande que le texte court.

> **Conclusion :** **`Expanded` force** l'enfant à remplir l'espace ; **`Flexible` permet** à l'enfant de prendre seulement l'espace dont il a besoin (loose fit) *dans la limite de la part qui lui est allouée par le `flex`*.

-----

### 🛠️ M - Make (Création)

#### Tâche : Ajoutez un 3e exemple avec un mix Expanded + Flexible

Objectif : Montrer la différence de contrainte lorsque les deux types sont combinés.

```dart
// ... (après l'exemple 2)
              const SizedBox(height: 24),
              
              const Text('Exemple 3 : Expanded (1) + Flexible (1)', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              
              Container(
                height: 60,
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    // Expanded : Force à prendre 50% de l'espace flexible
                    Expanded( // 🎯 Expanded (flex: 1)
                      flex: 1,
                      child: Container(
                        color: Colors.orange[300],
                        child: const Center(child: Text('Ex 3. E')),
                      ),
                    ),
                    // Flexible : Prend juste ce dont il a besoin (ici, la taille du texte)
                    Flexible( // 🎯 Flexible (flex: 1)
                      flex: 1, 
                      child: Container(
                        color: Colors.green[300],
                        padding: const EdgeInsets.all(8),
                        child: const Center(child: Text('Petit')), 
                      ),
                    ),
                  ],
                ),
              ),
// ... (fin du code)
```

**Résultat du Mix (Flex 1, Flex 1) :**

  * Le container **Flexible (Vert)** prend une largeur minimale (juste assez pour le texte "Petit").
  * Le container **Expanded (Orange)** prend **tout l'espace restant** (beaucoup plus que 50%), car `Flexible` n'a pas utilisé la part qui lui était allouée.

Ceci illustre bien la différence de contrainte : `Expanded` est gourmand en espace, `Flexible` est économe.