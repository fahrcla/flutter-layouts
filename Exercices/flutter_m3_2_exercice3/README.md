# 📝 Exercice 3 : Interface Sidebar 30/70 

**Énoncé** :

Créez une interface avec **sidebar** (barre latérale) et **contenu principal** :

**Layout visuel** :
```
┌────────────────────────────────┐
│ 📋     │ 📄                   │
│ Menu   │ Contenu Principal    │
│        │                       │
│ • Item │ Texte du contenu...  │
│ • Item │                       │
│ • Item │                       │
│        │                       │
│        │                       │
└────────────────────────────────┘
 ← 30%  →← 70%                 →
```

**Spécifications** :

1. **Structure** :
   - Row principale avec 2 Expanded
   - Sidebar : flex = 3 (30%)
   - Contenu : flex = 7 (70%)

2. **Sidebar (gauche)** :
   - Couleur de fond : Colors.blue[800]
   - Padding : 16px tous côtés
   - Column avec :
     - Titre "Menu" (blanc, fontSize 20, bold)
     - SizedBox(height: 24)
     - 4 ListTile avec Icons et texte

3. **Contenu (droite)** :
   - Couleur de fond : Colors.grey[100]
   - Padding : 24px
   - Column avec :
     - Titre "Contenu Principal" (fontSize 24, bold)
     - SizedBox(height: 16)
     - Texte descriptif (5-6 lignes de Lorem Ipsum)

**Widgets recommandés** :
- Row, Column, Expanded
- Container (pour couleurs de fond)
- ListTile (pour items menu)
- Text

**💡 Indices** :
```
Indice 1 : flex: 3 et flex: 7 donnent ratio 30/70 (3/(3+7) = 30%)
Indice 2 : ListTile(leading: Icon(...), title: Text(...))
Indice 3 : Pour hauteur pleine écran, wrappez Row dans SizedBox(height: MediaQuery.of(context).size.height)
```