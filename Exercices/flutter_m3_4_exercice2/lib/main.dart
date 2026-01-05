import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ListView.builder')),
        body: ListView.builder(
          // TODO 1 : Définir itemCount à 100
          itemCount: /* COMPLÉTEZ */,
          itemBuilder: (BuildContext context, int index) {
            // TODO 3 : Créer une Card contenant un ListTile
            // - leading : CircleAvatar avec couleur selon pair ou impair
            // - title : "Élément ${index + 1}"
            // - subtitle : "Description $index"
            // - trailing : Icon(Icons.arrow_forward_ios)
            
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: /* TODO : Couleur selon pair/impair */,
                  child: Text('${index + 1}'),
                ),
                title: Text(/* TODO : Titre */),
                subtitle: Text(/* TODO : Sous-titre */),
                trailing: /* TODO : Icône */,
              ),
            );
          },
        ),
      ),
    );
  }
}