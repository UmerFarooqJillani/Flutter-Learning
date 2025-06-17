import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterApp(), // A StatefulWidget
    );
  }
}

// Step 1: Create StatefulWidget
class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState(); // Links to state class
}

// Step 2: Create State class
class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++; // Triggers UI rebuild
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateful Widget Example")),
      body: Center(
        child: Text(
          'Counter: $_counter',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}


