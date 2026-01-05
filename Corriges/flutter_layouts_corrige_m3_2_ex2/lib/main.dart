import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flexible vs Expanded')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Exemple 1 : Expanded',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // TODO 1 : Créez une Row avec 2 Expanded
              // Container 1 : Rouge, texte "Court"
              // Container 2 : Bleu, texte "Texte"
              // Les 2 doivent avoir flex: 1 (50/50)
              Container(
                height: 60,
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    Expanded(
                      // 🎯 Expanded 1
                      flex: 1,
                      child: Container(
                        color: Colors.red[300],
                        child: const Center(child: Text('Court')),
                      ),
                    ),
                    Expanded(
                      // 🎯 Expanded 2
                      flex: 1,
                      child: Container(
                        color: Colors.blue[300],
                        child: const Center(child: Text('Texte')),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Exemple 2 : Flexible',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // TODO 2 : Créez une Row avec 2 Flexible
              // Même contenu, mais avec Flexible au lieu d'Expanded
              Container(
                height: 60,
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    Flexible(
                      // 🎯 Flexible 1
                      flex: 1,
                      child: Container(
                        color: Colors.red[300],
                        padding: const EdgeInsets.all(
                          8,
                        ), // Ajout de padding comme indice
                        child: const Center(child: Text('Court')),
                      ),
                    ),
                    Flexible(
                      // 🎯 Flexible 2
                      flex: 1,
                      child: Container(
                        color: Colors.blue[300],
                        padding: const EdgeInsets.all(8),
                        child: const Center(child: Text('Texte')),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              const Text(
                'Exemple 3 : Expanded (1) + Flexible (1)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              Container(
                height: 60,
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    // Expanded : Force à prendre 50% de l'espace flexible
                    Expanded(
                      // 🎯 Expanded (flex: 1)
                      flex: 1,
                      child: Container(
                        color: Colors.orange[300],
                        child: const Center(child: Text('Ex 3. E')),
                      ),
                    ),
                    // Flexible : Prend juste ce dont il a besoin (ici, la taille du texte)
                    Flexible(
                      // 🎯 Flexible (flex: 1)
                      flex: 1,
                      child: Container(
                        color: Colors.green[300],
                        padding: const EdgeInsets.all(8),
                        child: const Text('Petit'),
                      ),
                    ),
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
