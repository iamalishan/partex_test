import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partex_test/Screens/homeScreen.dart';

import '../auth/signIn.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  var uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    splashToOther(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: Image.asset('logo.png'),
            ),
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }

  splashToOther(context) {
    Future.delayed(const Duration(seconds: 2), () async {
      if (uid != null) {
        //if user is loggen in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  HomeScreen()),
        );
      } else {
        //if user is not logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SigIn()),
        );
      }
    });
  }
}
