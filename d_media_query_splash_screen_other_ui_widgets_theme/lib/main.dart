import 'package:flutter/material.dart';
import '/app/routes.dart';
import 'app/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      initialRoute: '/', 
      routes: AppRoutes.routes,
    );
  }
}
