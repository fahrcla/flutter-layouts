
# Module 3.3
## ✅ Corrigé de l'Exercice 1 : Stack Image + Badge 🖼️

Cet exercice introduit le widget **`Stack`**, essentiel pour superposer des widgets les uns sur les autres, et le widget **`Positioned`**, utilisé pour contrôler l'emplacement exact des enfants d'un `Stack`.

-----

### 🔮 P - Predict (Prédiction)

#### Résultat Attendu

1.  Un grand **`Container`** de $250 \times 250$ est centré à l'écran, servant de fond à la pile. Ce container a des coins arrondis et une icône de photo blanche au centre.
2.  Le widget **`Stack`** permet de superposer les éléments.
3.  Le badge **"PROMO"** est enveloppé dans un **`Positioned`** avec :
      * `top: 12` : 12 pixels à partir du bord **supérieur** du `Stack`.
      * `right: 12` : 12 pixels à partir du bord **droit** du `Stack`.

Le badge orange sera donc positionné dans le **coin supérieur droit** du carré de $250 \times 250$ .

-----

### 🔍 I - Investigate (Investigation)

#### 1\. Pourquoi le badge est-il dans le coin supérieur droit ?

Le badge est positionné dans le coin supérieur droit grâce au widget **`Positioned`** et à l'utilisation combinée des propriétés `top` et `right` :

  * **`Positioned`** ne fonctionne que comme enfant d'un `Stack`. Il permet de fixer l'emplacement du widget en utilisant des coordonnées (par exemple, `top`, `bottom`, `left`, `right`).
  * `top: 12` et `right: 12` placent le bord supérieur du badge à 12px du haut et le bord droit du badge à 12px de la droite du `Stack`.

#### 2\. Que fait `boxShadow` ?

La propriété **`boxShadow`**, utilisée dans le `BoxDecoration` du `Container` du badge, ajoute une ou plusieurs **ombres portées** (shadows) autour du widget.

Dans ce code :

  * `color: Colors.black26` : L'ombre est gris foncé, semi-transparente.
  * `blurRadius: 4` : Adoucit les bords de l'ombre (effet flou).
  * `offset: Offset(0, 2)` : Décale l'ombre de 0px horizontalement et de **2px vers le bas** verticalement, donnant l'impression que le badge est légèrement soulevé.

#### 3\. Si vous changez `top: 12` en `bottom: 12`, que se passe-t-il ?

Le badge sera toujours positionné à **12 pixels du bord droit** (grâce à `right: 12`), mais il sera maintenant positionné à **12 pixels du bord inférieur** (grâce à `bottom: 12`).

Le badge se déplacerait du coin **supérieur droit** au coin **inférieur droit**.

-----

### ✏️ M - Modify (Modification)

Pour déplacer le badge dans le coin **inférieur gauche**, le changer en **rouge**, et modifier le texte en **"NEW"** :

```dart
// ===== 2. BADGE "NEW" (coin inf. gauche) =====
Positioned(
  bottom: 12, // Changé de top à bottom
  left: 12, // Changé de right à left
  child: Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 6,
    ),
    decoration: BoxDecoration(
      color: Colors.red, // Changé la couleur en rouge
      borderRadius: BorderRadius.circular(20),
      // ... (boxShadow inchangé)
    ),
    child: const Text(
      'NEW', // Changé le texte
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
```

-----

### 🛠️ M - Make (Création)

#### Ajoutez un 2e badge "★ 4.5" dans le coin inférieur droit

Il suffit d'ajouter un nouvel enfant à la liste `children` du `Stack`, en utilisant un autre widget `Positioned` pour le positionnement dans le coin inférieur droit (`bottom`, `right`).

```dart
// ... (après le premier Positioned)

                // ===== 3. SECOND BADGE "STAR" (coin inf. droit) =====
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.yellow[700], // Couleur pour l'évaluation
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.star, color: Colors.white, size: 14),
                        SizedBox(width: 4),
                        Text(
                          '4.5',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
// ...
```