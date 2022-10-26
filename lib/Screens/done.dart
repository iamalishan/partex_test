import 'package:flutter/material.dart';
import 'package:partex_test/helper/constant.dart';

class DataSent extends StatefulWidget {
  const DataSent({Key? key}) : super(key: key);

  @override
  State<DataSent> createState() => _DataSentState();
}

class _DataSentState extends State<DataSent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: Icon(
                Icons.done,
                size: 30,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Success!'),
            SizedBox(
              height: 20,
            ),
            Text('You will Shortly receive the Notification')
          ],
        ),
      ),
    );
  }
}
