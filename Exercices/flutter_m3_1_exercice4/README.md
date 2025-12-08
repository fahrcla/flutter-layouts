
#### 📝 Exercice 4 : Row+Column Imbriquées 

**Énoncé fonctionnel** :

Créez une interface "Carte de Contact" avec la structure suivante :

**Layout visuel** :
```
┌─────────────────────────────────┐
│  👤  │  Nom Prénom              │
│      │  Poste / Entreprise      │
│      │  ⭐⭐⭐⭐☆ (4/5)          │
└─────────────────────────────────┘
```

**Spécifications techniques** :

1. **Row principale** :
   - Avatar circulaire à gauche (80×80)
   - Column à droite avec informations
   - Espacement entre avatar et Column : 16px
   - mainAxisAlignment : start
   - crossAxisAlignment : center

2. **Column informations** :
   - Texte "Nom Prénom" (fontSize 20, bold)
   - Texte "Poste / Entreprise" (fontSize 14, grey)
   - Row avec 5 étoiles (4 pleines, 1 vide)
   - crossAxisAlignment : start

3. **Row étoiles** :
   - 5 Icon (Icons.star ou Icons.star_border)
   - mainAxisAlignment : start

**Widgets autorisés** :
- Row, Column
- Container (pour avatar circulaire → `shape: BoxShape.circle`)
- Text
- Icon (Icons.star, Icons.star_border)
- SizedBox (espacement)
- Card (optionnel pour embellir)

**💡 Indices** :
```
Indice 1 : Container avec decoration: BoxDecoration(shape: BoxShape.circle)
Indice 2 : Utilisez SizedBox(width: 16) entre avatar et Column
Indice 3 : Pour les étoiles, créez une Row avec 5 Icon
Indice 4 : Icons.star pour pleines, Icons.star_border pour vides
```
