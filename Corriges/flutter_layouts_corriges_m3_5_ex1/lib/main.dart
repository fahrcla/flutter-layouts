import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ma Grille 2×3'),

          backgroundColor: Colors.indigo[600],
        ),

        body: GridView.count(
          crossAxisCount: 4, // 4 colonnes
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          padding: const EdgeInsets.all(10.0),
          // On réduit la hauteur des cases pour qu'elles restent lisibles
          childAspectRatio: 0.8,
          children: [
            _buildCard('Gmail', Icons.email, Colors.red),
            _buildCard('Maps', Icons.map, Colors.green),
            _buildCard('Calendar', Icons.calendar_today, Colors.blue),
            _buildCard('Drive', Icons.cloud_queue, Colors.amber),
            _buildCard('Keep', Icons.lightbulb_outline, Colors.orange),
            _buildCard('Photos', Icons.collections, Colors.indigo),
            _buildCard('Meet', Icons.video_call, Colors.teal),
            _buildCard('Play', Icons.play_arrow, Colors.blueGrey),
          ],
        ),
      ),
    );
  }

  // Méthode helper pour créer une carte

  Widget _buildCard(String titre, IconData icone, Color couleur) {
    return Card(
      elevation: 4.0,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [couleur.withOpacity(0.7), couleur],

            begin: Alignment.topLeft,

            end: Alignment.bottomRight,
          ),

          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(icone, size: 48, color: Colors.white),

            const SizedBox(height: 12),

            Text(
              titre,

              style: const TextStyle(
                color: Colors.white,

                fontSize: 16,

                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
