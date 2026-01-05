# Module 3.4
## 📝 Exercice 1 : ListView 10 Items 

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
          title: const Text('Ma Liste de Tâches'),
          backgroundColor: Colors.teal[600],
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            // ===== TÂCHE 1 =====
            ListTile(
              leading: const Icon(Icons.check_circle, color: Colors.green),
              title: const Text('Terminer le Module 3'),
              subtitle: const Text('Flutter Layouts'),
              trailing: const Text('2h'),
            ),
            const Divider(),
            
            // ===== TÂCHE 2 =====
            ListTile(
              leading: const Icon(Icons.check_circle, color: Colors.green),
              title: const Text('Réviser C#'),
              subtitle: const Text('LINQ et Async'),
              trailing: const Text('1h'),
            ),
            const Divider(),
            
            // ===== TÂCHE 3 =====
            ListTile(
              leading: const Icon(Icons.radio_button_unchecked, color: Colors.grey),
              title: const Text('Projet Git'),
              subtitle: const Text('Créer repo'),
              trailing: const Text('30min'),
            ),
            const Divider(),
            
            // Ajoutez plus de tâches (copier-coller)...
          ],
        ),
      ),
    );
  }
}
```

**🔮 P - Predict** : Combien de tâches seront affichées ? La liste est-elle scrollable ?

**▶️ R - Run** : Exécutez et scrollez

**🔍 I - Investigate** :
1. Pourquoi `ListView` crée automatiquement le scroll ?
2. Que fait `Divider()` ?
3. Comment changer l'icône selon état (fait/à faire) ?

**✏️ M - Modify** :
- Ajoutez 3 nouvelles tâches
- Changez les couleurs d'icône
- Changez le titre de l'AppBar

**🛠️ M - Make** :
Créez une liste de 5 contacts (nom, téléphone, email) avec `Icons.person`