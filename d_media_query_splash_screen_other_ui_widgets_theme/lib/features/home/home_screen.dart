import 'package:flutter/material.dart';
import '../../data/alphabet_data.dart';
import 'home_widgets.dart';

class HomePage extends StatelessWidget {
  List<Map<String, String>> songsList = [
    {
      'name': 'a',
      'path': '../../assets/images/a.png',
      'description': ' A is for Apple, shiny and red...',
    },
    {
      'name': 'b',
      'path': '../../assets/images/b.png',
      'description': 'B is for Ball, bouncing so high',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Songs"),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
      ),
      drawer: MyDrawer(),
      body: ListView.separated(
        itemCount: alphabetList.length,
        itemBuilder: (context, index) {
          final item = alphabetList[index];
          return ListTile(
            title: Text(item.letter, style: TextStyle(
                color: Colors.black
              ),
              ),
              subtitle: Text(item.description),
              leading: Image.asset(item.imagePath),
              onTap: () {
                print("Hello $index");
              },
          );
        },
        // -------------------------------------------------
        // ListView.separated(
        //   itemCount: songsList.length,
        //   // -------------------------------------------------
        //   // In this case preferred this ...
        //   itemBuilder: (context, index) {
        //     final song = songsList[index]; // Extract Map at index
        //     return ListTile(
        //       title: Text(song['name'] ?? '', style: TextStyle(
        //         color: Colors.black
        //       ),), // Null-safe access
        //       subtitle: Text(song['description'] ?? ''),
        //       leading: Image.asset(song['path'] ?? '../assets/images/a.png'),
        //       onTap: () {
        //         print("Hello $index");
        //       },
        //     );
        //   },
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
