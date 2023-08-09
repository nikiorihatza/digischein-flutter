import 'package:digischein_flutter/main.dart';
import 'package:digischein_flutter/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage(title: 'DIGISCHEIN')),
                      );
                    } else {
                      // Show a popup window (Dialog) if the data is not correct
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Validation Error'),
                            content: Text('Please fill in all the required fields.'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
