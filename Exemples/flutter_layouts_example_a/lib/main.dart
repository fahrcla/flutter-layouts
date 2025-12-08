import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Row Simple'),
          backgroundColor: Colors.blue[600],
        ),
        body: Center(
          child: Row(
            // 1️⃣ Espacement HORIZONTAL (mainAxis)
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            // 2️⃣ Alignement VERTICAL (crossAxis)
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              // Container ROUGE
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'A',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
              // Container BLEU
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'B',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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