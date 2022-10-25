import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:partex_test/Screens/splash.dart';
import 'package:partex_test/helper/constant.dart';
import 'package:partex_test/widgets/appTextField.dart';

import 'auth/signUp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PartEx',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
