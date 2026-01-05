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
              const Text('Exemple 1 : Expanded', style: TextStyle(fontWeight: FontWeight.bold)),
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
                    // TODO : Complétez ici
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              const Text('Exemple 2 : Flexible', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              
              // TODO 2 : Créez une Row avec 2 Flexible
              // Même contenu, mais avec Flexible au lieu d'Expanded
              Container(
                height: 60,
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    // TODO : Complétez ici
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // ===== Question à répondre =====
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '❓ Quelle est la différence visuelle entre les 2 exemples ?',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}