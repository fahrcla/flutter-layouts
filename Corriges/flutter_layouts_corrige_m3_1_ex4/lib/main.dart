import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Carte de Contact')),
        body: Center(
          // 1. WIDGET ENVELOPPANT (Card pour l'esthétique)
          child: Card(
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              
              // 2. ROW PRINCIPALE
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center, // Aligne la Column et l'Avatar
                children: [
                  
                  // 1️⃣ AVATAR CIRCULAIRE (80x80)
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[200],
                      shape: BoxShape.circle, // Rend le Container circulaire
                    ),
                    child: const Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  
                  // Spacer horizontal de 16px
                  const SizedBox(width: 16),
                  
                  // 2️⃣ COLUMN INFORMATIONS
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligne les éléments à gauche
                    mainAxisSize: MainAxisSize.min, // La Column ne prend que l'espace nécessaire
                    children: [
                      
                      // Nom Prénom
                      const Text(
                        'Nom Prénom',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      
                      const SizedBox(height: 4),
                      
                      // Poste / Entreprise
                      Text(
                        'Poste / Entreprise',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // Row Étoiles
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min, // Important pour que la Row ne prenne pas toute la largeur
                        children: const [
                          // 4 Étoiles pleines
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          // 1 Étoile vide
                          Icon(Icons.star_border, color: Colors.amber, size: 18),
                          
                          // Texte du score (optionnel)
                          SizedBox(width: 8),
                          Text('(4/5)', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}