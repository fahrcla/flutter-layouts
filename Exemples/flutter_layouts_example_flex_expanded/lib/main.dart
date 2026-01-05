import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Expanded vs Flexible')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Titre Exemple 1 =====
              const Text(
                'Avec EXPANDED (force) :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              
              // ===== Row avec Expanded =====
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red[200],
                        child: const Center(child: Text('Court')),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue[200],
                        child: const Center(child: Text('Autre')),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // ===== Titre Exemple 2 =====
              const Text(
                'Avec FLEXIBLE (permission) :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              
              // ===== Row avec Flexible =====
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        color: Colors.red[200],
                        padding: const EdgeInsets.all(8),
                        child: const Text('Court'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Container(
                        color: Colors.blue[200],
                        padding: const EdgeInsets.all(8),
                        child: const Text('Autre lkajsdfkj adslfkj aslkdfj lasjkdf lajs dfljas dlf'),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // ===== Explication =====
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '💡 Notez la différence :\n'
                  '• Expanded remplit TOUT l\'espace (50/50)\n'
                  '• Flexible prend seulement ce dont il a besoin',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}