import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partex_test/auth/signUp.dart';
import 'package:partex_test/helper/constant.dart';

import '../widgets/appTextField.dart';

class SigIn extends StatefulWidget {
  const SigIn({Key? key}) : super(key: key);

  @override
  State<SigIn> createState() => _SigInState();
}

class _SigInState extends State<SigIn> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset('logo.png'),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextField('Email', emailController, (value) {
                        if (!value.toString().contains('@')) {
                          return 'Enter Valid Email';
                        }
                      }),
                      const SizedBox(height: 20),
                      AppTextField('Password', passwordController, (value) {
                        if (value.toString().isEmpty) {
                          return 'Enter Valid Password';
                        }
                      }),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          child: Text("Sign in".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                          style: appButtonStyle,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signInUser();
                            }
                          }),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SigUp()),
                      );
                    },
                    child: Text(
                      'Dont Have an Account? Sign up !',
                      style: TextStyle(color: primaryColor),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  signInUser() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SigIn()),
        );
      });
    } on FirebaseAuthException catch (e) {
      print('object auth ');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }
}
