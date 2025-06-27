import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        // leading: Icon(Icons.menu),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
          decoration: BoxDecoration(),
          child: Text("My App"),
        ),
      ),
    );
  }
}
