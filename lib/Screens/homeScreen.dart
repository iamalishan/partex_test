import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:partex_test/Screens/done.dart';
import 'package:partex_test/Screens/splash.dart';

import 'package:partex_test/helper/constant.dart';
import 'package:partex_test/notification/getNotifications.dart';
import 'package:partex_test/notification/notficationClient.dart';

import '../widgets/appTextField.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController text = TextEditingController();
  String? userToken = "";

  @override
  void initState() {
    getToken();

    GetNotification.notificationBackground();
    GetNotification.notificationForTerminatedApp();
    GetNotification.notificationForeground();

    super.initState();
  }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to PartEx'),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppTextField('Enter Text', const Icon(Icons.email), text,
                        (value) {
                      if (value.toString().isEmpty) {
                        return 'Please Enter Some Text';
                      }
                    }),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        child: Text("Save".toUpperCase(),
                            style: const TextStyle(fontSize: 14)),
                        style: appButtonStyle,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Text("Please Wait"),
                                          Center(
                                              child:
                                                  CircularProgressIndicator())
                                        ],
                                      ),
                                    ));
                            saveText();
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut().then((value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashScreen()),
                            );
                          });
                        },
                        child: const Text('Sign Out')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  saveText() async {
    FirebaseNotificationClient client = FirebaseNotificationClient();
    try {
      await FirebaseFirestore.instance
          .collection('UserData/$userUID/data')
          .doc()
          .set({
        'text': text.text,
      }).then((value) {
        client.sendNotificationRequest(
          token: userToken.toString(),
          title: 'PartEx',
          notificationBody: text.value.text,
        );
        print('notification sent');
        Navigator.pop(context);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DataSent()),
        );
      });
    } on FirebaseException catch (e) {
      print('Error Storing Data to Firebase');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        userToken = token;
      });
    });
  }
}
