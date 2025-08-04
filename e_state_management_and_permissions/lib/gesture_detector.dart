// ------------------ Gestures (High Level) ----------------------------------------
// import 'package:flutter/material.dart';
// import 'dart:math';

// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(body: Detect()),
//     ),
//   );
// }

// class Detect extends StatefulWidget {
//   @override
//   State<Detect> createState() => _DetectState();
// }

// class _DetectState extends State<Detect> {
//   double _top = 0;
//   double _left = 0;
//   final double containerHeight = 300;
//   final double boxHeight = 100;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         height: containerHeight,
//         width: 200,
//         color: Colors.grey,
//         child: Stack(
//           children: [
//             Positioned(
//               top: _top,
//               left: _left,
//               child: GestureDetector(
//                 onPanStart: (details) {
//                   print('Pan started at ${details.globalPosition}');
//                 },
//                 onPanUpdate: (details) {
//                   setState(() {
//                     _top = max(0, min(containerHeight - boxHeight , _top + details.delta.dy));
//                     // print(_top);
//                     _left = max(0, min(100 , _left + details.delta.dx));
//                     // print(_left);
//                   });
//                 },
//                 onPanEnd: (details) {
//                   print('Pan ended');
//                 },
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.orange,
//                   child: Center(child: Text("Pan me")),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// ------------------ Pointer Events (Low Level) ----------------------------------------
/*
  --> event.position vs event.localPosition
      - event.position	
          The position of the finger is (x, y) on the full screen.
      - event.localPosition	
          The position of the finger inside the widget.

  --> Pointer Event Object Properties
      - When you touch the screen, Flutter gives you an event object with helpful information like:
        - position	
            Where the finger is (x, y) on the screen

        - localPosition	
            Where the finger is inside the widget

        - pointer	
            ID number of the finger (useful in multi-touch)

        - kind	
            Type of device (touch, mouse, stylus)

        - buttons	
            Which mouse button was used (if mouse)

        - pressure	
            How hard you're pressing (if supported)
        
*/
import 'package:flutter/material.dart';

void main() {
  runApp(PointerApp());
}

class PointerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PointerHomePage());
  }
}

class PointerHomePage extends StatelessWidget {
  const PointerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pointer Event Example')),
      body: Center(
        child: Listener(
          onPointerDown: (event) {  // start pointer
            print('👆 Pointer Down at: ${event.position}');
            print("Finger ID: ${event.pointer}");
          },
          onPointerMove: (event) {   // capture the moving of pointer
            print("Moving:");
            print("→ Position: ${event.position}");
            print("→ Delta: ${event.delta}");
            print("→ Device Type: ${event.kind}");
          },
          onPointerUp: (event) {
            // end pointer
            print('✋ Pointer Up at: ${event.position}');
          },
          child: Container(
            height: 200,
            width: 200,
            color: Colors.lightGreenAccent,
            alignment: Alignment.center,
            child: Text('Touch me'),
          ),
        ),
      ),
    );
  }
}
