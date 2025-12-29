import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Positioned 4 Coins')),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                // Badge Coin Supérieur Gauche
                Positioned(
                  top: 16,
                  left: 16,
                  child: _buildBadge('TL', Colors.red),
                ),
                
                // Badge Coin Supérieur Droit
                Positioned(
                  top: 16,
                  right: 16,
                  child: _buildBadge('TR', Colors.blue),
                ),
                
                // Badge Coin Inférieur Gauche
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: _buildBadge('BL', Colors.green),
                ),
                
                // Badge Coin Inférieur Droit
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: _buildBadge('BR', Colors.orange),
                ),
                
                // Centre
                const Center(
                  child: Text(
                    'Centre',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  // Méthode helper pour créer un badge
  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}