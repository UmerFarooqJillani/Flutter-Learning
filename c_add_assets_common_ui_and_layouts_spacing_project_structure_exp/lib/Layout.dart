import 'package:flutter/material.dart';

void main() {
  runApp(Layout());
}

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //------------------------------------------------------------------------------
        /*
        body: Container(
          width: 200,    // 	Size constraints
          height: 100,   // 	Size constraints
          margin: EdgeInsets.all(10),    // Space outside
          padding: EdgeInsets.all(16),   // Space inside
          alignment: Alignment.center,  // Aligns child within container
          decoration: BoxDecoration(     // Add borders, gradients, shadows
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey)],
          ),
          child: Text('Container', style: TextStyle(color: Colors.white)),
          // transform --> Rotate, scale, skew
        ),
        */
        //------------------------------------------------------------------------------
        // body: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisSize: MainAxisSize.min, // Widget takes only the space needed by its children
        //   children: [
        //     Icon(Icons.home),
        //     Icon(Icons.favorite),
        //     Icon(Icons.settings),
        //   ],
        // ),
        //------------------------------------------------------------------------------
        // body: Flex(
        //   direction: Axis.horizontal,
        //   mainAxisAlignment: MainAxisAlignment.spaceAround ,
        //   children: [
        //     Icon(Icons.access_alarm),
        //     Icon(Icons.backup),
        //     Icon(Icons.camera),
        //   ],
        // ),
        //------------------------------------------------------------------------------
        // body: Flex(
        //   direction: Axis.horizontal,
        //   children: [
        //     Expanded(
        //       /*
        //       Direction is static ---> Use Row / Column
        //       Direction is dynamic (user setting, orientation) ---> Use Flex
        //       */
        //       flex: 2, // The first Container gets 2/3 of the width
        //       child: Container(color: Colors.red, height: 50),
        //     ),
        //     Expanded(
        //       flex: 1, // The second gets 1/3
        //       child: Container(color: Colors.green, height: 50),
        //     ),
        //   ],
        // ),
        //------------------------------------------------------------------------------
        /*
        body: Stack(
          // fit:
          // The fit property controls how non-positioned children should be sized
          // relative to the Stack’s size.
          // fit: StackFit.expand, // Forces non-positioned children to fill the entire Stack (match parent's size)
          fit: StackFit
              .loose, // (Default) Non-positioned children can be any size they want.
          clipBehavior: Clip
              .none, //(If need to learn otherwise ignore)The clipBehavior defines how to clip children that overflow the Stack’s bounds.
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ), // fixed size
            Positioned(
              bottom: 10,
              right: 10,
              child: Icon(Icons.star, color: Colors.white),
            ),
          ],
        ),
        */
        //------------------------------------------------------------------------------
        // body: ListView(
        //   children: [
        //     ListBody(
        //       children: [
        //         Row(
        //           children: [
        //             Padding(padding: EdgeInsets.only(left: 10.0)),
        //             Column(children: [Icon(Icons.autorenew_sharp)]),
        //             SizedBox(width: 20),
        //             Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Row(
        //                   children: [
        //                     Text(
        //                       "A",
        //                       style: TextStyle(
        //                         fontSize: 20,
        //                         fontWeight: FontWeight.bold,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 Row(
        //                   children: [
        //                     Text(
        //                       "A is is the text of alphabet",
        //                       style: TextStyle(fontSize: 12),
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //     ListTile(title: Text("Item 2")),
        //     ListTile(title: Text("Item 3")),
        //   ],
        // ),
        //------------------------------------------------------------------------------
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: 
          (context, index) {
            return ListTile(title: Text("Item $index"));
          },
        ),
      ),
    );
  }
}
