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