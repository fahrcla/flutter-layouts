
#### 📝 Exercice 5 : Interface Carte Profil 


**Cahier des charges** :

Créez une interface "Carte de Profil Utilisateur" selon les spécifications suivantes.

**Contraintes techniques obligatoires** :

1. **Structure globale** :
   - Card avec `elevation: 4.0`
   - Padding interne : `16.0` sur tous les côtés
   - BorderRadius : `12.0`
   - Largeur maximale : 350px

2. **Section 1 - En-tête** :
   - Row contenant :
     - Avatar circulaire (60×60, couleur: Colors.purple)
     - Nom utilisateur (fontSize: 20, bold)
     - IconButton paramètres (Icons.settings) aligné à droite
   - mainAxisAlignment : spaceBetween
   - crossAxisAlignment : center

3. **Section 2 - Séparateur** :
   - Divider avec `height: 32`

4. **Section 3 - Statistiques** :
   - Row avec 3 Column identiques
   - Chaque Column contient :
     - Nombre (fontSize: 24, bold)
     - Label (fontSize: 12, grey)
   - mainAxisAlignment : spaceEvenly

5. **Section 4 - Actions** :
   - Row avec 2 boutons
   - ElevatedButton "Voir Profil" et OutlinedButton "Message"
   - mainAxisAlignment : spaceEvenly
   - Espacement entre boutons : 8px

**Données à afficher** :
- Nom : "Alice Dubois"
- Projets : 24
- Followers : 1.2k
- Likes : 856
