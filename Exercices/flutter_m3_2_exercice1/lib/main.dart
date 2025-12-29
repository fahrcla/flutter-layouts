import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Expanded 1:2:1')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // ===== SECTION 1 : flex = 1 =====
              Expanded(
                flex: 1, // Prend 1 part sur 4 total (25%)
                child: Container(
                  height: 150,
                  color: Colors.red[300],
                  child: const Center(
                    child: Text(
                      '25%',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(width: 8), // Espacement
              
              // ===== SECTION 2 : flex = 2 =====
              Expanded(
                flex: 2, // Prend 2 parts sur 4 total (50%)
                child: Container(
                  height: 150,
                  color: Colors.blue[300],
                  child: const Center(
                    child: Text(
                      '50%',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(width: 8),
              
              // ===== SECTION 3 : flex = 1 =====
              Expanded(
                flex: 1, // Prend 1 part sur 4 total (25%)
                child: Container(
                  height: 150,
                  color: Colors.green[300],
                  child: const Center(
                    child: Text(
                      '25%',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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