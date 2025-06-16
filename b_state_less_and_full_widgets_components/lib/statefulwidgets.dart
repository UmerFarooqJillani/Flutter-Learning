import 'package:flutter/material.dart';

void main() => runApp(YellowBird());

class YellowBird extends StatefulWidget {
  const YellowBird({ super.key });

  @override
  State<YellowBird> createState() => _YellowBirdState();
}

class _YellowBirdState extends State<YellowBird> {
  @override
  Widget build(BuildContext context) {
    // return Container(color: const Color(0xFFFFE306));
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Hello, World!"),
        ),
      ),
    );
  }
}