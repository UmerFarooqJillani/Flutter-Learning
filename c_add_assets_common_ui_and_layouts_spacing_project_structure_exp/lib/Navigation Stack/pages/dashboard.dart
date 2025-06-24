import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // go back
            // Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: Text('Back to Login'),
        ), 
      ),
    );
  }
}
