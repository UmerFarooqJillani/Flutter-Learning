/*
--> LayoutBuilder
    - LayoutBuilder is a widget that helps you build UI based on the size constraints 
      passed to it by its parent widget.
    - It provides a builder function that gives you BoxConstraints, which tell you:
      - The maximum width/height (maxWidth, maxHeight)
      - The minimum width/height (minWidth, minHeight)
    - You can use this to:
      - Change layouts based on screen/device size
      - Adjust spacing, widget visibility, arrangement, etc.
*/
import 'package:flutter/material.dart';

void main() {
  runApp(LayoutBuilderExample());
}

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // body: LayoutBuilder(
        //   builder: (context, constraints) {
        //     if (constraints.maxWidth < 600) {
        //       return Column(
        //         children: [Text('Small screen'), Icon(Icons.phone_android)],
        //       );
        //     } else {
        //       return Row(
        //         children: [Text('Large screen'), Icon(Icons.desktop_windows)],
        //       );
        //     }
        //   },
        // ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = 2;
            if (constraints.maxWidth > 600) crossAxisCount = 4;

            return GridView.count(
              crossAxisCount: crossAxisCount,
              children: List.generate(20, (index) {
                return Card(
                  color: Colors.amber,
                  child: Center(child: Text("Item $index")),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
