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
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              currentAccountPicture: CircleAvatar(
                // backgroundImage: AssetImage(assetName),
                backgroundImage: NetworkImage(imgURL),
              ),
            ),
          ),
          //-----------------------------------------------------------------
          ListTile(
            // leading: Image.network(imgURL),
            leading: Icon(Icons.home, color: Colors.amber,),
            title: Text("Home"),
            subtitle: Text("Click to go the Home Screen"),
          ),
        ],
      ),
    );
  }
}
