import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Stack Overlay Gradient')),
        body: Center(
          // Structure de la carte (taille fixe pour la démo)
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(blurRadius: 10, color: Colors.black12)
              ],
            ),
            clipBehavior: Clip.antiAlias, // Important pour que l'image et le Stack soient arrondis
            
            // Le Stack permet la superposition des 3 couches
            child: Stack(
              children: [
                
                // 1. COUCHE DE BASE : IMAGE (remplace Image.network)
                Positioned.fill( // Pour que l'image remplisse le Stack
                  child: Container(
                    color: Colors.blue[300],
                    child: const Center(
                      child: Icon(Icons.image, size: 100, color: Colors.white),
                    ),
                  ),
                ),
                
                // 2. COUCHE INTERMÉDIAIRE : GRADIENT (s'étend sur toute la Stack)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent, // Début en haut (transparent)
                          Colors.black.withOpacity(0.7), // Fin en bas (noir opaque à 70%)
                        ],
                        stops: const [0.5, 1.0] // Le dégradé commence à 50% de la hauteur
                      ),
                    ),
                  ),
                ),
                
                // 3. COUCHE SUPÉRIEURE : TEXTE
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Titre Produit (Bold, Blanc)
                      const Text(
                        'Titre Produit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      
                      const SizedBox(height: 4),
                      
                      // Prix (Blanc, Opacité 0.9)
                      Text(
                        'Prix : 49.90 CHF',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
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