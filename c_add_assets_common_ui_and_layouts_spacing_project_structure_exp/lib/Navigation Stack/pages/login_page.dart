import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page"),
      // leading: Icon(Icons.import_contacts_rounded),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/dashboard');
            // Navigator.pushReplacementNamed(context, '/dashboard');
          }, 
          child: Text('Login to Dashboard'),
        ),
      ),
    );
  }
}
