import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Flutter App'),
          backgroundColor: Colors.indigo,
          leading: Icon(Icons.menu), // top-left icon
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),

        drawer: Drawer( // Left-side drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.indigo),
                child: Text('Menu', style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Profile'),
                onTap: () {},
              ),
            ],
          ),
        ),

        endDrawer: Drawer( // Right-side drawer
          child: Center(child: Text("Right Drawer")),
        ),

        body: Center(
          child: Text(
            'Welcome to Flutter!',
            style: TextStyle(fontSize: 24),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.indigo,
          child: Icon(Icons.add),
        ),

        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),

        bottomSheet: Container(
          height: 50,
          color: Colors.indigo,
          child: Center(
            child: Text('Bottom Sheet',
                style: TextStyle(color: Colors.white)),
          ),
        ),

        backgroundColor: Colors.grey[200],

        resizeToAvoidBottomInset: true, // true = adjust for keyboard
      ),
    );
  }
}



/*
----------------------------------------------------------------------
--> Why do we extend the 'Statelesswidget'
    In Dart, to inherit behavior from a class, we use extends.
      'MyApp' is a widget that has no state, and I want Flutter to manage and build it like:
            StatelessWidget
      This gives us access to the build() method which Flutter needs to call to render the UI.
----------------------------------------------------------------------
--> StatelessWidget Internal Architecture
      Widget Tree (Code Layer)
          ↓
      StatelessWidget
          ↓
      Element (StatelessElement)
          ↓
      RenderObject (e.g. RenderParagraph for Text)
----------------------------------------------------------------------
--> When to Use 'StatelessWidget'
    - The widget doesn’t depend on user input
    - It doesn’t change during runtime
    - It just returns UI
----------------------------------------------------------------------
--> Components of StatelessWidget
----------------------------------------------------------------------
    -> 'class MyApp extends StatelessWidget'
        - You are creating a custom widget named 'MyApp'.
        - You 'extend StatelessWidget' because this widget’s output doesn’t change.
        - Every custom widget in Flutter must extend either StatelessWidget or StatefulWidget.
-----------
    -> 'const MyApp({super.key})'
        - A constructor.
        - 'const' makes the widget compile-time constant (more efficient).
        - A 'Key' is used to uniquely identify widgets in the widget tree.
        - It helps Flutter compare old vs new widgets during rebuilds.
        - 'super.key' passes the key to the base class for widget identification and optimization.
        - '{}' The parameter 'key' is optional, not required.
          The caller can write 'MyApp(key: someKey)' or just 'MyApp()'
-----------       
    -> 'Widget build(BuildContext context) {}' 
        - Every widget must override the build method.
        - This method returns the UI widget tree. 
        - 'build()' gets called when Flutter needs to render this widget.
        - 'BuildContext context' It's the link to the widget tree above this widget.
            With it, you can access theme, media queries, or ancestor widgets.
        - 'context'  Provides info about location in the widget tree.
-----------
    -> 'MaterialApp()'
        - Wraps your whole app with Material Design environment (e.g., themes, routing, Directionality).
-----------
    -> 'debugShowCheckedModeBanner: false'
        - Removes the red "DEBUG" banner (a banner appears to indicate you're not in production)
        - Setting this to false in MaterialApp hides that banner.
-----------
    -> 'home: '
        - home is a named parameter of the MaterialApp widget.
        - It defines the first screen (or main route) of your app.
        - It is the entry point widget when the app loads.
-----------
    -> 'Scaffold()' Complete Structure
        'Scaffold' is a layout skeleton provided by Material Design that gives a structure like: 
          Scaffold(
            appBar: AppBar(...),            // Header bar
            body: Center(...),              // Main content
            drawer: Drawer(...),            // Left side navigation
            endDrawer: Drawer(...),         // Right side navigation
            floatingActionButton: FAB(...), // Circular action button
            bottomNavigationBar: ...,       // Bottom menu
            bottomSheet: ...,               // Permanent footer section
            backgroundColor: Colors.white,  // Page background
            resizeToAvoidBottomInset: true, // Adjust for keyboard
          )
        You wrap most of your app 'screens' in a Scaffold
-----------
    -> 
-----------
    -> 
-----------
    -> 
-----------
    -> 
-----------
*/