# M3.5 Ex2 corrigé

### Le concept Clé : `childAspectRatio`

Le ratio se calcule ainsi : .

* **Ratio 1.0** : La largeur est égale à la hauteur (Carré).
* **Ratio 2.0** : La largeur est le double de la hauteur (Rectangle "paysage").
* **Ratio 0.5** : La hauteur est le double de la largeur (Rectangle "portrait").

---

### Code Corrigé


```dart
import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Aspect Ratios')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Carrés (ratio 1.0) :', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),

              // TODO 1 : Carrés (3 colonnes)
              SizedBox(
                height: 150,
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0, // Largeur = Hauteur
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: List.generate(6, (index) => Container(
                    color: Colors.amber[100 * (index + 1)],
                    child: Center(child: Text('Carré ${index + 1}')),
                  )),
                ),
              ),

              const SizedBox(height: 24),

              const Text('Rectangles horizontaux (ratio 2.0) :', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),

              // TODO 2 : Rectangles (2 colonnes)
              SizedBox(
                height: 120,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 2.0, // Largeur = 2x Hauteur
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    _buildRect(Colors.blue, "Bleu"),
                    _buildRect(Colors.red, "Rouge"),
                    _buildRect(Colors.green, "Vert"),
                    _buildRect(Colors.purple, "Violet"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Petite fonction helper pour gagner du temps
  Widget _buildRect(Color color, String text) {
    return Container(
      color: color.withOpacity(0.3),
      child: Center(child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}

```




