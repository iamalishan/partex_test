import 'package:flutter/material.dart';

import '../helper/constant.dart';

class AppTextField extends StatelessWidget {
  final FormFieldValidator validator;
  final String hint;
  final Icon? icon;
  final TextEditingController controller;
  const AppTextField(this.hint, this.icon, this.controller, this.validator,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: hint,
          prefixIcon: icon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: primaryColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: primaryColor))),
    );
  }
}
