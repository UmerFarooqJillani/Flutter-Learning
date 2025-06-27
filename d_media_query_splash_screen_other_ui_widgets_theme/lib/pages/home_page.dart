import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  List<Map<String, String>> songsList = [
    {
      'name': 'a',
      'path': '../assets/images/a.png',
      'description': 'click to more details',
    },
    {
      'name': 'b',
      'path': '../assets/images/b.png',
      'description': 'click to more details',
    },
    {
      'name': 'c',
      'path': '../assets/images/c.png',
      'description': 'click to more details',
    },
    {
      'name': 'a',
      'path': '../assets/images/a.png',
      'description': 'click to more details',
    },
    {
      'name': 'a',
      'path': '../assets/images/a.png',
      'description': 'click to more details',
    },
    {
      'name': 'a',
      'path': '../assets/images/a.png',
      'description': 'click to more details',
    },
    {
      'name': 'a',
      'path': '../assets/images/a.png',
      'description': 'click to more details',
    },
    {
      'name': 'a',
      'path': '../assets/images/a.png',
      'description': 'click to more details',
    },
    {
      'name': 'a',
      'path': '../assets/images/a.png',
      'description': 'click to more details',
    },
    {
      'name': 'a',
      'path': '../assets/images/a.png',
      'description': 'click to more details',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pandding"),
        // leading: Icon(Icons.menu),
      ),
      drawer: MyDrawer(),
      body: ListView.separated(
        itemCount: 10,
        // -------------------------------------------------
        // preferred this
        itemBuilder: (context, index) {
          final song = songsList[index]; // Extract Map at index
          return ListTile(
            title: Text(song['name'] ?? ''), // Null-safe access
            subtitle: Text(song['description'] ?? ''),
            leading: Image.asset(song['path'] ?? '../assets/images/a.png'),
          );
        },
        // -------------------------------------------------
        // itemBuilder: (context, index) {
        //   return ListTile(
        //     // title: Text(songsList[index]['name'] ?? ''), // Null-safe access
        //     title: Text(songsList[index]['name']!), // Null-safe access
        //     subtitle: Text(songsList[index]['description']!),
        //     leading: Image.asset(songsList[index]['path']!),
        //   );
        // },
        // -----------------------------------------------------
        separatorBuilder: (context, index) =>
            Divider(color: const Color.fromARGB(106, 186, 186, 186)),
      ),
    );
  }
}
