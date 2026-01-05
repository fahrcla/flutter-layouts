# flutter_layouts_m3_3_ex3
### 🧐 Analyse et Points Clés

#### 1\. Remplissage du Stack (`Positioned.fill`)

Pour que l'image de fond et le dégradé couvrent exactement toute la zone $300 \times 300$ du `Stack` parent, nous utilisons **`Positioned.fill()`**. Ceci est un raccourci équivalent à `Positioned(top: 0, bottom: 0, left: 0, right: 0)`.

#### 2\. Le Dégradé (`LinearGradient`)

Le dégradé est la clé de la lisibilité :

  * **`begin: Alignment.topCenter`** et **`end: Alignment.bottomCenter`** définissent la direction : de haut en bas.
  * **`Colors.transparent`** en haut garantit que l'image est visible sans obstruction.
  * **`Colors.black.withOpacity(0.7)`** en bas assombrit le fond, créant un contraste parfait pour le texte blanc.
  * **`stops: const [0.5, 1.0]`** (Ajout optionnel pour un meilleur contrôle) : Force le dégradé à ne commencer qu'à la moitié (50%) de la hauteur du `Container` et à atteindre son opacité maximale à $100\%$.

#### 3\. Positionnement du Texte

Le texte est positionné de manière absolue dans le `Stack` par :

$$\text{Positioned(bottom: 16, left: 16, child: Column(...))}$$

Le `Column` est nécessaire pour empiler le titre et le prix. En utilisant **`crossAxisAlignment: CrossAxisAlignment.start`** dans cette `Column`, nous assurons que les deux lignes de texte restent alignées sur la gauche, même si le `Column` lui-même n'a pas de largeur fixe.