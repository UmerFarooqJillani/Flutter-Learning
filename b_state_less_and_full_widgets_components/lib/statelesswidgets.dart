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
          title: const Text('MyName'),
          centerTitle: true,
          // backgroundColor: Colors.white,
          leading: Icon(Icons.menu), // top-left icon
          actions: [
            //Top-right icon
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Search tapped');
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                print('Settings tapped');
              },
            ),
          ],
          elevation: 4.0, // add the drop shadow below the AppBar
          flexibleSpace: Container(
            // add a custom background layer
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 200, 207, 248),
                  const Color.fromARGB(255, 254, 254, 254),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          bottom: PreferredSize(
            // add a widget below the AppBar
            preferredSize: Size.fromHeight(50.0), // Required height
            child: Container(
              height: 50.0,
              color: const Color.fromARGB(255, 233, 236, 253),
              child: Center(child: Text('Welcome to the App')),
            ),
          ),
        ),
        /*
--> appBar:	
    - Header bar with title, icons, menus
    Property:
      - title:	
        The text title of the AppBar	
        e.g: 
          Text('My App')
  --------------------------
      - leading: 
        Widget on the left (e.g., menu icon)	
        e.g: 
          Icon(Icons.menu)
  --------------------------
      - actions:	
        Widgets on the right (e.g., icons)
        e.g: 
        	actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Search tapped');
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                print('Settings tapped');
              },
            ),
          ]
  --------------------------
      - centerTitle:	
        Center align the title	
        e.g: 
          true/false
  --------------------------
      - elevation: 
        . Adds a drop shadow below the AppBar to give it visual depth.
        . Useful for separating the AppBar visually from the body.
        e.g: 
          elevation: 4.0 // default is 4.0; use 0.0 for flat
  --------------------------
      - flexibleSpace: 
        flexibleSpace allows you to add a custom background layer to the AppBar, such as:
          . Gradients
          . Images
          . Animated backgrounds
          . Decorations
        It sits behind the AppBar’s title, icons, and other contents.
    or
      - flexibleSpace: (Adding an Image Background)
        . You can also set a background image using 'DecorationImage'.
        . You want to match branding (e.g., app uses a hero image (the full-screen video, photo, illustration, 
          or banner that welcomes visitors) as top bar)
        . Used with SliverAppBar for advanced scroll effects (e.g., collapsing header)
        . collapsing header : A user interface element that either shrinks or expands in size based on user 
          interaction, typically scrolling
        e.g: 
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/appbar_bg.jpg'), // Image in assets folder
                fit: BoxFit.cover,
              ),
            ),
          ),
  --------------------------
      - 'bottom:' in AppBar
        . bottom lets you add a widget below the AppBar's main row, such as:
          - Tab bars
          - Subtitles
          - Action sections
        . It is always wrapped in a PreferredSize because Flutter needs to know its height.
        . You can add any widget here like TabBar, Text, or even Row, Icons, etc.
        e.g:
          bottom: TabBar(
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Settings"),
            ],
          ),
  --------------------------
*/
        // ------------------------------------------------------------------
        drawer: Drawer(
          // Left-side drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.indigo),
                child: Text('Menu', style: TextStyle(color: Colors.white)),
              ),
              ListTile(title: Text('Home'), onTap: () {}),
              ListTile(title: Text('Profile'), onTap: () {}),
            ],
          ),
        ),
        /*
--> drawer:
. Left-side navigation drawer (hamburger menu).
. To show user account info, settings, and app options.
*/
        // ------------------------------------------------------------------
        endDrawer: Drawer(
          // Right-side drawer
          child: Center(child: Text("Right Drawer")),
        ),
        /**
--> endDrawer:	
Right-side navigation drawer
*/
        // ------------------------------------------------------------------
        body: Center(
            child: Text('Welcome to User!', style: TextStyle(fontSize: 24)),
          ),
        /*
--> body:
    - Main screen content
    common components and widgets:
      - Center(child: ...)
        . Centers a single widget in the available space.
        . Used when you want to place something in the middle of the screen.
        e.g: 
          body: Center(
            child: Text('Welcome to User!', style: TextStyle(fontSize: 24)),
          ),
  --------------------------
*/
        // ------------------------------------------------------------------
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          // backgroundColor: Colors.indigo,
          child: Icon(Icons.qr_code_scanner),
        ),
        /**
--> floatingActionButton:	
    . Circular button that floats above content
*/
        // ------------------------------------------------------------------
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
        /*
--> bottomNavigationBar:	
Menu/navigation bar at the bottom
*/
        // ------------------------------------------------------------------
        bottomSheet: Container(
          height: 50,
          color: const Color.fromARGB(39, 255, 235, 59),
          child: Center(
            child: Text('Bottom Sheet', style: TextStyle(color: Colors.black)),
          ),
        ),
        /**
--> bottomSheet:	
Persistent or temporary panel at the bottom of the screen 
*/
        // ------------------------------------------------------------------
        backgroundColor: Colors.white,
        /* 
--> backgroundColor:	
Background color for the page
*/
        // ------------------------------------------------------------------
        resizeToAvoidBottomInset: true, // true = adjust for keyboard
        /*
--> resizeToAvoidBottomInset:	
- Whether to resize body when keyboard appears
- true (recommended when TextFields are present)
*/
      ),
    );
  }
}