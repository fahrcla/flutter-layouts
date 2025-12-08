import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Row Annotée')),
        body: Center(
          child: Row(
            // 1️⃣ MAINAXISALIGNMENT : Contrôle l'espacement HORIZONTAL
            // spaceBetween = espaces ÉGAUX entre les éléments
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            // 2️⃣ CROSSAXISALIGNMENT : Contrôle l'alignement VERTICAL
            // center = tous les enfants centrés verticalement
            crossAxisAlignment: CrossAxisAlignment.center,
            
            // 3️⃣ CHILDREN : Liste des widgets à organiser
            children: [
              // Container ROUGE à gauche
              Container(
                width: 80,
                height: 80,
                color: Colors.red,
                child: const Center(child: Text('A')),
              ),
              
              // Container VERT au centre (grâce à spaceBetween)
              Container(
                width: 80,
                height: 80,
                color: Colors.green,
                child: const Center(child: Text('B')),
              ),
              
              // Container BLEU à droite
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
                child: const Center(child: Text('C')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
