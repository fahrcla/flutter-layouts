# Module 3.5


#### 📝 Exercice 3 : GridView.extent Responsive 



**Énoncé** :

Créez une **galerie photos responsive** qui s'adapte à la taille de l'écran.

**Spécifications** :

1. **GridView.extent** :
   - `maxCrossAxisExtent: 150` (largeur max cellule)
   - Nombre de colonnes adapte automatiquement :
     - Mobile (360px) → ~2 colonnes
     - Tablet (768px) → ~5 colonnes
     - Desktop (1200px) → ~8 colonnes

2. **Chaque cellule** :
   - Card avec elevation 4
   - Container avec :
     - Couleur de fond aléatoire ou dégradé
     - Icon(Icons.image, size: 48)
     - Text("Photo $index") en bas

3. **Total** : Au moins 50 photos

**Widgets autorisés** :
- GridView.extent ou GridView.builder avec SliverGridDelegateWithMaxCrossAxisExtent
- Card
- Container, Icon, Text
- Stack/Positioned (optionnel pour texte overlay)

**💡 Indices** :
```
Indice 1 : maxCrossAxisExtent définit taille MAX, pas nombre colonnes
Indice 2 : Nombre colonnes = largeur écran / maxCrossAxisExtent
Indice 3 : Pour tester, changez taille fenêtre émulateur
Indice 4 : Stack pour superposer texte sur image
```
