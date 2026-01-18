# Corrigé Ex1 M3.5

### 🔮 P - Predict (Prédiction)

Le code va générer une grille composée de **2 colonnes**. Comme il y a 6 éléments dans la liste `children`, Flutter va automatiquement créer **3 lignes** pour tout afficher.

* Chaque case sera un rectangle arrondi avec un dégradé de couleur.
* Il y aura un espace vide de 16 pixels entre chaque carte.

---

### 🔍 I - Investigate (Analyse)

1. **Pourquoi `crossAxisCount: 2` donne 2 colonnes ?**
Dans un défilement vertical (le défaut), l'axe principal (**Main Axis**) est vertical. L'axe transverse (**Cross Axis**) est donc l'axe horizontal. Fixer le "count" sur l'axe transverse à 2 force Flutter à diviser la largeur disponible en 2 parts égales.
2. **Que fait `LinearGradient` ?**
Il permet de créer une transition fluide entre deux ou plusieurs couleurs. Ici, il mélange une version claire de la couleur (`withOpacity(0.7)`) en haut à gauche vers la couleur pleine en bas à droite, ce qui donne du relief et un aspect moderne à la carte.
3. **Pourquoi utiliser une méthode `_buildCard` ?**
Cela évite de répéter 6 fois le même code complexe (Container, Decoration, Column, etc.). 

---

### ✏️ M - Modify (Modifications)

* **Pour 3 colonnes** : Change `crossAxisCount: 2` par `3`.
* **Pour 8 éléments** : Ajoute simplement deux appels à `_buildCard` à la fin de la liste `children`.

---

### 🛠️ M - Make (Le défi final)


```dart
// Dans le body du Scaffold :
GridView.count(
  crossAxisCount: 4, // 4 colonnes
  mainAxisSpacing: 10.0,
  crossAxisSpacing: 10.0,
  padding: const EdgeInsets.all(10.0),
  // On réduit la hauteur des cases pour qu'elles restent lisibles
  childAspectRatio: 0.8, 
  children: [
    _buildCard('Gmail', Icons.email, Colors.red),
    _buildCard('Maps', Icons.map, Colors.green),
    _buildCard('Calendar', Icons.calendar_today, Colors.blue),
    _buildCard('Drive', Icons.cloud_queue, Colors.amber),
    _buildCard('Keep', Icons.lightbulb_outline, Colors.orange),
    _buildCard('Photos', Icons.collections, Colors.indigo),
    _buildCard('Meet', Icons.video_call, Colors.teal),
    _buildCard('Play', Icons.play_arrow, Colors.blueGrey),
  ],
)

```

