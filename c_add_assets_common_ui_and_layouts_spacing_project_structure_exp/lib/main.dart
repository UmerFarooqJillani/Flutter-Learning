import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Image.asset(
          'assets/images/Asset_18.png',
          width: 200,
          height: 200,
          fit: BoxFit.fitWidth, // or BoxFit.contain, BoxFit.fill etc.
        ),
      ),
    );
  }
}
