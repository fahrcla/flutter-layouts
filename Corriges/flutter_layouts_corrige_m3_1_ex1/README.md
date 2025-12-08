# Module 3.1
## ✅ Corrigé de l'Exercice 1 : 


-----

### 🔮 P - Predict (Prédiction)

#### Résultat Attendu

Le widget `Row` dispose ses enfants **horizontalement**. Le widget `Center` dans le `body` s'assure que la `Row` prend toute la largeur et la hauteur disponibles au centre de l'écran.

1.  **Alignment Horizontal (Main Axis):** `mainAxisAlignment: MainAxisAlignment.spaceBetween` va placer le **Container A** à l'extrême **gauche**, le **Container C** à l'extrême **droite**, et le **Container B** sera centré **exactement entre** A et C (il y aura le même espace vide entre A et B qu'entre B et C).
2.  **Alignment Vertical (Cross Axis):** `crossAxisAlignment: CrossAxisAlignment.center` va centrer tous les containers verticalement au milieu de la hauteur disponible pour la `Row`.

-----

### ▶️ R - Run (Exécution)

L'exécution confirme la prédiction :

  * Les trois containers (A, B, C) sont alignés horizontalement.
  * Ils sont espacés de manière à ce que les espaces entre A et B, et entre B et C soient identiques.
  * Ils sont centrés verticalement.

-----

### 🔍 I - Investigate (Investigation)

#### 1\. Pourquoi les containers sont espacés ainsi ?

Les containers sont espacés ainsi à cause de la propriété :
$$\text{mainAxisAlignment: MainAxisAlignment.spaceBetween}$$

  * Pour une **Row**, la **Main Axis** est l'**horizontale** (la direction dans laquelle les enfants sont disposés).
  * Cette propriété contrôle donc l'espacement entre les enfants sur l'axe horizontal.

#### 2\. Que signifie "spaceBetween" concrètement ?

**`MainAxisAlignment.spaceBetween`** signifie que :

  * Le **premier enfant** est placé à l'**extrémité de début** (à gauche).
  * Le **dernier enfant** est placé à l'**extrémité de fin** (à droite).
  * L'espace restant est réparti **également** entre les enfants.
  * Il n'y a **pas d'espace** avant le premier ou après le dernier enfant.

#### 3\. Si la Row était plus large, que se passerait-il ?

Si la `Row` était plus large (par exemple, si on lui donnait une contrainte de largeur plus grande que l'écran), l'**espace vide entre les containers A, B et C augmenterait**, car :

  * Les containers A et C resteraient aux extrémités.
  * `spaceBetween` répartirait le nouvel espace plus grand, **également** entre A/B et B/C.
  * La taille des containers eux-mêmes (**80x80**) ne changerait pas.

-----

### ✏️ M - Modify (Modification)

| `mainAxisAlignment` | Observation du changement |
| :--- | :--- |
| **`center`** | Les trois containers sont regroupés au **centre horizontal** de la `Row`. L'espace vide est réparti également à gauche et à droite du groupe. |
| **`start`** | Les trois containers sont regroupés à l'**extrême gauche** de la `Row**. Tout l'espace vide se trouve à droite du groupe. | | **`spaceEvenly\`\*\* | Les trois containers sont disposés de manière à ce que l'espace vide soit **également réparti** **entre** les enfants, **avant** le premier enfant (A) et **après** le dernier enfant (C). |

#### Différence entre `spaceBetween` et `spaceEvenly`

  * **`spaceBetween`** : Garantit que les enfants aux extrémités (A et C) sont **collés aux bords** de la `Row`. L'espace est **uniquement** entre les enfants.
  * **`spaceEvenly`** : Ajoute un espace **avant** le premier enfant et **après** le dernier enfant. Tous les espaces (avant A, entre A/B, entre B/C, après C) sont de **taille égale**.

-----
