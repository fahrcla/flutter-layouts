/****************************************
 *  Corrigé Ex3 module 3.2 **************
 * *************************************/


import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    // Utilisation de Builder pour accéder au MediaQuery et obtenir la hauteur de l'écran
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Interface Sidebar 30/70')),
        body: Builder(
          builder: (context) {
            // Hauteur restante sous l'AppBar
            final screenHeight = MediaQuery.of(context).size.height;
            
            return SizedBox(
              height: screenHeight, // Force la Row à prendre toute la hauteur disponible
              
              // 1. STRUCTURE PRINCIPALE : ROW
              child: Row(
                children: [
                  
                  // 2. SIDEBAR (flex = 3 / 30%)
                  Expanded(
                    flex: 3, 
                    child: Container(
                      color: Colors.blue[800],
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          // Titre Sidebar
                          Text(
                            'Menu',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          
                          SizedBox(height: 24),
                          
                          // Items de menu (ListTile)
                          ListTile(
                            leading: Icon(Icons.dashboard, color: Colors.white),
                            title: Text('Tableau de bord', style: TextStyle(color: Colors.white)),
                          ),
                          ListTile(
                            leading: Icon(Icons.people, color: Colors.white),
                            title: Text('Utilisateurs', style: TextStyle(color: Colors.white)),
                          ),
                          ListTile(
                            leading: Icon(Icons.settings, color: Colors.white),
                            title: Text('Paramètres', style: TextStyle(color: Colors.white)),
                          ),
                          ListTile(
                            leading: Icon(Icons.exit_to_app, color: Colors.white),
                            title: Text('Déconnexion', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // 3. CONTENU PRINCIPAL (flex = 7 / 70%)
                  Expanded(
                    flex: 7, 
                    child: Container(
                      color: Colors.grey[100],
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          // Titre Contenu
                          Text(
                            'Contenu Principal',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          
                          SizedBox(height: 16),
                          
                          // Texte descriptif (Lorem Ipsum)
                          Text(
                            "Ceci est la zone de contenu principal. Nous utilisons le widget Expanded avec un ratio flex de 3 pour la barre latérale et de 7 pour cette section. Ceci permet une division de l'espace horizontal disponible en proportion de 30% / 70% pour créer une interface utilisateur moderne de type bureau.",
                            style: TextStyle(fontSize: 16),
                          ),
                          // Pour remplir la hauteur (simuler un contenu plus long)
                          Expanded(child: SizedBox.shrink()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}