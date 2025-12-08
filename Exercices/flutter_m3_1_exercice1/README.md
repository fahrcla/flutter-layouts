
#### 📝 Exercice 1 : Lecture Annotée 



```dart
import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Row Annotée')),
        body: Center(
          child: Row(
            // 1️⃣ MAINAXISALIGNMENT : Contrôle l'espacement HORIZONTAL
            // spaceBetween = espaces ÉGAUX entre les éléments
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            // 2️⃣ CROSSAXISALIGNMENT : Contrôle l'alignement VERTICAL
            // center = tous les enfants centrés verticalement
            crossAxisAlignment: CrossAxisAlignment.center,
            
            // 3️⃣ CHILDREN : Liste des widgets à organiser
            children: [
              // Container ROUGE à gauche
              Container(
                width: 80,
                height: 80,
                color: Colors.red,
                child: const Center(child: Text('A')),
              ),
              
              // Container VERT au centre (grâce à spaceBetween)
              Container(
                width: 80,
                height: 80,
                color: Colors.green,
                child: const Center(child: Text('B')),
              ),
              
              // Container BLEU à droite
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
                child: const Center(child: Text('C')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

**🔮 P - Predict** :  
Sans exécuter le code, dessinez sur papier le résultat attendu. Où seront les containers A, B, C ?

**▶️ R - Run** :  
Exécutez le code. Comparez avec votre prédiction.  
✓ Correct ? Pourquoi ?  
✗ Erreur ? Quelle différence ?

**🔍 I - Investigate** :  
Répondez :
1. Pourquoi les containers sont espacés ainsi ?  
   💡 Indice : Regardez mainAxisAlignment
2. Que signifie "spaceBetween" concrètement ?
3. Si la Row était plus large, que se passerait-il ?

**✏️ M - Modify** :  
Changez mainAxisAlignment de `spaceBetween` à :
1. `center` → Observez le changement
2. `start` → Observez le changement
3. `spaceEvenly` → Observez le changement

Quelle est la différence entre spaceBetween et spaceEvenly ?

**🛠️ M - Make** :  
Créez VOTRE Row avec :
- 4 Containers (couleurs au choix)
- mainAxisAlignment: MainAxisAlignment.spaceAround
- crossAxisAlignment: CrossAxisAlignment.start

---
