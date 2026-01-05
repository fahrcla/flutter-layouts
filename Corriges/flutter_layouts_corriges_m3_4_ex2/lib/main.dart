import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView.builder avec SnackBar'),
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: index % 2 == 0 ? Colors.blue : Colors.green,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text('Élément ${index + 1}'),
                subtitle: Text('Description $index'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                
                // ===== AJOUT onTap =====
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '🎯 Vous avez cliqué sur l\'élément ${index + 1}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      backgroundColor: Colors.deepPurple,
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      action: SnackBarAction(
                        label: 'OK',
                        textColor: Colors.white,
                        onPressed: () {
                          // Fermer le SnackBar
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}