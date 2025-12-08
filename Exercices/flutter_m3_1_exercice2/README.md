
#### 📝 Exercice 2 : Row 3 Containers 


```dart
import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Mes 3 Containers')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 📦 CONTAINER 1
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                
                // 📦 CONTAINER 2
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                
                // 📦 CONTAINER 3
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

**🔮 P - Predict** : Dessinez le résultat attendu

**▶️ R - Run** : Exécutez et comparez

**🔍 I - Investigate** :
1. Pourquoi `borderRadius` crée des coins arrondis ?
2. Que fait `BoxDecoration` ?
3. Quelle différence avec `color:` directement dans Container ?

**✏️ M - Modify** :
- Tâche 1 : Changez les couleurs (orange, violet, cyan)
- Tâche 2 : Changez borderRadius à 0 → Qu'observez-vous ?
- Tâche 3 : Changez mainAxisAlignment à spaceBetween

**🛠️ M - Make** :
Créez une Row avec 4 Containers :
- Couleurs : Rouge, Jaune, Vert, Bleu
- Tailles : 80×80 chacun
- Alignement : center
- Coins arrondis : 16

---
