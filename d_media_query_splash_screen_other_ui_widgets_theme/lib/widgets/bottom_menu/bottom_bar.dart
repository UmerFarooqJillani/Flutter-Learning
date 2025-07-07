import 'package:flutter/material.dart';
import 'bottom_bar_controller.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      height: 56.0,
      notchMargin: 8.0,
      elevation: 10.0,
      shape: const CircularNotchedRectangle(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(icon: Image.asset("assets/images/home.png", color: Colors.amber,), onPressed: () {}, padding: EdgeInsets.zero,),
            IconButton(icon: Image.asset("assets/images/songs.png", color: Colors.amber, ), onPressed: () {}, padding: EdgeInsets.zero,),
            SizedBox(height: 40, width: 40,),
            IconButton(icon: Image.asset("assets/images/games.png", color: Colors.amber, ), onPressed: () {}, padding: EdgeInsets.zero,),
            IconButton(icon: Image.asset("assets/images/profile.png", color: Colors.amber, ), onPressed: () {}, padding: EdgeInsets.zero,),
          ],
        ),
      ),
    );
  }
}