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

---

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
