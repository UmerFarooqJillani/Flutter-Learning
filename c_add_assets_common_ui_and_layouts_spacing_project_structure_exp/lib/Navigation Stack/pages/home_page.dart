import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text("Welcom to HomePage", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login', arguments: Text("data"),);
              },
              child: Text('Go to Login'),
            ),
          ],
        ),
      ), 
    );
  }
}
