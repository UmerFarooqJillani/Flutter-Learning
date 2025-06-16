import 'package:flutter/material.dart';

/*
--> Material widgets
  Material Widgets is a Flutter widgets are UI components that follow Google’s Material 
  Design (used in Android and cross-platform apps). These are ready-made building blocks to create modern UI.
  This imports Flutter’s Material Design library, which includes pre-built(built-in) widgets like:
    - MaterialApp          --> Root app setup with theme/navigation
    - Scaffold             --> Provides page layout structure
    - AppBar               --> Top bar with title/menu
    - Text                 --> Display Text
    - ElevatedButton       --> Raised button
    - FloatingActionButton --> Circular action button
  It acts as the root widget for your app’s UI when using Material Design.
*/
void main() => runApp(MyApp());

/*
--> runApp(MyApp())
  This is the starting point of every Flutter app, just like main() in other programming languages.
  - runApp() is a built-in Flutter function that:
    - Initializes the app.
    - It requires a widget as input (usually your app’s root).
    - Attaches it to the screen.
    - Starts rendering your UI.
  - MyApp() is a custom widget (you define it).
    - It must extend either:
      - StatelessWidget → if the UI doesn't change.
      - StatefulWidget → if the UI updates (e.g., button clicks, text input).

--> How the process works step by step
  1- You call runApp().
  2- It tells the Flutter engine to launch the app.
  3- It inserts MyApp into the screen.
  4- MyApp.build() returns a widget (e.g. MaterialApp).
  5- The Flutter framework builds a widget tree, followed by an element tree and render tree.
  6- You see the UI on screen.
*/

/*
--> How to Use StatelessWidget
    Step-by-step:
      - Create a class
      - Extend it from StatelessWidget
      - Override the build() method
      - Return UI from build()
*/

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("Umer Farooq Jillani"),
        ),
      ),
    );
  }
}

