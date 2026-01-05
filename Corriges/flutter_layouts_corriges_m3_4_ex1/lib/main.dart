import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('📞 Mes Contacts'),
          backgroundColor: Colors.indigo[700],
        ),
        body: ListView(
          padding: const EdgeInsets.all(12.0),
          children: [
            // CONTACT 1
            Card(
              elevation: 2,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: const Text('Jean Dupont', 
                  style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('📱 +41 79 123 45 67\n✉️ jean.dupont@email.ch'),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.phone, color: Colors.green),
                  onPressed: () {
                    // Action appel
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            
            // CONTACT 2
            Card(
              elevation: 2,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: const Text('Marie Martin', 
                  style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('📱 +41 78 987 65 43\n✉️ marie.martin@email.ch'),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.phone, color: Colors.green),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 8),
            
            // CONTACT 3
            Card(
              elevation: 2,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: const Text('Pierre Bernard', 
                  style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('📱 +41 76 234 56 78\n✉️ pierre.bernard@email.ch'),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.phone, color: Colors.green),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 8),
            
            // CONTACT 4
            Card(
              elevation: 2,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: const Text('Sophie Lemoine', 
                  style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('📱 +41 77 345 67 89\n✉️ sophie.lemoine@email.ch'),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.phone, color: Colors.green),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 8),
            
            // CONTACT 5
            Card(
              elevation: 2,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: const Text('Thomas Petit', 
                  style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('📱 +41 79 456 78 90\n✉️ thomas.petit@email.ch'),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.phone, color: Colors.green),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}