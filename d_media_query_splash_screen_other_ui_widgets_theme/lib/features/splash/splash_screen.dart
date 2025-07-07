import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ------------------------ (option # 01) -----------------------------------
  // Add the splash(launch) screen to used this method otherwise use option # 02
  // @override
  // void initState() {
  //   super.initState();
  //   print("insert the widget in Tree");
  //   _navigateToHome();
  // }

  // _navigateToHome() async {
  //   await Future.delayed(Duration(milliseconds: 1500));
  //   // Navigator.pushReplacement(
  //   //   // ignore: use_build_context_synchronously
  //   //   context,
  //   //   MaterialPageRoute(builder: (context) => HomePage()),
  //   // );
  //   // ignore: use_build_context_synchronously
  //   Navigator.pushReplacementNamed(context, '/home');
  // }
  // -------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // ---------------- option # 02 -----------------------------------------------
    Future.delayed(Duration(milliseconds: 1500), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    });
    // ----------------------------------------------------------------------------
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/a_song.png'),
            Text("Welcom, Welcom to Kidlings Club."),
          ],
        ),
      ),
    );
  }
}
