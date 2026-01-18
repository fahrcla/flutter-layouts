# Module 3 : Session 2 - Listes et Grilles


## 3.4 : ListView - Listes Scrollables Performantes


### 📚 Le Problème 

Dans les parties précédentes, nous avons utilisé **Column** pour organiser des widgets verticalement :

```dart
Column(
  children: [
    Widget1(),
    Widget2(),
    Widget3(),
    // ... plus de widgets
  ],
)
```

**Problèmes avec Column pour grandes listes** :

1. ❌ **Pas de scroll automatique** → Overflow si trop d'éléments
2. ❌ **Tous les widgets créés immédiatement** → Lenteur (1000+ items)
3. ❌ **Consomme toute la mémoire** → Crash si liste très longue

**Exemple de problème** :
```dart
Column(
  children: List.generate(1000, (i) => ListTile(title: Text('Item $i'))),
) // ⚠️ TOUS les 1000 ListTile créés immédiatement !
```

**Besoin** :
- ✅ Scroll automatique
- ✅ Création "à la demande" (lazy loading)
- ✅ Performance constante 

**Solution** : **ListView** et  **ListView.builder** ! 🎯

---

### 📚 Généralités

#### ListView : La Liste Scrollable

**ListView** est une Column scrollable. Simple, mais puissant !

```dart
ListView(
  children: [
    ListTile(title: Text('Item 1')),
    ListTile(title: Text('Item 2')),
    ListTile(title: Text('Item 3')),
  ],
)
```

**Différence clé avec Column** :

| Aspect | Column | ListView |
|--------|--------|----------|
| **Scroll** | ❌ Non | ✅ Oui (automatique) |
| **Overflow** | ⚠️ Erreur si trop d'éléments | ✅ Pas d'overflow |
| **Performance** | ❌ Tous les widgets créés | ⚠️ Tous créés (ListView simple, pas avec ListView.builder) |
| **Usage recommandé** | ≤5 éléments | ≥5 éléments |

---

#### 📊 Diagramme : ListView vs Column (Scroll)

```
═══════════════════════════════════════════════════════
          Column (PAS scrollable)
═══════════════════════════════════════════════════════

┌────────────┐ ↑ Écran
│ Item 1     │ │
│ Item 2     │ │
│ Item 3     │ │
│ Item 4     │ │
│ Item 5     │ │
│ Item 6 ERRO│ ← OVERFLOW ! ⚠️
└─────ERROR──┘ ↓
  Item 7         ← Pas affiché (erreur)
  Item 8
  ...

═══════════════════════════════════════════════════════
          ListView (scrollable automatique)
═══════════════════════════════════════════════════════

┌────────────┐ ↑ Écran visible
│ Item 1     │ │
│ Item 2     │ │
│ Item 3     │ │ Scroll ↕ automatique
│ Item 4     │ │
│ Item 5     │ │
└────────────┘ ↓
  Item 6         ← Hors écran (accessible en scrollant)
  Item 7
  Item 8
  ... Item 100
  ... Item 1000

💡 Pas d'overflow, scroll infini possible !
```

---

### 📝 Exemple Simple

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ListView Simple')),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Alice'),
              subtitle: const Text('Développeuse'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const Divider(), // Séparateur
            
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Bob'),
              subtitle: const Text('Designer'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const Divider(),
            
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Charlie'),
              subtitle: const Text('Product Manager'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            
            // ... plus d'éléments
          ],
        ),
      ),
    );
  }
}
```

**Résultat** : Liste scrollable de 3 personnes (facile à étendre).

---

### ✅ CHECKPOINT #1

**Question** : Quelle est la différence PRINCIPALE entre ListView et Column ?

**A)** ListView supporte plus d'éléments  
**B)** Column est plus rapide  
**C)** ListView est scrollable, Column ne l'est pas 
**D)** Aucune différence

**Réponse** : C

---

### 📚 ListView.builder : Lazy Loading Intelligent

**Le problème de ListView simple** :

```dart
ListView(
  children: List.generate(1000, (i) => ListTile(...)),
) // ⚠️ Crée les 1000 widgets IMMÉDIATEMENT !
```

**La solution : ListView.builder** (lazy loading)

```dart
ListView.builder(
  itemCount: 1000, // Nombre total d'éléments
  itemBuilder: (context, index) {
    // Cette fonction est appelée SEULEMENT pour les items VISIBLES
    return ListTile(title: Text('Item $index'));
  },
)
```

**Magie** : Crée uniquement les widgets **visibles à l'écran** + un petit buffer d'éléments !

---

#### 📊 Diagramme : Lazy Loading Principe

```
═══════════════════════════════════════════════════════
         LAZY LOADING (ListView.builder)
