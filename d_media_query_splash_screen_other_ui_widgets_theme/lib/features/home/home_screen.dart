import 'package:flutter/material.dart';
import '../../data/alphabet_data.dart';
import 'home_widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: ListView.separated(
        itemCount: alphabetList.length,
        itemBuilder: (context, index) {
          final item = alphabetList[index];
          return ListTile(
            title: Text(
              item.letter,
              style: TextStyle(
                // color: Colors.black
              ),
            ),
            subtitle: Text(item.description),
            leading: Image.asset(item.imagePath),
            // trailing: ,   //visible on left of list item
            onTap: () {
              print("object: $index");
              Navigator.pushNamed(context, '/song');
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
      // --------------------------------------------------------------------------------------------
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(), // 👈 Ensures it stays circular
        // shape: RoundedRectangleBorder(
        //   // This makes it square/rounded
        //   borderRadius: BorderRadius.circular(32),
        // ),
        backgroundColor: Colors.orange,
        // mini: true, // 👈 Mini circular FAB
        child: Image.asset("assets/images/scaner.png"),
      ),
    );
  }
}
