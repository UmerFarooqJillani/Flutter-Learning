import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyFormPage()));
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If all validations pass
      print("Email: ${_emailController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form & Validation")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Connect the form to its key
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required.";
                  }
                  if (!value.contains('@')) {
                    return "Enter a valid email address.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _submitForm, child: Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }

  // Always dispose the controller in StatefulWidget
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}

/*
What is a TextEditingController?
Answer:
    A TextEditingController is used to:
      - Get the current value of a TextField or TextFormField.
      - Set or clear the value programmatically.
      - Add listeners to track user input.
        Example:
          final TextEditingController nameController = TextEditingController();
            TextField(
              controller: nameController,
            )
          print(nameController.text); // Read value
*/
