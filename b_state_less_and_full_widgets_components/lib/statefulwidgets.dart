import 'package:flutter/material.dart';
import './pages/dashboard.dart';
import './pages/login_page.dart';

void main() => runApp(MyApp());

// 1. Root widget (Stateless)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stateful Demo',
      // home: CounterWidget(), // This is a Home route||you use only one home: or '/' becaise both are same
      /*
      -> You're telling Flutter:
          Hey, when the app starts, show the UI defined in 
          CounterWidget first.
      -> if I replace home: with something else?
          import 'package:my_app/login_page.dart'; // Your file path
          return MaterialApp(
            home: LoginPage(),  // <- Now app starts from login page instead
          );
          more in below...
      */
      initialRoute: '/',
      routes: {
        '/': (context) => _CounterWidget(), // ('/' means Home route)
        '/myapp': (context) => MyApp(), // same as the above working
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => Dashboard(),
      },

      /*
       --> Code structuring in flutter
            - Make the folder for APP pages/screens, Folder name
              must be pages/screens
            - make the 'login_page.dart' to move the folder 
      */
      /* 
      -> When Should You Replace 'home':
          - Use home: for single-screen apps or simple apps.
          - For multi-screen apps, you might prefer initialRoute: + routes

      -> What Are 'initialRoute:' and 'routes:' in Flutter
        - Flutter uses named routes to navigate between screens (pages).

      -> initialRoute:
        - The route (screen) to show first when app launches

      -> routes:
        - A map of route names to the widgets (screens) you want to show

      -> '/login'
        - A string key representing a named route

      -> (context) => LoginPage()	
        - 'context' provide the infomation about location in a widget tree
        - A function that returns the screen for the route
        
      -> Visual Architecture: 
        MaterialApp      
        ├── initialRoute: '/login'
        └── routes:
              ├── '/login' → LoginPage()
              └── '/dashboard' → Dashboard()
      */
    );
  }
}

// 2. StatefulWidget - describes the widget config
class _CounterWidget extends StatefulWidget { 
  @override
  CounterWidgetState createState() => CounterWidgetState(); 
  // createState() --> Creates the associated State class
}

// 3. State class - manages the mutable state
class CounterWidgetState extends State<_CounterWidget> {
  int _counter = 0;

  // Called when widget is inserted in the widget tree
  @override
  void initState() {
    //initState() --> Called once when the widget is inserted
    super.initState();
    print("State Initialized");
  }

  // Trigger UI rebuild
  void _incrementCounter() {
    setState(() {
      // setState() --> Triggers UI rebuild with new state
      _counter++;
    });
  }

  // Build method rebuilds the UI on setState
  @override
  Widget build(BuildContext context) {
    // build() --> Called every time UI needs to be rebuilt
    return Scaffold(
      appBar: AppBar(title: Text('StatefulWidget Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter:', style: TextStyle(fontSize: 20)),
            Text('$_counter', style: TextStyle(fontSize: 30)),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Increment'),

              // used to check the routers
              // onPressed: () {
              //   _incrementCounter;
              //   Navigator.pushNamed(context, '/dashboard');
              // },
              // child: Text('DashBoard'),
            ),
          ],
        ),
      ),
    );
  }

  // Called when widget is removed from the tree
  @override
  void dispose() {
    // dispose() --> Cleanup when widget is removed
    //           --> CALLED ONCE (when widget removed)
    super.dispose();
    print("State Disposed");
  }
}

/*
--> Flutter Rebuild Flow
      User clicks FAB
             │
             ▼
      Trigger setState()
             │
             ▼
      Flutter calls build()
             │
             ▼
      New widget tree rendered
             │
             ▼
      Updated UI on screen
*/
