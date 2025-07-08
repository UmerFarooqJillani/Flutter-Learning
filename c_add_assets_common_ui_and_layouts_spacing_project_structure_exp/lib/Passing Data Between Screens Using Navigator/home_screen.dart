// home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // ----------------------------------------------
            // Passing Arguments with Named Routes
            // Navigate to second screen and send data
            Navigator.pushNamed(
              context,
              '/second',
              arguments: "Hello from Home!",
            );
            
          },
          child: Text("Go to Second Screen"),
        ),
      ),
    );
  }
}
