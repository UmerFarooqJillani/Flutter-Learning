import 'package:flutter/material.dart';

void main() => runApp(Dashboard());

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Dashboard')),
        body: Center(
          child: ElevatedButton(
            child: Text('Login'),
            onPressed: () {
              Navigator.pushNamed(context, '/login'); // Learn Later
            },
          ),
        ),
      ),
    );
  }
}
