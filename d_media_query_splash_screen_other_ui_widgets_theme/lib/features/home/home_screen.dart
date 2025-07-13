import 'package:flutter/material.dart';
import 'home_widgets.dart';
import '../../widgets/bottom_menu/bottom_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, String>> songsList = [
    {
      'name': 'a',
      'path': '../../assets/images/a.png',
      'description': ' A is for Apple, shiny and red...',
    },
    {
      'name': 'b',
      'path': '../../assets/images/b.png',
      'description': 'B is for Ball, bouncing so high',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: MyBody(),
      // --------------------------------------------------------------------------------------------
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   shape: CircleBorder(), // 👈 Ensures it stays circular
      //   // shape: RoundedRectangleBorder(
      //   //   // This makes it square/rounded
      //   //   borderRadius: BorderRadius.circular(32),
      //   // ),
      //   backgroundColor: Colors.orange,
      //   // mini: true, // 👈 Mini circular FAB
      //   child: Image.asset("assets/images/scaner.png"),
      // ),
      // --------------------------------------------------------------------------------------------
      // If you want precise control over FAB size, shape, tap radius, and image fitting, the best and
      // cleanest method is using RawMaterialButton (or InkWell with ClipOval) like
      // --------------------------------------------------------------------------------------------
      floatingActionButton: RawMaterialButton(
        onPressed: () {
          // Your action here
        },
        // fillColor: Colors.white,
        // elevation: 6.0,
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(
          width: 75.0, // FAB width
          height: 75.0, // FAB height
        ),
        child: Image.asset(
          'assets/images/scaner.png',
          height: 65, // your icon height
          width: 65, // your icon width
          fit: BoxFit.contain,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //---------------------------------------------------------------------------------------------
      bottomNavigationBar: MyBottomBar(),
      //---------------------------------------------------------------------------------------------
    );
  }
}
