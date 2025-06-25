import 'package:flutter/material.dart';

void main() => runApp(InputFld());

class InputFld extends StatefulWidget {
  const InputFld({super.key});

  @override
  State<InputFld> createState() => _InputFldState();
}

class _InputFldState extends State<InputFld> {
  var name = "";
  bool chnageButton = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        // peice of material
        //--------------------------------------------------------------------------
        // A basic input widget used to enter text, numbers, passwords, etc.
        // child: TextField(
        //   decoration: InputDecoration(
        //     labelText: 'Enter your name',
        //     hintText: 'John Doe',
        //     prefixIcon: Icon(Icons.person),
        //     border: OutlineInputBorder(),
        //     labelStyle: TextStyle(color: Colors.orange),
        //     // hintFadeDuration: Duration(seconds: 5),
        //   ),
        // ),
        //--------------------------------------------------------------------------
        child: SingleChildScrollView(
          child: Padding(
            // padding: const EdgeInsets.fromLTRB(26, 90, 26, 0),
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Asset_23.png"),
                SizedBox(height: 20),
                Text(
                  "Welcom $name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(height: 20),
                TextFormField(
                  maxLength: 5, // 	Limit number of characters
                  // onSubmitted --> Called when user presses "done"
                  keyboardType:
                      TextInputType.text, // Input type (text, number, email)
                  decoration: InputDecoration(
                    // 	Adds label, icon, border
                    // filled: true,
                    // fillColor: const Color.fromARGB(255, 226, 139, 8),
                    labelText: "Enter name",
                    hintText: "John",
                    // border: InputBorder.none,

                    // contentPadding: EdgeInsets.symmetric(
                    //   horizontal: 16,
                    //   vertical: 20,
                    // ),

                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(25),
                    // ),

                    // prefixIcon: Icon(Icons.person),
                  ),
                  onChanged: (value) {
                    // 	Called on each change
                    name = value;
                    setState(() {});
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true, // Hides input (for password)
                  // enableSuggestions: true,
                  // autocorrect: true,
                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    hintText: "12345678",
                  ),
                ),
                SizedBox(height: 30),
                //---------------------------------------------------------------
                // ElevatedButton(
                //   onPressed: () {},
                //   style: ButtonStyle(
                //     backgroundColor: WidgetStatePropertyAll(Colors.green),
                //     foregroundColor: WidgetStatePropertyAll(Colors.white),
                //     minimumSize: WidgetStatePropertyAll(Size(150, 50)),
                //     shape: WidgetStatePropertyAll(
                //       RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(25),
                //       ),
                //     ),
                //   ),
                //   child: Text("Submit"),
                // ),
                //---------------------------------------------------------------
                InkWell(
                  onTap: () {
                    setState(() {
                      chnageButton = true;
                      print("Pressed");
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: 50,
                    width: chnageButton ? 50 : 150,
                    // width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      // shape: chnageButton
                      //     ? BoxShape.circle
                      //     : BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: chnageButton
                        ? Icon(Icons.done, color: Colors.white)
                        : Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              // fontSize: chnageButton ? 14 : 18,
                              fontSize: 18,
                            ),
                          ),
                  ),
                ),
                //---------------------------------------------------------------
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
        //--------------------------------------------------------------------------
        //--------------------------------------------------------------------------
        //--------------------------------------------------------------------------
        //--------------------------------------------------------------------------
        //--------------------------------------------------------------------------
        //--------------------------------------------------------------------------
        //--------------------------------------------------------------------------
        //--------------------------------------------------------------------------
      ),
    );
  }
}
