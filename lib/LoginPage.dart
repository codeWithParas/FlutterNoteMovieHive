
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jan_batch/stepcount/StepCountScreen.dart';

import 'movieapp/MovieAppHomeScreen.dart';
import 'notepad/screens/HomePageScreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Login Screen"),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: usernameController,
                    decoration:
                        const InputDecoration(labelText: "Enter Username"),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter correct username";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: passwordController,
                    decoration:
                        const InputDecoration(labelText: "Enter Password"),
                    validator: (String? value) {
                      if (value == null || value.isEmpty || value.length < 4) {
                        return "Please enter correct password";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {

                        if(_formKey.currentState!.validate()) {

                          // Hit Login API - Username, Password
                          // Response - true

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Login Successfully ${usernameController.text}")));

                          // Navigate to next page
                          Navigator.push(
                              context,
                              //MaterialPageRoute(builder: (context) => const HomePageScreen())
                              //MaterialPageRoute(builder: (context) => const MovieAppHomePage())
                              MaterialPageRoute(builder: (context) => const StepCountScreen())
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Login Failed")));
                        }
                      },
                      child: const Text("Login Button")),
                ),
              ],
            ),
          )),
    );
  }
}
