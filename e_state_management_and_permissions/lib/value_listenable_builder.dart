import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ValueNotifier<int> counter = ValueNotifier<int>(
    0,
  ); // ✅ Step 1: ValueNotifier is initialized with 0
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Listenable Example")),
        body: Center(
          child: ValueListenableBuilder<int>(
            // ✅ Step 2: ValueListenableBuilder listens to the notifier, ValueListenableBuilder auto-rebuilds the widget
            valueListenable: counter,
            builder: (context, value, child) { 
              return Text(
                'Counter: $value',        
                style: TextStyle(fontSize: 32),
                // child:	Optional static child that doesn’t rebuild
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => counter
              .value++, // ✅ Step 3 When FAB is clicked, counter.value++ updates the value
        ),
      ),
    );
  }
}
