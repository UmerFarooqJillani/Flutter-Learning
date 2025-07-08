// second_screen.dart
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the arguments passed from the previous screen
    final args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: Text(
          "Received: $args",
          style: TextStyle(fontSize: 24),
        ),

      ),
    );
  }
}
