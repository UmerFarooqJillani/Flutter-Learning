import 'package:flutter/material.dart';

class SongPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Text("Hello, I'm Umer Farooq Jillani"),
      ),
      //---------------------------------------------------------------------------
      //---------------------------------------------------------------------------
      //---------------------------------------------------------------------------
      //---------------------------------------------------------------------------
    );
  }
}
