import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('GridView Simple')),
        body: GridView.count(
          // 1️⃣ CROSSAXISCOUNT : Nombre de colonnes
          crossAxisCount: 2, // 2 colonnes
          
          // 2️⃣ SPACING : Espacement entre éléments
          mainAxisSpacing: 12.0,   // Espacement vertical
          crossAxisSpacing: 12.0,  // Espacement horizontal
          
          // 3️⃣ PADDING : Espacement externe
          padding: const EdgeInsets.all(16.0),
          
          // 4️⃣ CHILDREN : Liste des widgets
          children: [
            // Item 1
            Container(
              decoration: BoxDecoration(
                color: Colors.red[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  '1',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            // Item 2
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('2', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            
            // Item 3
            Container(
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('3', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            
            // Item 4
            Container(
              decoration: BoxDecoration(
                color: Colors.orange[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('4', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            
            // Item 5
            Container(
              decoration: BoxDecoration(
                color: Colors.purple[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('5', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            
            // Item 6
            Container(
              decoration: BoxDecoration(
                color: Colors.teal[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('6', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold))),
            ),
          ],
        ),
      ),
    );
  }
}