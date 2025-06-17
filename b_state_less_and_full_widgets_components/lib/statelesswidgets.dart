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
          title: const Text('Umer Farooq Jillan'),
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
                decoration: BoxDecoration(color: const Color.fromARGB(255, 140, 157, 255)),
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
            'Welcome to Umer!',
            style: TextStyle(fontSize: 24),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.indigo,
          child: Icon(Icons.qr_code_scanner),
        ),

        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.headphones),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),

        bottomSheet: Container(
          height: 100,
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