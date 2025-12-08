import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Mes 3 Containers')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              // 🎯 Alignement : center
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1️⃣ ROUGE
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.all(
                    4,
                  ), // Optionnel: ajoute un petit espace entre les enfants
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(
                      16,
                    ), // 🎯 Coins arrondis: 16
                  ),
                ),

                // 2️⃣ JAUNE
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                // 3️⃣ VERT
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                // 4️⃣ BLEU
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
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