═══════════════════════════════════════════════════════

itemCount = 10 000 éléments

Écran (visible) :       Mémoire (widgets créés) :
┌─────────────┐         ┌─────────────┐
│ Item 5      │ créé ←  │ Item 4      │ buffer haut
│ Item 6      │ créé ←  │ Item 5      │ ✓ visible
│ Item 7      │ créé ←  │ Item 6      │ ✓ visible
│ Item 8      │ créé ←  │ Item 7      │ ✓ visible
│ Item 9      │ créé ←  │ Item 8      │ ✓ visible
└─────────────┘         │ Item 9      │ ✓ visible
                        │ Item 10     │ buffer bas
                        └─────────────┘

Item 1-4   : ❌ NON créés (hors vue, avant)
Item 10+   : ❌ NON créés (hors vue, après)

💡 Seulement ~10-20 widgets en mémoire, même avec 10 000 items !

Quand l'utilisateur scrolle :
- Widgets hors écran → DÉTRUITS (libère mémoire)
- Nouveaux widgets → CRÉÉS à la demande

Résultat : Performance CONSTANTE 
```

---

### 📝 Exemple : ListView.builder 100 Éléments

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
          title: const Text('ListView.builder 100 Items'),
        ),
        body: ListView.builder(
          // 1️⃣ ITEMCOUNT : Nombre total d'éléments
          itemCount: 100,
          
          // 2️⃣ ITEMBUILDER : Fonction appelée pour chaque item VISIBLE
          // - context : Contexte actuel
          // - index : Position de l'item (0, 1, 2, ..., 99)
          itemBuilder: (BuildContext context, int index) {
            // Cette fonction est appelée SEULEMENT pour items visibles
            return ListTile(
              // Icône différente selon pair/impair
              leading: CircleAvatar(
                backgroundColor: index % 2 == 0 ? Colors.blue : Colors.green,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              
              // Titre
              title: Text(
                'Élément numéro ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              
              // Sous-titre
              subtitle: Text('Description de l\'élément $index'),
              
              // Icône droite
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              
              // Action au tap
              onTap: () {
                print('Cliqué sur item $index');
              },
            );
          },
        ),
      ),
    );
  }
}
```

**Points clés** :
- `itemCount: 100` → Définit le nombre total
- `itemBuilder` → Fonction callback appelée pour chaque item visible
- `index` → Position (0 à 99)
- Performance : Seulement ~10-15 ListTile créés à l'écran

---

### ✅ CHECKPOINT #2

**Question** : Si itemCount = 10 000, combien de widgets sont créés réellement avec ListView.builder ?

**A)** 10 000 (tous)  
**B)** Environ 10-20 (visibles à l'écran)
**C)** 100 (buffer)  
**D)** Dépend de la mémoire

**Réponse** : B

```
Sur un écran de 800px de haut, 1 ListTile = ~70px :

Visibles = 800 / 70 ≈ 11 items

Flutter crée :
- 11 items visibles
- ~4 items buffer haut (anticipation scroll 250px / 70px = 4)
- ~4 items buffer bas (anticipation scroll)
─────────────────────
Total ≈ 19 items créés

Les 9 981 autres items NE SONT PAS CRÉÉS tant qu'ils ne deviennent pas visibles !
```

