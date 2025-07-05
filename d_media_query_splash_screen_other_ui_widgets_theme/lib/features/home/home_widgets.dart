import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final imgURL =
      'https://img.freepik.com/premium-photo/young-man-isolated-blue_1368-124991.jpg?semt=ais_hybrid&w=740';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: const Color.fromARGB(255, 228, 47, 47),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            // margin: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text("Umer Farooq Jillani"),
              accountEmail: Text("umerfarooqjillani92@gmail.com"),
              decoration: BoxDecoration(color: Colors.amber),
              currentAccountPicture: CircleAvatar(
                // backgroundImage: AssetImage(assetName),
                backgroundImage: NetworkImage(imgURL),
              ),
            ),
          ),
          //-----------------------------------------------------------------
          ListTile(
            // leading: Image.network(imgURL),
            leading: Icon(Icons.home, color: Colors.amber),
            title: Text("Home"),
            subtitle: Text("Click to go the Home Screen"),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5.0,
      title: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome back',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Hasnat!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      centerTitle: false,
      // flexibleSpace: FlexibleSpaceBar(
      //   // Widget like FlexibleSpaceBar for background/title
      //   title: Text('Collapsing Title'),
      //   background: Image.asset('assets/images/i.png', fit: BoxFit.cover),
      // ),
      leading: Builder(
        builder:
            (context) => // Needed to access Scaffold.of(context)
            Padding(
              padding: EdgeInsets.zero,
              child: IconButton(
                icon: Image.asset("assets/images/a_song.png"),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // 👈 Open drawer manually
                },
              ),
            ),
      ),
      actions: [
        // IconButton(
        //   onPressed: () {
        //     print("object");
        //   },
        //   icon: Icon(Icons.notifications_none_rounded),
        // ),
        Stack(
          children: [
            IconButton(
              onPressed: () {
                print("object");
              },
              icon: Icon(Icons.notifications_none_rounded),
            ),
            Positioned(
              right: 10,
              // top: ,
              bottom: 23,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // 56.0 By default
  // Size get preferredSize => Size.fromHeight(80.0);
}