import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partex_test/helper/constant.dart';

import '../widgets/appTextField.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController text = TextEditingController();
  var userUID = FirebaseAuth.instance.currentUser?.uid;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to PartEx'),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextField('Enter Text', text, (value) {
                        if (value.toString().isEmpty) {
                          return 'Please Enter Some Text';
                        }
                      }),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          child: Text("Save".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                          style: appButtonStyle,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}
                          }),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
