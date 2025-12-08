
## ✅ Corrigé de l'Exercice 2 : Row 3 Containers 

Cet exercice se concentre sur l'application des propriétés de la **Row** (`mainAxisAlignment`) et l'exploration des propriétés de style des **Container** (via `BoxDecoration`).

-----

### 🔮 P - Predict (Prédiction)

#### Résultat Attendu

  * **Widget Principal :** Un `Scaffold` avec une barre d'application (`AppBar`).
  * **Contenu :** Le corps contient un `Center` et un `Padding` (16.0) autour d'une **Row**.
  * **Disposition Horizontale :** `mainAxisAlignment: MainAxisAlignment.spaceEvenly` va disposer les **3 Containers (1, 2, 3)** horizontalement. L'espace sera réparti **également** entre les enfants, ainsi qu'**avant** le Container 1 et **après** le Container 3.
  * **Style des Containers :** Chaque container est de taille **100x100**, de couleur spécifique (`red[400]`, `green[400]`, `blue[400]`) et possède des **coins arrondis** (`borderRadius: BorderRadius.circular(12)`).

-----

### ▶️ R - Run (Exécution)

L'exécution confirme que les trois containers carrés sont espacés uniformément sur la largeur de l'écran (avec un espace de 16px sur les bords grâce au `Padding`), et ils ont des coins joliment arrondis.

-----

### 🔍 I - Investigate (Investigation)

#### 1\. Pourquoi `borderRadius` crée des coins arrondis ?

Le widget `Container` ne possède pas directement de propriété `borderRadius`. Pour styliser les bords d'un `Container`, on utilise un **`BoxDecoration`** dans la propriété `decoration`.

  * La propriété **`borderRadius`** prend un objet `BorderRadius` (ici `BorderRadius.circular(12)`), qui applique une courbe de rayon **12 pixels** aux quatre coins du container, créant un effet arrondi.

#### 2\. Que fait `BoxDecoration` ?

**`BoxDecoration`** est une classe de Flutter utilisée pour peindre derrière un `Widget`. Elle permet de définir l'apparence visuelle d'une boîte, y compris :

  * La **couleur** (`color`).
  * Les **bordures** et les coins arrondis (`borderRadius`, `border`).
  * Les **ombres portées** (`boxShadow`).
  * Les **images** ou les **dégradés** en arrière-plan (`image`, `gradient`).

#### 3\. Quelle différence avec `color:` directement dans Container ?

Il y a une différence fondamentale dans la façon dont Flutter gère le rendu :

| Propriété | Emplacement | Usage Recommandé |
| :--- | :--- | :--- |
| **`color:`** | Directement dans `Container` | Pour les couleurs **simples**, sans autres décorations (bordures, ombres, etc.). |
| **`decoration: BoxDecoration(color: ...)`** | Dans l'objet `BoxDecoration` | **Obligatoire** si vous utilisez d'autres propriétés de décoration (comme `borderRadius`, `boxShadow`, `gradient`). |

> ⚠️ **Note importante :** On ne peut **JAMAIS** utiliser `color:` et `decoration:` **simultanément** dans le même `Container`. Si `decoration` est présent, la couleur doit être définie **à l'intérieur** du `BoxDecoration`.

-----

### ✏️ M - Modify (Modification)

#### Tâche 1 : Couleurs

Changement des couleurs dans le `BoxDecoration` de chaque `Container`:

```dart
// Container 1
decoration: BoxDecoration(color: Colors.orange[400], borderRadius: BorderRadius.circular(12)),
// Container 2
decoration: BoxDecoration(color: Colors.purple[400], borderRadius: BorderRadius.circular(12)),
// Container 3
decoration: BoxDecoration(color: Colors.cyan[400], borderRadius: BorderRadius.circular(12)),
```

#### Tâche 2 : `borderRadius` à 0

  * Changement dans tous les `BoxDecoration`: `borderRadius: BorderRadius.circular(0)`.
  * **Observation :** Les coins arrondis **disparaissent**. Les containers redeviennent des **carrés parfaits** avec des angles à 90 degrés.

#### Tâche 3 : `mainAxisAlignment` à `spaceBetween`

  * Changement dans la `Row` : `mainAxisAlignment: MainAxisAlignment.spaceBetween`.
  * **Observation :** Les containers 1 et 3 se déplacent pour être **collés aux bords intérieurs** du `Padding` de 16px. Le Container 2 reste centré entre les deux. L'espace **avant 1** et **après 3** disparaît (sauf le `Padding` externe).

-----

### 🛠️ M - Make (Création)

#### Code Attendu

```dart
// ...
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                // 🎯 Alignement : center
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 1️⃣ ROUGE
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.all(4), // Optionnel: ajoute un petit espace entre les enfants
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16), // 🎯 Coins arrondis: 16
                    ),
                  ),
                  
                  // 2️⃣ JAUNE
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  
                  // 3️⃣ VERT
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  
                  // 4️⃣ BLEU
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
// ...
```
---