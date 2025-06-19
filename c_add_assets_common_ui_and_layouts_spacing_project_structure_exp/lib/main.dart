import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Image.asset(
          'assets/images/Asset_18.png',
          width: 200,
          height: 200,
          fit: BoxFit.fitWidth, // or BoxFit.contain, BoxFit.fill etc.
        ),
      ),
      // child: Image.network(
      //   'https://media.istockphoto.com/id/1403500817/photo/the-craggies-in-the-blue-ridge-mountains.jpg?s=612x612&w=0&k=20&c=N-pGA8OClRVDzRfj_9AqANnOaDS3devZWwrQNwZuDSk=',
      //   width: 200,
      //   height: 200,
      //   fit: BoxFit.fitWidth,
      // ),
    );
  }
}
