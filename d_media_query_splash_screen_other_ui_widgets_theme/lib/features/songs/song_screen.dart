import 'package:d_media_query_splash_screen_other_ui_widgets_theme/data/alphabet_data.dart';
import 'package:d_media_query_splash_screen_other_ui_widgets_theme/widgets/bottom_menu/bottom_bar.dart';
import 'package:flutter/material.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // isSelectIndex -= 1; 
      ),
      // body: Container(
      //   height: 300,
      //   width: 400,
      //   color: const Color.fromARGB(255, 115, 247, 92),
      //   child: Container(
      //     // Parent inforce the child container to expand according to my size
      //     color: Colors.brown,
      //     height: 20,
      //     width: 20,
      //     child: Text("Hello"),
      //   ),
      // ),
      //---------------------------------------------------------------------------
      // body: Container(
      //   color: const Color.fromARGB(255, 255, 195, 117),
      //   constraints: BoxConstraints(
      //     maxHeight: 300,
      //     minHeight: 50,
      //     maxWidth: 300,
      //     minWidth: 50,
      //   ),
      //   child: Container(
      //     height: 80,
      //     width: 80,
      //     color: const Color.fromARGB(255, 255, 145, 0),
      //     ),
      // ),
      //---------------------------------------------------------------------------
      // body: ConstrainedBox(
      //   constraints: BoxConstraints(
      //     minWidth: 100,
      //     maxWidth: 400,
      //     minHeight: 50,
      //     maxHeight: 100,
      //   ),
      //   child: Container(
      //     color: Colors.orange,
      //     child: const Text('Hello World'),
      //   ),
      // ),
      //---------------------------------------------------------------------------
      // body: UnconstrainedBox(
      //   child: Container(width: 400, height: 200, color: Colors.red),
      // ),
      //---------------------------------------------------------------------------
      body: ListView.separated(
        shrinkWrap: true,
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
      //---------------------------------------------------------------------------
      bottomNavigationBar: MyBottomBar(),
      //---------------------------------------------------------------------------
      //---------------------------------------------------------------------------
    );
  }
}
