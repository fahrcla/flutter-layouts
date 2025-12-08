import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Ma Row Personnalisée')),
        body: Center(
          child: Row(
            // Horizontal : Espace égal autour de chaque enfant
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            // Vertical : Alignement en haut de la Row
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                width: 60,
                height: 100,
                color: Colors.purple,
                child: const Center(child: Text('1')),
              ),
              Container(
                width: 60,
                height: 60,
                color: Colors.orange,
                child: const Center(child: Text('2')),
              ),
              Container(
                width: 60,
                height: 120,
                color: Colors.teal,
                child: const Center(child: Text('3')),
              ),
              Container(
                width: 60,
                height: 80,
                color: Colors.brown,
                child: const Center(child: Text('4')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
