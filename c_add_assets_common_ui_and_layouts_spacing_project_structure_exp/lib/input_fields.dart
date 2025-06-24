import 'package:flutter/material.dart';

void main() => runApp(InputFld());

class InputFld extends StatelessWidget {
  const InputFld({super.key});
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
              // A basic input widget used to enter text, numbers, passwords, etc.
              // TextField(
              //   decoration: InputDecoration(
              //     labelText: 'Enter your name',
              //     hintText: 'John Doe',
              //     prefixIcon: Icon(Icons.person),
              //     border: OutlineInputBorder(),
              //     labelStyle: TextStyle(color: Colors.orange),
              //     // hintFadeDuration: Duration(seconds: 5),
              //   ),
              // ),
              //----------------------------------------------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/Asset_23.png"),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter name",
                        hintText: "John",
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: true, // Hide the password
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        hintText: "12345678",
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {print("Hello");},
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.green),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                        minimumSize: WidgetStatePropertyAll(Size(150 ,50)),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      child: Text("Submit"),
                    ),
                  ],
                ),
                ),
              ),

              //----------------------------------------------------------------------------
              //----------------------------------------------------------------------------
              //----------------------------------------------------------------------------
              //----------------------------------------------------------------------------
              //----------------------------------------------------------------------------
              //----------------------------------------------------------------------------
              //----------------------------------------------------------------------------
              //----------------------------------------------------------------------------
              //----------------------------------------------------------------------------
              //----------------------------------------------------------------------------
            ],
          ),
        ),
      ),
    );
  }
}
