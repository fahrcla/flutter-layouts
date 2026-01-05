import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Ma Column')),
        body: Center(
          child: Column(
            // TODO 1 : Choisir un mainAxisAlignment (Vertical)
            mainAxisAlignment: MainAxisAlignment
                .center, // Centré verticalement (comme suggéré)
            // TODO 2 : Choisir un crossAxisAlignment (Horizontal)
            crossAxisAlignment:
                CrossAxisAlignment.start, // Alignement à gauche (comme suggéré)

            children: [
              // TODO 3 : Créer un Text avec "Titre Principal"
              const Text(
                'Titre Principal',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16), // Espacement vertical
              // TODO 4 : Créer un Text avec "Sous-titre descriptif"
              Text(
                'Sous-titre descriptif',
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),

              const SizedBox(height: 24),

              // TODO 5 : Créer un ElevatedButton avec texte "Action"
              ElevatedButton(
                onPressed: () {
                  print('Bouton cliqué !');
                },
                child: const Text('Action'),
              ),
              // 4e élément ajouté ici
              const SizedBox(height: 16),
              const Icon(
                Icons.star, // Exemple d'icône
                size: 40,
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