**Avantage** :
- Performance constante même avec millions d'items
- Faible consommation mémoire
- Scroll fluide


---

### 📚 ItemBuilder : La Fonction Magique

**Signature de itemBuilder** :

```dart
Widget Function(BuildContext context, int index)
```

**Paramètres** :
- `context` : Contexte actuel (accès au thème, navigation, etc.)
- `index` : Position de l'item (commence à 0)

**Retour** :
- `Widget` : Le widget à afficher pour cet index

**Exemple avec données dynamiques** :

```dart
// Données
final List<String> noms = ['Alice', 'Bob', 'Charlie', 'Diana'];

// ListView.builder
ListView.builder(
  itemCount: noms.length, // 4 éléments
  itemBuilder: (context, index) {
    final nom = noms[index]; // Récupère le nom à cet index
    return ListTile(title: Text(nom));
  },
)
```

---

### 🎓 Série d'Exercices

---

#### 📝 Exercice 1 : ListView 10 Items 

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

---

#### 📝 Exercice 2 : ListView.builder 100 Items (PRIMM - Palier 2) - 12 min


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



---

#### 📝 Exercice 3 : Liste E-commerce 



**Énoncé** :

Créez une liste de produits e-commerce avec **données dynamiques**.

**Données fournies** :

```dart
final List<Map<String, dynamic>> produits = [
  {'nom': 'MacBook Pro', 'prix': 2499.00, 'categorie': 'Tech', 'stock': 12},
  {'nom': 'iPhone 15', 'prix': 999.00, 'categorie': 'Tech', 'stock': 45},
  {'nom': 'AirPods Pro', 'prix': 279.00, 'categorie': 'Audio', 'stock': 0},
  {'nom': 'iPad Air', 'prix': 699.00, 'categorie': 'Tech', 'stock': 23},
  {'nom': 'Apple Watch', 'prix': 449.00, 'categorie': 'Tech', 'stock': 8},
  // Ajoutez 10+ produits supplémentaires
];
```

**Spécifications** :

1. **ListView.builder** :
   - itemCount : `produits.length`
   - itemBuilder : Retourne une Card stylée

2. **Card pour chaque produit** :
   - Row principale avec :
     - Leading : Icon selon catégorie (Tech = laptop, Audio = headset)
     - Column centrale avec :
       - Nom du produit (bold, fontSize 18)
       - Catégorie (grey, fontSize 14)
     - Trailing : Column avec :
       - Prix (bold, fontSize 16, couleur thème)
       - Badge stock ("En stock" vert ou "Rupture" rouge)

3. **Logique conditionnelle** :
   - Si stock > 0 : Badge vert "En stock"
   - Si stock == 0 : Badge rouge "Rupture"
   - Couleur icône selon catégorie

**Widgets autorisés** :
- ListView.builder
- Card, ListTile (ou Row/Column personnalisé)
- Icon, Text
- Container (pour badges)

**💡 Indices** :
```
Indice 1 : Accès données : final produit = produits[index];
Indice 2 : Badge avec Container + padding + borderRadius
Indice 3 : Condition : produit['stock'] > 0 ? 'En stock' : 'Rupture'
Indice 4 : Icon catégorie : produit['categorie'] == 'Tech' ? Icons.laptop : Icons.headset
```


---

### 📚 Cas Avancés

#### ListView.separated : Avec Séparateurs

```dart
ListView.separated(
  itemCount: 50,
  itemBuilder: (context, index) {
    return ListTile(title: Text('Item $index'));
  },
  separatorBuilder: (context, index) {
    return const Divider(height: 1); // Séparateur entre chaque item
  },
)
```

**Avantage** : Séparateur automatique entre items (évite code répétitif).

---

#### ListView Horizontal

