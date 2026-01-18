# Module 3.5


#### 📝 Exercice 1 : GridView.count 2×3 


**Code fourni** :

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ma Grille 2×3'),
          backgroundColor: Colors.indigo[600],
        ),
        body: GridView.count(
          // Nombre de colonnes
          crossAxisCount: 2,
          
          // Espacement
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          padding: const EdgeInsets.all(16.0),
          
          // Éléments
          children: [
            _buildCard('Photos', Icons.photo, Colors.blue),
            _buildCard('Vidéos', Icons.videocam, Colors.red),
            _buildCard('Musique', Icons.music_note, Colors.purple),
            _buildCard('Documents', Icons.description, Colors.green),
            _buildCard('Téléchargements', Icons.download, Colors.orange),
            _buildCard('Favoris', Icons.favorite, Colors.pink),
          ],
        ),
      ),
    );
  }
  
  // Méthode helper pour créer une carte
  Widget _buildCard(String titre, IconData icone, Color couleur) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [couleur.withOpacity(0.7), couleur],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icone, size: 48, color: Colors.white),
            const SizedBox(height: 12),
            Text(
              titre,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

**🔮 P - Predict** : Dessinez la grille (2 colonnes, 3 lignes)

**▶️ R - Run** : Exécutez et observez

**🔍 I - Investigate** :
1. Pourquoi `crossAxisCount: 2` donne 2 colonnes ?
2. Que fait `LinearGradient` ?
3. Pourquoi utiliser une méthode `_buildCard` ?

**✏️ M - Modify** :
- Changez `crossAxisCount` à 3 → 3 colonnes
- Ajoutez un 7e et 8e élément
- Changez les couleurs

**🛠️ M - Make** :
Créez une grille 4×2 (4 colonnes) avec 8 applications (Gmail, Maps, Calendar, etc.)

---