import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Stack Simple')),
        body: Center(
          child: Stack(
            alignment: Alignment.center, // Centre tous les enfants
            children: [
              // ===== COUCHE 1 : Arrière-plan (200×200) =====
              Container(
                width: 200,
                height: 200,
                color: Colors.red[300],
                child: const Center(
                  child: Text(
                    'Arrière',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              
              // ===== COUCHE 2 : Milieu (150×150) =====
              Container(
                width: 150,
                height: 150,
                color: Colors.blue[300],
                child: const Center(
                  child: Text(
                    'Milieu',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              
              // ===== COUCHE 3 : Devant (100×100) =====
              Container(
                width: 100,
                height: 100,
                color: Colors.green[300],
                child: const Center(
                  child: Text(
                    'Devant',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}