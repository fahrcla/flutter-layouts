
#### 📝 Exercice 3 : Column avec Textes 



```dart
import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Ma Column')),
        body: Center(
          child: Column(
            // TODO 1 : Choisir un mainAxisAlignment
            // Options : start, center, end, spaceBetween, spaceAround, spaceEvenly
            mainAxisAlignment: MainAxisAlignment./* COMPLÉTEZ ICI */,
            
            // TODO 2 : Choisir un crossAxisAlignment
            // Options : start, center, end, stretch
            crossAxisAlignment: CrossAxisAlignment./* COMPLÉTEZ ICI */,
            
            children: [
              // TODO 3 : Créer un Text avec "Titre Principal"
              // Utilisez fontSize: 28, fontWeight: FontWeight.bold
              const Text(
                /* COMPLÉTEZ LE TEXTE */,
                style: TextStyle(
                  /* COMPLÉTEZ LE STYLE */
                ),
              ),
              
              const SizedBox(height: 16), // Espacement vertical
              
              // TODO 4 : Créer un Text avec "Sous-titre descriptif"
              // Utilisez fontSize: 18, color: Colors.grey[600]
              Text(
                /* COMPLÉTEZ */,
                style: TextStyle(
                  /* COMPLÉTEZ */
                ),
              ),
              
              const SizedBox(height: 24),
              
              // TODO 5 : Créer un ElevatedButton avec texte "Action"
              ElevatedButton(
                onPressed: () {
                  print('Bouton cliqué !');
                },
                child: const Text(/* COMPLÉTEZ */),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

**💡 Indices fournis** :
- Indice 1 : Pour centrer verticalement, utilisez `mainAxisAlignment: MainAxisAlignment.center`
- Indice 2 : Pour aligner à gauche, utilisez `crossAxisAlignment: CrossAxisAlignment.start`
- Indice 3 : N'oubliez pas `const` pour les widgets immuables (performance !)

**🔮 P - Predict** : Avant de compléter, dessinez la structure attendue

**▶️ R - Run** : Complétez et exécutez

**🔍 I - Investigate** : Pourquoi utilise-t-on SizedBox pour l'espacement ?

**✏️ M - Modify** : Changez crossAxisAlignment à `center` puis `end`

**🛠️ M - Make** : Ajoutez un 4e élément (Icon) sous le bouton
