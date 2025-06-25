import 'package:flutter/material.dart';

void main() => runApp(InputFld());

class InputFld extends StatefulWidget {
  const InputFld({super.key});

  @override
  State<InputFld> createState() => _InputFldState();
}

class _InputFldState extends State<InputFld> {
  var name =
      ""; // used for first children for onChange fnc (Call on each Change)
  final _formKey = // used for Second children for form validation
      GlobalKey<
        FormState
      >(); // A key to access the FormState (e.g., for validation, saving)

  bool chnageButton = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        // peice of material
        //--------------------------------------------------------------------------
        //
        // A basic input widget used to enter text, numbers, passwords, etc. (it's Old)
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
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              /*
              //Inkwell (Clickable Widgets) and TextFormField
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
                  // hoverColor: Colors.amberAccent,
                  onTap: () {
                    setState(() {
                      chnageButton = true;
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
              */
              //---------------------------------------------------------------
              /*
              --> Form Validation
                Form validation ensures users input data correctly before submitting (e.g., a login or sign-up form).
                Flutter provides built-in support for form handling via:
                  - Form
                  - TextFormField
                  - GlobalKey<FormState>
                  - validator: callback(a function passed into another function as an argument, 
                                which is then invoked/called inside the outer function to complete some 
                                kind of routine or action or validation)
              */
              children: [
                Form(
                  key: _formKey,
                  // "I want to control or access the internal state of this specific Form widget from outside the widget tree."
                  child: Column(
                    children: [
                      TextFormField(
                        controller: TextEditingController(),
                        validator: (value) {
                          //A function to check if input is valid; returns error 'String' or 'null'
                          if (value == null || value.isEmpty) {
                            return 'Please enter something';
                          }
                          // print("$value");
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            /*
                             --> currentState
                                This returns the current state of the Form identified by _formKey.
                                Internally, the Form creates a FormState object when it's built. That object:
                                  - Knows about all the TextFormFields
                                  - Can run validations
                                  - Can reset the form
                                  - Can save the form
                                So this returns a reference to the internal FormState object.
                             --> ! (Null assertion operator)
                                  - Ensures that currentState is not null. 
                                  - It's say the Dart Trust me — it’s not null.
                                  - Without it, Dart will complain if you access .validate() on something 
                                    that could be null. 
                             --> .validate()
                                  - This calls the validator function of every TextFormField in the Form.
                                  - Returns:
                                      - true if all fields pass validation
                                      - false if any validator fails
                             --> 
                            */
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ],
              //---------------------------------------------------------------
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
