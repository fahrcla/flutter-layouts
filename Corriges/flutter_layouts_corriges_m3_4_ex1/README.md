# Module 3.4
## Corrigé exercice 1

### 🔮 Réponses PRIMM

#### **P - Predict** :
- **Nombre de tâches affichées** : 10 tâches seront affichées
- **Liste scrollable** : OUI, car `ListView` rend automatiquement son contenu scrollable si le contenu dépasse la hauteur de l'écran

#### **I - Investigate** :

**1. Pourquoi `ListView` crée automatiquement le scroll ?**
```
ListView hérite de ScrollView. Il encapsule automatiquement son 
contenu dans un Scrollable widget qui gère :
- Le scroll vertical (par défaut)
- Le défilement avec inertie
- Le rebond (bounce effect sur iOS/Android)
```

**2. Que fait `Divider()` ?**
```
Divider() crée une ligne horizontale fine (1px) grise qui sépare 
visuellement les éléments. C'est un widget Material Design standard.

Propriétés personnalisables :
- color : Couleur de la ligne
- thickness : Épaisseur
- indent/endIndent : Marges gauche/droite
```

**3. Comment changer l'icône selon état ?**
```dart
// Méthode 1 : Conditionnel simple
Icon(
  estTermine ? Icons.check_circle : Icons.radio_button_unchecked,
  color: estTermine ? Colors.green : Colors.grey,
)

// Méthode 2 : Avec variable booléenne
final bool estFait = true;
leading: Icon(
  estFait ? Icons.check_circle : Icons.circle_outlined,
  color: estFait ? Colors.green : Colors.grey[400],
),
```

---

### ✏️ **M - Modify** : Solutions

#### **1. Ajout de 3 nouvelles tâches**
```dart
// TÂCHE 11
ListTile(
  leading: const Icon(Icons.radio_button_unchecked, color: Colors.orange),
  title: const Text('Étudier Firebase'),
  subtitle: const Text('Cloud Firestore'),
  trailing: const Text('2h30'),
),
const Divider(),

// TÂCHE 12
ListTile(
  leading: const Icon(Icons.check_circle, color: Colors.blue),
  title: const Text('Maquette UI/UX'),
  subtitle: const Text('Figma Design'),
  trailing: const Text('1h'),
),
const Divider(),

// TÂCHE 13
ListTile(
  leading: const Icon(Icons.radio_button_unchecked, color: Colors.purple),
  title: const Text('Formation Dart avancé'),
  subtitle: const Text('Extensions et Mixins'),
  trailing: const Text('3h'),
),
```

#### **2. Changement des couleurs d'icônes**
```dart
// Palette de couleurs variée
Colors.green    // Terminé
Colors.orange   // En cours
Colors.red      // Urgent
Colors.blue     // Normal
Colors.purple   // Optionnel
Colors.grey     // Non commencé
```

#### **3. Changement titre AppBar**
```dart
appBar: AppBar(
  title: const Text('🎯 Mes Objectifs du Jour'),
  backgroundColor: Colors.deepPurple[700],
  centerTitle: true,
),
```

---

### 🛠️ **M - Make** : Liste de 5 Contacts

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
          title: const Text('📞 Mes Contacts'),
          backgroundColor: Colors.indigo[700],
        ),
        body: ListView(
          padding: const EdgeInsets.all(12.0),
          children: [
            // CONTACT 1
            Card(
              elevation: 2,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: const Text('Jean Dupont', 
                  style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('📱 +41 79 123 45 67\n✉️ jean.dupont@email.ch'),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.phone, color: Colors.green),
                  onPressed: () {
                    // Action appel
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            
            // CONTACT 2
            Card(
              elevation: 2,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: const Text('Marie Martin', 
                  style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('📱 +41 78 987 65 43\n✉️ marie.martin@email.ch'),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.phone, color: Colors.green),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 8),
            
            // CONTACT 3
            Card(
              elevation: 2,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: const Text('Pierre Bernard', 
                  style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('📱 +41 76 234 56 78\n✉️ pierre.bernard@email.ch'),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.phone, color: Colors.green),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 8),
            
            // CONTACT 4
            Card(
              elevation: 2,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: const Text('Sophie Lemoine', 
                  style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('📱 +41 77 345 67 89\n✉️ sophie.lemoine@email.ch'),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.phone, color: Colors.green),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 8),
            
            // CONTACT 5
            Card(
              elevation: 2,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: const Text('Thomas Petit', 
                  style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('📱 +41 79 456 78 90\n✉️ thomas.petit@email.ch'),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.phone, color: Colors.green),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

