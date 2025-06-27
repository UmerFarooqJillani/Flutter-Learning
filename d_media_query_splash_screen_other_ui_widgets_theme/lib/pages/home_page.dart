import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pandding"),
        // leading: Icon(Icons.menu),
      ),
      drawer: MyDrawer(),
      body: ListView.separated(
          itemCount: 26,
          itemBuilder: (context, index) => ListTile(title: Text("Hello")),
          separatorBuilder: (context, index) => Divider(color: const Color.fromARGB(255, 216, 17, 17)),
        ),
    );
  }
}
