import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Aspect Ratios')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Carrés (ratio 1.0) :', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              
              // TODO 1 : Créez GridView.count avec :
              // - crossAxisCount: 3
              // - childAspectRatio: 1.0 (carrés)
              // - height: 150
              // - 6 containers colorés
              SizedBox(
                height: 150,
                child: GridView.count(
                  crossAxisCount: /* TODO */,
                  childAspectRatio: /* TODO */,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    // TODO : 6 containers
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              const Text('Rectangles horizontaux (ratio 2.0) :', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              
              // TODO 2 : Créez GridView.count avec :
              // - crossAxisCount: 2
              // - childAspectRatio: 2.0 (largeur = 2× hauteur)
              // - height: 120
              SizedBox(
                height: 120,
                child: GridView.count(
                  crossAxisCount: /* TODO */,
                  childAspectRatio: /* TODO */,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    // TODO : 4 containers
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