import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Alignements Row'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // ===== spaceBetween =====
              _buildExempleRow(
                'spaceBetween',
                MainAxisAlignment.spaceBetween,
              ),
              
              const SizedBox(height: 16),
              
              // ===== center =====
              _buildExempleRow(
                'center',
                MainAxisAlignment.center,
              ),
              
              const SizedBox(height: 16),
              
              // ===== spaceEvenly =====
              _buildExempleRow(
                'spaceEvenly',
                MainAxisAlignment.spaceEvenly,
              ),
              
              const SizedBox(height: 16),
              
              // ===== spaceAround =====
              _buildExempleRow(
                'spaceAround',
                MainAxisAlignment.spaceAround,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // Méthode helper pour réduire duplication
  Widget _buildExempleRow(String titre, MainAxisAlignment alignment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titre,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: alignment,
            children: [
              _buildBox(Colors.red, '1'),
              _buildBox(Colors.green, '2'),
              _buildBox(Colors.blue, '3'),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildBox(Color color, String label) {
    return Container(
      width: 60,
      height: 60,
      color: color,
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}