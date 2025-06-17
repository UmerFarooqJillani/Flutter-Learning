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
          // backgroundColor: Colors.indigo,
          leading: Icon(Icons.menu), // top-left icon
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
// ------------------------------------------------------------------
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
// ------------------------------------------------------------------
        endDrawer: Drawer( // Right-side drawer
          child: Center(child: Text("Right Drawer")),
        ),
// ------------------------------------------------------------------
        body: Center(
          child: Text(
            'Welcome to Flutter!',
            style: TextStyle(fontSize: 24),
          ),
        ),
// ------------------------------------------------------------------
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          // backgroundColor: Colors.indigo,
          child: Icon(Icons.add),
        ),
// ------------------------------------------------------------------
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
// ------------------------------------------------------------------
        bottomSheet: Container(
          height: 50,
          color: Colors.yellow,
          child: Center(
            child: Text('Bottom Sheet',
                style: TextStyle(color: Colors.black)),
          ),
        ),
// ------------------------------------------------------------------
        backgroundColor: Colors.white,
// ------------------------------------------------------------------
        resizeToAvoidBottomInset: true, // true = adjust for keyboard
      ),
    );
  }
}