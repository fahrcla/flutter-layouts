/**********************************
 * Module 3.3 Exercice 2
 * Positioned
 */

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
                // ===== TODO 1 : Badge Coin Supérieur Gauche =====
                // Positioned(top: 16, left: 16, ...)
                // Container avec texte "TL" (Top-Left)
                // Couleur : Colors.red
                
                // ===== TODO 2 : Badge Coin Supérieur Droit =====
                // Positioned(top: 16, right: 16, ...)
                // Container avec texte "TR" (Top-Right)
                // Couleur : Colors.blue
                
                // ===== TODO 3 : Badge Coin Inférieur Gauche =====
                // Positioned(bottom: 16, left: 16, ...)
                // Container avec texte "BL" (Bottom-Left)
                // Couleur : Colors.green
                
                // ===== TODO 4 : Badge Coin Inférieur Droit =====
                // Positioned(bottom: 16, right: 16, ...)
                // Container avec texte "BR" (Bottom-Right)
                // Couleur : Colors.orange
                
                // Centre (optionnel)
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
  
  // TODO : Créez une méthode helper
  // Widget _buildBadge(String text, Color color) {...}
}