```dart
ListView.builder(
  scrollDirection: Axis.horizontal, // ← Scroll horizontal
  itemCount: 20,
  itemBuilder: (context, index) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(8),
      color: Colors.blue,
      child: Center(child: Text('$index')),
    );
  },
)
```

**Usage** : Carousels, galeries horizontales.

---

### 🔄 Le nouveau défi

ListView gère des listes **1D** (une seule colonne, scroll vertical). Mais imaginez :
- Une galerie de photos (grille 3×3)
- Un catalogue de produits (2 colonnes)
- Des vignettes d'applications (4×6 grille)

**Besoin** : Afficher des éléments en **grille 2D** (lignes ET colonnes) !

```
ListView (1D) :        GridView (2D) :
┌─────────┐            ┌───┬───┬───┐
│ Item 1  │            │ 1 │ 2 │ 3 │
│ Item 2  │            ├───┼───┼───┤
│ Item 3  │            │ 4 │ 5 │ 6 │
│ Item 4  │            ├───┼───┼───┤
│ ...     │            │ 7 │ 8 │ 9 │
└─────────┘            └───┴───┴───┘
```

**La solution** : **GridView** ! 🎯


---



## Leçon 3.5 : GridView - Grilles 2D Adaptatives

### 📚 Le problème 

**ListView** affiche les éléments en **1 dimension** (une colonne) :

```
┌────────────┐
│ Item 1     │
│ Item 2     │
│ Item 3     │
│ ...        │
└────────────┘
```

**Besoin** : Afficher en **2 dimensions** (grille avec lignes ET colonnes) :

```
┌──┬──┬──┐
│ 1│ 2│ 3│
├──┼──┼──┤
│ 4│ 5│ 6│
├──┼──┼──┤
│ 7│ 8│ 9│
└──┴──┴──┘
```

**Cas d'usage** :
- Galerie photos
- Catalogue produits
- App store (apps)
- Calendrier

**Solution** : **GridView** ! 🎯

---

### 📚 Généralités

#### GridView : La Grille 2D

**GridView** affiche des widgets en grille (tableau 2D) scrollable.

**Types principaux** :

| Type | Description | Usage |
|------|-------------|-------|
| `GridView.count` | Nombre de colonnes **fixe** | Grille uniforme (2, 3, 4 colonnes) |
| `GridView.extent` | Taille maximale **adaptative** | Responsive (adapte nb colonnes) |
| `GridView.builder` | Lazy loading (comme ListView) | Performance (100+ éléments) |

---

#### 📊 Diagramme : GridView 2D Visualisé

```
═══════════════════════════════════════════════════════
      GridView.count (crossAxisCount: 3)
═══════════════════════════════════════════════════════

┌─────────────────────────────────┐
│  Item 1  │  Item 2  │  Item 3  │ ← Ligne 1
├──────────┼──────────┼──────────┤
│  Item 4  │  Item 5  │  Item 6  │ ← Ligne 2
├──────────┼──────────┼──────────┤
│  Item 7  │  Item 8  │  Item 9  │ ← Ligne 3
└─────────────────────────────────┘
     ↑          ↑          ↑
   Col 1      Col 2      Col 3

crossAxisCount = 3 → 3 colonnes fixes

Scroll vertical automatique si plus de lignes.

═══════════════════════════════════════════════════════
      childAspectRatio (forme des cellules)
═══════════════════════════════════════════════════════

childAspectRatio = largeur / hauteur

ratio = 1.0 (CARRÉ) :
┌───┐
│   │ ← 1:1 (largeur = hauteur)
└───┘

ratio = 2.0 (RECTANGLE HORIZONTAL) :
┌──────┐
│      │ ← 2:1 (largeur = 2× hauteur)
└──────┘

ratio = 0.5 (RECTANGLE VERTICAL) :
┌─┐
│ │ ← 1:2 (largeur = 0.5× hauteur)
│ │
└─┘

Par défaut : ratio = 1.0 (carrés)
```



