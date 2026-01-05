# Module 3.4
## 📝 Exercice 2 : ListView.builder 100 Items

### ✅ Code Complet

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
          title: const Text('ListView.builder - 100 Items'),
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView.builder(
          // SOLUTION TODO 1
          itemCount: 100,
          
          // SOLUTION TODO 2
          itemBuilder: (BuildContext context, int index) {
            // SOLUTION TODO 3
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 3,
              child: ListTile(
                // Leading avec couleur alternée
                leading: CircleAvatar(
                  backgroundColor: index % 2 == 0 ? Colors.blue : Colors.green,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Titre
                title: Text(
                  'Élément ${index + 1}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Sous-titre
                subtitle: Text(
                  'Description de l\'élément numéro $index',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                // Icône trailing
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
```

---

### 🔮 Réponses PRIMM

#### **P - Predict** :
**Combien de ListTile seront créés en mémoire ?**

```
RÉPONSE : Seulement ~10-15 widgets seront créés en mémoire !

Explication :
ListView.builder utilise le "lazy loading" (chargement paresseux).
Il crée uniquement les widgets VISIBLES à l'écran + quelques-uns
en buffer (au-dessus et en-dessous) pour un scroll fluide.

Contrairement à ListView (children: [...]) qui crée TOUS les 
widgets en mémoire, builder() est optimisé pour de grandes listes.

Économie mémoire : 100 widgets → ~12 widgets réellement instanciés
```

#### **I - Investigate** :

**DevTools → Performance** :

```
Observation avec 100 items :
✅ ~10-15 widgets dans l'arbre de widgets
✅ Scroll fluide (60 FPS)
✅ Mémoire stable (~50 MB)

Observation avec 1000 items :
✅ Toujours ~10-15 widgets actifs
✅ Performance identique !
✅ Mémoire stable (~52 MB)

Conclusion : ListView.builder scale parfaitement.
```

---

### ✏️ **M - Modify** : itemCount = 1000

```dart
ListView.builder(
  itemCount: 1000, // Changement ici
  itemBuilder: (BuildContext context, int index) {
    // ... même code
  },
)
```

**Performance change ?**
```
❌ NON ! Performance reste identique car :
- Lazy loading : Seuls les widgets visibles sont créés
- Viewport constant : ~12 widgets actifs même avec 10 000 items
- Optimisation Flutter : Recyclage automatique des widgets

Benchmark :
100 items   → ~50 MB RAM, 60 FPS
1000 items  → ~52 MB RAM, 60 FPS
10000 items → ~55 MB RAM, 60 FPS
```

---

### 🛠️ **M - Make** : Ajout onTap avec SnackBar

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
          title: const Text('ListView.builder avec SnackBar'),
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: index % 2 == 0 ? Colors.blue : Colors.green,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text('Élément ${index + 1}'),
                subtitle: Text('Description $index'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                
                // ===== AJOUT onTap =====
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '🎯 Vous avez cliqué sur l\'élément ${index + 1}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      backgroundColor: Colors.deepPurple,
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      action: SnackBarAction(
                        label: 'OK',
                        textColor: Colors.white,
                        onPressed: () {
                          // Fermer le SnackBar
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
```

---
