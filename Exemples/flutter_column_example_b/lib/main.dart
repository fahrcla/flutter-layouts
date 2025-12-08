import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Column Simple'),
          backgroundColor: Colors.green[600],
        ),
        body: Center(
          child: Column(
            // 1️⃣ Espacement VERTICAL (mainAxis pour Column)
            mainAxisAlignment: MainAxisAlignment.center,
            
            // 2️⃣ Alignement HORIZONTAL (crossAxis pour Column)
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              // Texte 1
              const Text(
                'Titre Principal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 8), // Espacement
              
              // Texte 2
              Text(
                'Sous-titre',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Texte 3
              const Text(
                'Description détaillée du contenu.',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}