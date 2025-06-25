import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Images insert
              Image.asset(
                'assets/images/Asset_18.png',
                height: 200,
                width: 300,
                fit: BoxFit.cover, // or BoxFit.contain, BoxFit.fill etc.
              ),

              Padding(
                padding: EdgeInsets.all(4.0), // uniform padding
                // child: Text('Padded Text',
                // style: TextStyle(
                //   fontSize: 10,
                // )
                // ),
              ),

              SizedBox(
                // Blank space (Alternate to padding and margin Recommanded to use)
                height: 20,
                // child: Text("Hello"),
              ),

              // font Style and use the font external and internal packages
              Text(
                "Welcom to Kidlings Club",
                // style: TextStyle(          // internal font (Local/Custom Font)
                //   fontFamily: 'SpecialElite',
                //   fontSize: 22,
                //   fontWeight: FontWeight.bold,
                //   color: const Color.fromARGB(255, 10, 150, 150),
                // ),
                style: GoogleFonts.specialElite(
                  // External Font (Google Fonts Package)
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 10, 150, 150),
                  ),
                ),
              ),
              Container(margin: EdgeInsets.only(top: 20)),
              // Buttons in Flutters
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 10, 150, 150),
                  foregroundColor: Colors.white,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Elevated"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
