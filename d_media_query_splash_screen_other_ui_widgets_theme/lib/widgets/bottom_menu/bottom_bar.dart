//--------------------------- (Option 1) ------------------------------------------------
// Switch Image Dynamically Using State (You swap the image with a setState).
//---------------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'bottom_bar_controller.dart';

// class MyBottomBar extends StatefulWidget {
//   const MyBottomBar({super.key});

//   @override
//   State<MyBottomBar> createState() => _MyBottomBarState();
// }

// class _MyBottomBarState extends State<MyBottomBar> {
//   int _isSelectIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: Colors.white,
//       height: 56.0,
//       notchMargin: 8.0,
//       elevation: 10.0,
//       shape: const CircularNotchedRectangle(),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: List.generate(items.length, (index) {
//             if (items[index]["default"] == "") {
//               return const SizedBox(height: 40, width: 40); // Space for FAB
//             }
//             final isSelected = index == _isSelectIndex;
//             final imgPath = isSelected
//                 ? items[index]["selected"]!
//                 : items[index]["default"]!;
//             print("index =  $index");
//             print("_isSelectIndex = $_isSelectIndex");
//             print("isSelected = $isSelected");
//             return IconButton(
//               icon: Image.asset(imgPath),
//               onPressed: () {
//                 setState(() {
//                   _isSelectIndex = index;
//                 });
//               },
//               padding: EdgeInsets.zero,
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
//--------------------------- (Option 2) ------------------------------------------------
// Colorize PNG Dynamically (if your PNG is a white or black alpha icon)
//---------------------------------------------------------------------------
import 'package:d_media_query_splash_screen_other_ui_widgets_theme/widgets/bottom_menu/bottom_bar_controller.dart';
import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget {
  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _isSelectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 56.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            if(items[index]["Path"]! == ""){
              return const SizedBox(height: 40, width: 40);
            }
            return IconButton(
              icon: Image.asset(items[index]["Path"]!, color: _isSelectIndex == index ? Colors.amber : null,),
              onPressed: () {
                setState(() {
                  _isSelectIndex = index;
                });
                Navigator.pushNamed(context, '/');
              },
              padding: EdgeInsets.zero,
            );
          }),
        ),
      ),
    );
  }
}
