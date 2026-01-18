import 'package:flutter/material.dart';

void main() => runApp(const GalerieApp());

class GalerieApp extends StatelessWidget {
  const GalerieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ma Galerie Responsive'),
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
        ),
        // Utilisation de .extent pour le côté responsive automatique
        body: GridView.extent(
          maxCrossAxisExtent: 150, // Largeur maximale d'une photo
          padding: const EdgeInsets.all(8.0),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          children: List.generate(50, (index) => _buildPhotoCard(index)),
        ),
      ),
    );
  }

  Widget _buildPhotoCard(int index) {
    // Génération d'une couleur légèrement différente pour chaque carte
    final color = Colors.primaries[index % Colors.primaries.length];

    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias, // Pour que le contenu ne dépasse pas des bords arrondis
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Fond de la photo (Dégradé)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color.withOpacity(0.4), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Icon(Icons.image, size: 48, color: Colors.white),
          ),
          
          // Overlay de texte en bas
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              color: Colors.black.withOpacity(0.5),
              child: Text(
                'Photo $index',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}