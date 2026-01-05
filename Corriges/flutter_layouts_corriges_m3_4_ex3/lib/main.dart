import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    // ===== DONNÉES PRODUITS =====
    final List<Map<String, dynamic>> produits = [
      {'nom': 'MacBook Pro', 'prix': 2499.00, 'categorie': 'Tech', 'stock': 12},
      {'nom': 'iPhone 15', 'prix': 999.00, 'categorie': 'Tech', 'stock': 45},
      {'nom': 'AirPods Pro', 'prix': 279.00, 'categorie': 'Audio', 'stock': 0},
      {'nom': 'iPad Air', 'prix': 699.00, 'categorie': 'Tech', 'stock': 23},
      {'nom': 'Apple Watch', 'prix': 449.00, 'categorie': 'Tech', 'stock': 8},
      {'nom': 'Sony WH-1000XM5', 'prix': 399.00, 'categorie': 'Audio', 'stock': 15},
      {'nom': 'Samsung Galaxy S24', 'prix': 899.00, 'categorie': 'Tech', 'stock': 0},
      {'nom': 'Dell XPS 15', 'prix': 1899.00, 'categorie': 'Tech', 'stock': 7},
      {'nom': 'Bose QuietComfort', 'prix': 349.00, 'categorie': 'Audio', 'stock': 22},
      {'nom': 'Microsoft Surface', 'prix': 1299.00, 'categorie': 'Tech', 'stock': 11},
      {'nom': 'Google Pixel 8', 'prix': 799.00, 'categorie': 'Tech', 'stock': 0},
      {'nom': 'JBL Charge 5', 'prix': 179.00, 'categorie': 'Audio', 'stock': 34},
      {'nom': 'Lenovo ThinkPad', 'prix': 1599.00, 'categorie': 'Tech', 'stock': 5},
      {'nom': 'Beats Studio Pro', 'prix': 349.00, 'categorie': 'Audio', 'stock': 18},
      {'nom': 'Asus ROG Laptop', 'prix': 2199.00, 'categorie': 'Tech', 'stock': 3},
    ];
    
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('🛒 Boutique Tech'),
          backgroundColor: Colors.blue[700],
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: produits.length,
          padding: const EdgeInsets.all(8.0),
          itemBuilder: (BuildContext context, int index) {
            // Récupération du produit
            final produit = produits[index];
            
            // Variables pour lisibilité
            final String nom = produit['nom'];
            final double prix = produit['prix'];
            final String categorie = produit['categorie'];
            final int stock = produit['stock'];
            
            // Déterminer icône selon catégorie
            IconData icone = categorie == 'Tech' 
                ? Icons.laptop_mac 
                : Icons.headset;
            
            Color couleurIcone = categorie == 'Tech' 
                ? Colors.blue 
                : Colors.purple;
            
            // Déterminer badge stock
            bool enStock = stock > 0;
            String texteBadge = enStock ? 'En stock' : 'Rupture';
            Color couleurBadge = enStock ? Colors.green : Colors.red;
            
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ===== LEADING : Icône Catégorie =====
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: couleurIcone.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        icone,
                        size: 36,
                        color: couleurIcone,
                      ),
                    ),
                    
                    const SizedBox(width: 16),
                    
                    // ===== CENTRE : Infos Produit =====
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nom du produit
                          Text(
                            nom,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          
                          // Catégorie
                          Text(
                            categorie,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // ===== TRAILING : Prix + Badge =====
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Prix
                        Text(
                          '${prix.toStringAsFixed(2)} CHF',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[700],
                          ),
                        ),
                        const SizedBox(height: 8),
                        
                        // Badge stock
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: couleurBadge,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            texteBadge,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}