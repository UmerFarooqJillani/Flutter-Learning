/*
--> What Is arguments in Navigator.pushNamed()?
    Navigator.pushNamed() lets you navigate using a route name and pass data to 
    the new screen via the arguments parameter.

    -> Passing Complex Data (Object Instead of String)
      - You can pass custom classes or Maps too:
          Navigator.pushNamed(
            context,
            '/second',
            arguments: {'name': 'Ali', 'age': 7},
          );
      - Then receive it like:
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          print(args['name']); // Ali
//-------------------------------------------------------------------------------------
-->  Push with Arguments
    -> HomeScreen:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(data: "Hello"),
        ),
      );
      
    -> SecondScreen:
      class SecondScreen extends StatelessWidget {
        final String data;
        const SecondScreen({required this.data});

        @override
        Widget build(BuildContext context) {
          return Text("Data received: $data");
        }
      }
 */
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'second_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Data Passing',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}
