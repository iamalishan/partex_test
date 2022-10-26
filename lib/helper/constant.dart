import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff2a64f5);
Color secondaryColor = const Color(0xff1c44a6);
ButtonStyle appButtonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    )));
