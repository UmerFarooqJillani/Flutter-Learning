import 'package:flutter/material.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Center(
          child: ElevatedButton(
            child: Text('Home'),
            onPressed: () {
              // Navigator.pushNamed(context, '/myapp');  // Learn Later
              // same as the below working
              Navigator.pushNamed(context, '/');
            },
          ),
        ),
      ),
    );
  }
}
