import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  List<Map<String, String>> songsList = [
    {
      'name': 'a',
      'path': '../assets/images/a.png',
      'description': ' A is for Apple, shiny and red...',
    },
    {
      'name': 'b',
      'path': '../assets/images/b.png',
      'description': 'B is for Ball, bouncing so high',
    },
    {
      'name': 'c',
      'path': '../assets/images/c.png',
      'description': 'C is for Cat, soft and sweet',
    },
    {
      'name': 'd',
      'path': '../assets/images/d.png',
      'description': 'D is for Dog, wagging its tail',
    },
    {
      'name': 'e',
      'path': '../assets/images/e.png',
      'description': 'click to more details',
    },
    {
      'name': 'f',
      'path': '../assets/images/f.png',
      'description': 'click to more details',
    },
    {
      'name': 'g',
      'path': '../assets/images/g.png',
      'description': 'click to more details',
    },
    {
      'name': 'h',
      'path': '../assets/images/h.png',
      'description': 'click to more details',
    },
    {
      'name': 'i',
      'path': '../assets/images/i.png',
      'description': 'click to more details',
    },
    {
      'name': 'j',
      'path': '../assets/images/j.png',
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
        // In this case preferred this ...
        itemBuilder: (context, index) {
          final song = songsList[index]; // Extract Map at index
          return ListTile(
            title: Text(song['name'] ?? '', style: TextStyle(
              color: Colors.black
            ),), // Null-safe access
            subtitle: Text(song['description'] ?? ''),
            leading: Image.asset(song['path'] ?? '../assets/images/a.png'),
            onTap: () {
              print("Hello $index");
            },
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
 
