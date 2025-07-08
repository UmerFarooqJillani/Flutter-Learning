import 'package:d_media_query_splash_screen_other_ui_widgets_theme/widgets/bottom_menu/bottom_bar.dart';
import 'package:flutter/material.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Not Design Games Screen"),
      ),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}