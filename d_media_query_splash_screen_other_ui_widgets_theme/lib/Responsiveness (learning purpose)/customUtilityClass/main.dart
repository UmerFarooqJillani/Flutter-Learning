/*
--> What is a "Custom Utility Class" in Flutter?
  - A utility class is a reusable helper class (no UI itself) that provides common logic.
  - A custom layout builder class is one such utility to make UI responsive across:
    - Mobile
    - Tablet
    - Desktop

--> Recommended File Structure
lib/
├── core/
│   ├── utils/
│   │   ├── device_helper.dart 👈 Custom layout builder utility
│   │   └── screen_utils.dart  👈 Screen width, padding, scale helpers (optional)
*/
import 'package:flutter/material.dart';

import 'core/utils/responsive_layout.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Responsive App")),
        body: ResponsiveLayout(
          mobile: Center(child: Text("📱 Mobile View")),
          tablet: Center(child: Text("📟 Tablet View")),
          desktop: Center(child: Text("🖥️ Desktop View")),
        ),
      ),
    );
  }
}
