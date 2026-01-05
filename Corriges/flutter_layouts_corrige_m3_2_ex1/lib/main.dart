import 'package:flutter/material.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Expanded 1:2:1')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // 1️⃣ SECTION 1 (1/6 ≈ 16.7%)
              Expanded(
                flex: 1,
                child: Container(height: 150, color: Colors.red),
              ),

              const SizedBox(width: 8),

              // 2️⃣ SECTION 2 (2/6 ≈ 33.3%)
              Expanded(
                flex: 2,
                child: Container(height: 150, color: Colors.blue),
              ),

              const SizedBox(width: 8),

              // 3️⃣ SECTION 3 (2/6 ≈ 33.3%)
              Expanded(
                flex: 2,
                child: Container(height: 150, color: Colors.yellow),
              ),

              const SizedBox(width: 8),
              // 4️⃣ SECTION 4 (1/6 ≈ 16.7%)
              Expanded(
                flex: 1,
                child: Container(height: 150, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