---

### 📝 Exemple Simple : GridView.count 2×3

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('GridView Simple')),
        body: GridView.count(
          // 1️⃣ CROSSAXISCOUNT : Nombre de colonnes
          crossAxisCount: 2, // 2 colonnes
          
          // 2️⃣ SPACING : Espacement entre éléments
          mainAxisSpacing: 12.0,   // Espacement vertical
          crossAxisSpacing: 12.0,  // Espacement horizontal
          
          // 3️⃣ PADDING : Espacement externe
          padding: const EdgeInsets.all(16.0),
          
          // 4️⃣ CHILDREN : Liste des widgets
          children: [
            // Item 1
            Container(
              decoration: BoxDecoration(
                color: Colors.red[300],
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
            
            // Item 2
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('2', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            
            // Item 3
            Container(
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('3', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            
            // Item 4
            Container(
              decoration: BoxDecoration(
                color: Colors.orange[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('4', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            
            // Item 5
            Container(
              decoration: BoxDecoration(
                color: Colors.purple[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('5', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            
            // Item 6
            Container(
              decoration: BoxDecoration(
                color: Colors.teal[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('6', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold))),
            ),
          ],
        ),
      ),
    );
  }
}
```

**Résultat** : Grille 2 colonnes × 3 lignes (6 éléments au total).

---

### ✅ CHECKPOINT #1 

**Question** : Si crossAxisCount = 4, combien de colonnes dans la grille ?

**A)** 3  
**B)** 4   
**C)** 8  
**D)** Dépend de la largeur écran

Réponse: B

**Explication** :
- `crossAxisCount` = nombre de colonnes **FIXE**
- Indépendant de la taille d'écran
- Chaque ligne aura exactement 4 éléments

**Résultat visuel** :
```
crossAxisCount: 4

┌──┬──┬──┬──┐
│ 1│ 2│ 3│ 4│ ← Ligne 1 (4 colonnes)
├──┼──┼──┼──┤
│ 5│ 6│ 7│ 8│ ← Ligne 2
└──┴──┴──┴──┘
```

**Attention** : Sur petit écran (mobile), cellules seront très petites !


---

### 📚 GridView.builder : Performance avec Lazy Loading

Comme ListView.builder, GridView.builder crée les éléments **à la demande** :

```dart
GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3, // 3 colonnes
    mainAxisSpacing: 8.0,
    crossAxisSpacing: 8.0,
  ),
  itemCount: 100, // 100 éléments
  itemBuilder: (context, index) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text('$index')),
    );
  },
)
```

En Flutter, le GridView sait quand afficher des éléments, mais il ne sait pas comment les disposer géométriquement.
Le mot Delegate (délégué) signifie que le GridView délègue (donne la responsabilité) du calcul de la taille et de la position des enfants à un autre objet.

Le rôle spécifique de SliverGridDelegateWithFixedCrossAxisCount :
Ce delegate dit à Flutter : "Je veux un nombre fixe de colonnes, et je veux que tu calcules automatiquement la largeur de chaque cellule pour qu'elles rentrent toutes."
crossAxisCount: 3 : Définit le nombre de colonnes.
mainAxisSpacing : L'espacement vertical entre les lignes.
crossAxisSpacing : L'espacement horizontal entre les colonnes.

**Avantage** : Seulement les cellules visibles sont créées (comme ListView.builder).

---

### 📚 childAspectRatio : Contrôler la Forme

**childAspectRatio** définit le rapport **largeur / hauteur** des cellules.

**Formule** :
```
childAspectRatio = largeur / hauteur
```

**Exemples** :

| Ratio | Forme | Description |
|-------|-------|-------------|
| 1.0 | ◻️ Carré | Largeur = Hauteur |
| 2.0 | ▬ Rectangle horizontal | Largeur = 2× Hauteur |
| 0.5 | ▮ Rectangle vertical | Largeur = 0.5× Hauteur |
| 1.5 | ▭ Légèrement horizontal | Largeur = 1.5× Hauteur |

**Code** :
```dart
GridView.count(
  crossAxisCount: 3,
  childAspectRatio: 2.0, // Rectangles horizontaux
  children: [...],
)
```

---

### ✅ CHECKPOINT #2 

**Question** : Si childAspectRatio = 2.0, quelle est la forme des cellules ?

**A)** Carrés (1:1)  
**B)** Rectangles horizontaux (2× plus larges que hauts)  
**C)** Rectangles verticaux (2× plus hauts que larges)  
**D)** Cercles

Réponse: B

**Calcul** :
```
childAspectRatio = largeur / hauteur

ratio = 2.0
→ largeur = 2 × hauteur

Exemple :
Si hauteur = 100px
→ largeur = 2 × 100 = 200px

┌──────────┐
│          │ ← 100px haut
└──────────┘
  200px large
  
= Rectangle HORIZONTAL (2:1)
```

**Valeurs courantes** :
- **1.0** → Carré (défaut)
- **2.0** → Rectangle horizontal
- **0.5** → Rectangle vertical
- **1.5** → Légèrement horizontal

---

### 📚 GridView.extent : Responsive Adaptatif

**Différence clé** :
- `GridView.count` : Nombre de colonnes **fixe** (ex: toujours 3)
- `GridView.extent` : Taille maximale **adaptative** (adapte nb colonnes)

**Exemple** :

```dart
GridView.extent(
  maxCrossAxisExtent: 150, // Largeur MAX de chaque cellule
  children: [...],
)
```

**Comportement** :
- Petit écran (360px) : 360 / 150 = 2.4 → **2 colonnes**
- Grand écran (768px) : 768 / 150 = 5.1 → **5 colonnes**

**Avantage** : S'adapte automatiquement à la taille de l'écran ! 🎯

---

#### 📊 Diagramme : .count vs .extent

```
═══════════════════════════════════════════════════════
      GridView.count (colonnes FIXES)
═══════════════════════════════════════════════════════

Mobile (360px) :    Tablet (768px) :
┌──┬──┬──┐          ┌──┬──┬──┐
│  │  │  │ 120px    │  │  │  │ 256px ← Trop grand !
└──┴──┴──┘          └──┴──┴──┘
crossAxisCount: 3   crossAxisCount: 3 (fixe)

⚠️ Sur grand écran, cellules deviennent énormes !

═══════════════════════════════════════════════════════
      GridView.extent (taille ADAPTATIVE)
═══════════════════════════════════════════════════════

Mobile (360px) :    Tablet (768px) :
┌──┬──┬──┐          ┌──┬──┬──┬──┬──┐
│  │  │  │ 120px    │  │  │  │  │  │ 150px ← Adapté !
└──┴──┴──┘          └──┴──┴──┴──┴──┘
maxCrossAxisExtent: 150px

Nombre de colonnes adapte automatiquement !
3 colonnes mobile, 5 colonnes tablet
```

---

### 🎓 Série d'Exercices

---

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

#### 📝 Exercice 2 : childAspectRatio Variés 



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
        appBar: AppBar(title: const Text('Aspect Ratios')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Carrés (ratio 1.0) :', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              
              // TODO 1 : Créez GridView.count avec :
              // - crossAxisCount: 3
              // - childAspectRatio: 1.0 (carrés)
              // - height: 150
              // - 6 containers colorés
              SizedBox(
                height: 150,
                child: GridView.count(
                  crossAxisCount: /* TODO */,
                  childAspectRatio: /* TODO */,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    // TODO : 6 containers
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              const Text('Rectangles horizontaux (ratio 2.0) :', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              
              // TODO 2 : Créez GridView.count avec :
              // - crossAxisCount: 2
              // - childAspectRatio: 2.0 (largeur = 2× hauteur)
              // - height: 120
              SizedBox(
                height: 120,
                child: GridView.count(
                  crossAxisCount: /* TODO */,
                  childAspectRatio: /* TODO */,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    // TODO : 4 containers
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

**💡 Indices** :
```
Indice 1 : ratio 1.0 = carrés (largeur = hauteur)
Indice 2 : ratio 2.0 = rectangles (largeur = 2× hauteur)
Indice 3 : Container avec color: et Center(child: Text(...))
```



---

#### 📝 Exercice 3 : GridView.extent Responsive 



**Énoncé** :

Créez une **galerie photos responsive** qui s'adapte à la taille de l'écran.

**Spécifications** :

1. **GridView.extent** :
   - `maxCrossAxisExtent: 150` (largeur max cellule)
   - Nombre de colonnes adapte automatiquement :
     - Mobile (360px) → ~2 colonnes
     - Tablet (768px) → ~5 colonnes
     - Desktop (1200px) → ~8 colonnes

2. **Chaque cellule** :
   - Card avec elevation 4
   - Container avec :
     - Couleur de fond aléatoire ou dégradé
     - Icon(Icons.image, size: 48)
     - Text("Photo $index") en bas

3. **Total** : Au moins 50 photos

**Widgets autorisés** :
- GridView.extent ou GridView.builder avec SliverGridDelegateWithMaxCrossAxisExtent
- Card
- Container, Icon, Text
- Stack/Positioned (optionnel pour texte overlay)

**💡 Indices** :
```
Indice 1 : maxCrossAxisExtent définit taille MAX, pas nombre colonnes
Indice 2 : Nombre colonnes = largeur écran / maxCrossAxisExtent
Indice 3 : Pour tester, changez taille fenêtre émulateur
Indice 4 : Stack pour superposer texte sur image
```



---

### ✅ CHECKPOINT #3 

**Scénario** : Vous créez une galerie photos qui doit s'adapter à différentes tailles d'écrans (mobile, tablet, desktop).

**Question** : Quel GridView utiliser ?

**A)** GridView.count (colonnes fixes)  
**B)** GridView.extent (taille adaptative) 
**C)** Les deux fonctionnent pareil  
**D)** Aucun, utiliser ListView

Réponse B

**Justification** :

**GridView.count (colonnes fixes)** :
```
Mobile (360px) :    Tablet (768px) :
┌──┬──┬──┐          ┌──┬──┬──┐
│  │  │  │ 120px    │  │  │  │ 256px ← Trop grand !
└──┴──┴──┘          └──┴──┴──┘
crossAxisCount: 3 (toujours 3 colonnes)

❌ Sur grand écran, cellules deviennent énormes
```

**GridView.extent (adaptatif)** :
```
Mobile (360px) :    Tablet (768px) :    Desktop (1200px) :
┌──┬──┬──┐          ┌──┬──┬──┬──┬──┐    ┌──┬──┬──┬──┬──┬──┬──┬──┐
│  │  │  │ 120px    │  │  │  │  │  │    │  │  │  │  │  │  │  │  │
└──┴──┴──┘          └──┴──┴──┴──┴──┘    └──┴──┴──┴──┴──┴──┴──┴──┘
3 colonnes          5 colonnes          8 colonnes

maxCrossAxisExtent: 150px (taille adaptée automatiquement)

✅ S'adapte parfaitement à toutes tailles
```

**Règle de décision** :
- Taille fixe connue → `.count`
- Responsive / multi-device → `.extent` ✓

---

## 🎯 Projet 


### Énoncé du Projet

Créez une **application mobile "Market Place"** complète qui intègre **tous les concepts** du Module 3.

**Objectif** : Démontrer la maîtrise de Row, Column, Expanded, Stack, ListView et GridView dans une application cohérente.

---

### Spécifications Techniques

#### **Écran 1 : Page d'Accueil (20 points)**

**Structure** :
```
┌─────────────────────────────────┐
│ ┌─ AppBar ──────────────────┐  │
│ │ Market  🛒  [Panier]      │  │
│ └────────────────────────────┘  │
│                                  │
│ ┌─ En-tête (Row) ───────────┐  │
│ │ 👤  Bonjour Alice!   [⚙️] │  │ ← Row (Stack icône)
│ └────────────────────────────┘  │
│                                  │
│ ┌─ Statistiques (Row) ──────┐  │
│ │ 📦24  💬12k  ⭐856       │  │ ← Row + 3 Column (Expanded)
│ └────────────────────────────┘  │
│                                  │
│ ┌─ Catégories (ListView hor.)┐ │
│ │ [Tech] [Mode] [Maison] ... │  │ ← ListView horizontal
│ └────────────────────────────┘  │
│                                  │
│ ┌─ Produits Vedettes (Grid)─┐  │
│ │ ┌──┬──┐                    │  │
│ │ │  │  │ ...                │  │ ← GridView 2 colonnes
│ │ └──┴──┘                    │  │
└─────────────────────────────────┘
```


---

#### **Écran 2 : Liste Complète Produits (25 points)**

**Structure** :
```
┌─────────────────────────────────┐
│ ┌─ AppBar ──────────────────┐  │
│ │ ← Tous les Produits       │  │
│ └────────────────────────────┘  │
│                                  │
│ ┌─ Barre recherche ─────────┐  │
│ │ 🔍 Rechercher...          │  │
│ └────────────────────────────┘  │
│                                  │
│ ┌─ ListView.builder ────────┐  │
│ │ ┌─────────────────────┐   │  │
│ │ │ 💻 MacBook  2499 CHF│   │  │ ← Card + Row
│ │ └─────────────────────┘   │  │
│ │ ┌─────────────────────┐   │  │
│ │ │ 📱 iPhone   999 CHF │   │  │
│ │ └─────────────────────┘   │  │
│ │ ...  (100+ produits)      │  │
│ └────────────────────────────┘  │
└─────────────────────────────────┘
```



---

#### **Écran 3 : Détail Produit (25 points)**

**Structure** :
```
┌─────────────────────────────────┐
│ ┌─ Stack Image ─────────────┐  │
│ │     [IMAGE]               │  │
│ │  ░░░░░░░░░░░              │  │ ← Stack (image + gradient)
│ │  ▓▓▓▓▓▓▓▓▓▓▓              │  │
│ │  [NEW] badge  [❤️]        │  │ ← Positioned badges
│ └────────────────────────────┘  │
│                                  │
│ ┌─ Informations ────────────┐  │
│ │ MacBook Pro M3            │  │
│ │ ⭐⭐⭐⭐⭐ (4.8/5)         │  │
│ │                           │  │
│ │ 2499.00 CHF              │  │
│ │                           │  │
│ │ Description longue...     │  │
│ └────────────────────────────┘  │
│                                  │
│ ┌─ Row Boutons ─────────────┐  │
│ │ [Ajouter Panier] [Acheter]│  │ ← Row + 2 Expanded
│ └────────────────────────────┘  │
└─────────────────────────────────┘
```


---

### Données Fournies

```dart
final List<Map<String, dynamic>> produits = [
  {
    'id': 1,
    'nom': 'MacBook Pro M3',
    'prix': 2499.00,
    'categorie': 'Tech',
    'stock': 12,
    'note': 4.8,
    'nouveau': true,
    'description': 'Le MacBook Pro le plus puissant jamais conçu.',
  },
  {
    'id': 2,
    'nom': 'iPhone 15 Pro',
    'prix': 1199.00,
    'categorie': 'Tech',
    'stock': 45,
    'note': 4.7,
    'nouveau': true,
    'description': 'Titanium. A17 Pro. Pro. Camera system.',
  },
  // ... Ajoutez 98+ produits supplémentaires
];
```




