/* 
--> MediaQuery
    - MediaQuery is a Flutter widget and class that allows you to get information about 
      the size and orientation of the current device screen.
    - It provides:
        - Screen width/height
        - Orientation (portrait or landscape)
        - Device pixel ratio
        - System UI padding (status bar, notch)
        - Text scaling factor
        - And more…

    Basic Syntax:
       MediaQuery.of(context).size

    Example to get screen width:
       double screenWidth = MediaQuery.of(context).size.width;
*/

import 'package:flutter/material.dart';

void main() => runApp(MediaQueryExample());

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    // ---------------------01-(Width and height of screen)-------------------------
    // final size = MediaQuery.of(context).size; // screen size
    // final width = size.width;
    // final height = size.height;
    // ---------------------02-(Width and height of screen)-------------------------
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    // ---------------------03-(Adjust UI Based on Orientation)-------------------------
    // Orientation orientation = MediaQuery.of(context).orientation;
    // ---------------------04-(Adjust Padding for Notch/StatusBar)-------------------
    // Orientation orientation = MediaQuery.of(context).orientation;

    // EdgeInsets safePadding = MediaQuery.of(context).padding;
    //                         or
    // Different from padding, it doesn't shrink when keyboard appears.
    // EdgeInsets safePadding = MediaQuery.of(context).viewPadding;

    // ---------------------05-(devicePixelRatio)--------------------
    // final ratio = MediaQuery.of(context).devicePixelRatio;
    // ---------------------06-(viewInsets)--------------------
    // final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    // ---------------------07-(platformBrightness)----------------
    final brightness = MediaQuery.of(context).platformBrightness;
    // -------------------------------------------------

    return MaterialApp(
      // ---------------------01-(Width and height of screen)-------------------------
      // home: Scaffold(
      //   body: Center(
      //     child: Container(
      //       width: width * 0.8, // 80% of screen width
      //       height: height * 0.2,
      //       color: Colors.blue,
      //       child: Center(child: Text('Responsive Box')),
      //     ),
      //   ),
      // ),
      // ---------------------02-(Width and height of screen)-------------------------
      // home: Scaffold(
      //   appBar: AppBar(title: Text('MediaQuery Example')),
      //   body: Center(
      //     child: Text('Screen size: ${width.toInt()} x ${height.toInt()}'),
      //   ),
      // ),
      // ---------------------03-(Adjust UI Based on Orientation)-------------------------
      // home: Scaffold(
      //   body: Center(
      //     child: orientation == Orientation.portrait
      //         ? Text("Portrait Mode")
      //         : Text("Landscape Mode"),
      //   ),
      // ),
      // ---------------------04-(Adjust Padding for Notch/StatusBar)--------------------
      // Padding from system UI (status bar, notch, etc.)
      // home: Scaffold(
      //   body: Padding(
      //     padding: EdgeInsets.only(
      //       top: safePadding.top, // Status bar
      //       bottom: safePadding.bottom, // Navigation bar
      //       left: safePadding.left,
      //       right: orientation == Orientation.landscape ?  safePadding.right : 0.0,
      //     ),
      //     child: Container(
      //       color: Colors.amber,
      //       child: Center(
      //         child: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: TextFormField(
      //             decoration: InputDecoration(
      //               contentPadding: EdgeInsets.all(8.0),
      //               border: OutlineInputBorder(),
      //               labelText: "Try to enter something"
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      // ---------------------05-(devicePixelRatio)----------------
      // Represents the ratio of physical pixels to logical pixels on the device.
      // Why it's useful:
      //    - Helps in handling custom pixel-perfect images or canvas drawings.
      //    - Mostly relevant when you're doing low-level UI or custom painting.
      // home: Scaffold(
      //   appBar: AppBar(title: Text('devicePixelRatio')),
      //   body: Center(child: Text('Pixel Ratio: $ratio')),
      // ),
      // ---------------------06-(viewInsets)----------------
      // The part of the screen covered by the system UI, like the keyboard.
      // Why it's useful:
      //   - Detect when the keyboard is open.
      //   - Adjust padding/margin to avoid being hidden
      //   - It will automatically push the text field above the keyboard.

      // home: Scaffold(
      //   appBar: AppBar(title: Text("ViewInsets Example")),
      //   body: Padding(
      //     padding: EdgeInsets.only(
      //       bottom: bottomInset,
      //     ), // Push content above keyboard
      //     child: Center(
      //       child: TextField(
      //         decoration: InputDecoration(labelText: "Type something"),
      //       ),
      //     ),
      //   ),
      // ),
      // ---------------------07-(platformBrightness)----------------
      // Returns whether the system is using dark mode or light mode.
      // Why it's useful:
      //  - Dynamically switch themes (light/dark).
      //  - Apply dark-mode styles manually.
      // It helps you create a manual dark mode UI if not using Flutter's built-in theme switching.
      home: Scaffold(
        backgroundColor: brightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        appBar: AppBar(
          title: Text("Brightness: $brightness"),
          backgroundColor: brightness == Brightness.dark
              ? Colors.grey[900]
              : Colors.blue,
        ),
        body: Center(
          child: Text(
            brightness == Brightness.dark ? "Dark Mode" : "Light Mode",
            style: TextStyle(
              color: brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
      // -----------------------------------------------------------
    );
  }
}
