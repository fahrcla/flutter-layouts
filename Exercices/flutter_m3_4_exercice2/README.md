# Module 3.4

## 📝 Exercice 2 : ListView.builder 100 Items (PRIMM - Palier 2) - 12 min


**Structure fournie** :

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ListView.builder')),
        body: ListView.builder(
          // TODO 1 : Définir itemCount à 100
          itemCount: /* COMPLÉTEZ */,
          itemBuilder: (BuildContext context, int index) {
            // TODO 3 : Créer une Card contenant un ListTile
            // - leading : CircleAvatar avec couleur selon pair ou impair
            // - title : "Élément ${index + 1}"
            // - subtitle : "Description $index"
            // - trailing : Icon(Icons.arrow_forward_ios)
            
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: /* TODO : Couleur selon pair/impair */,
                  child: Text('${index + 1}'),
                ),
                title: Text(/* TODO : Titre */),
                subtitle: Text(/* TODO : Sous-titre */),
                trailing: /* TODO : Icône */,
              ),
            );
          },
        ),
      ),
    );
  }
}
```

**💡 Indices** :
```
Indice 1 : itemCount définit le nombre total d'éléments
Indice 2 : Couleur pair/impair : index % 2 == 0 ? Colors.blue : Colors.green
Indice 3 : index commence à 0, donc afficher (index + 1) pour utilisateur
Indice 4 : Card avec elevation pour effet visuel
```

**🔮 P - Predict** : Combien de ListTile seront créés en mémoire ?

**▶️ R - Run** : Complétez et exécutez

**🔍 I - Investigate** : Ouvrez DevTools → Performance. Scrollez rapidement. Combien de widgets ?

**✏️ M - Modify** : Changez itemCount à 1000. Performance change ?

**🛠️ M - Make** : Ajoutez un onTap qui affiche un SnackBar avec le numéro

