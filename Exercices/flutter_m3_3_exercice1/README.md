
# 📝 Module 3.3. Exercice 1 : Stack Image + Badge 



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
        appBar: AppBar(title: const Text('Stack + Badge')),
        body: Center(
          child: Container(
            width: 250,
            height: 250,
            child: Stack(
              children: [
                // ===== 1. IMAGE DE FOND =====
                Container(
                  decoration: BoxDecoration(
                    color: Colors.purple[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.photo,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
                
                // ===== 2. BADGE "PROMO" (coin sup. droit) =====
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Text(
                      'PROMO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
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

**🔮 P - Predict** : Dessinez où sera le badge "PROMO"

**▶️ R - Run** : Exécutez et vérifiez

**🔍 I - Investigate** :
1. Pourquoi le badge est-il dans le coin supérieur droit ?
2. Que fait `boxShadow` ?
3. Si vous changez `top: 12` en `bottom: 12`, que se passe-t-il ?

**✏️ M - Modify** :
- Déplacez le badge dans le coin inférieur gauche (bottom, left)
- Changez la couleur en rouge
- Changez le texte en "NEW"

**🛠️ M - Make** :
Ajoutez un 2e badge "★ 4.5" dans le coin inférieur droit
