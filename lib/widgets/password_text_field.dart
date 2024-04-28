// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const PasswordField({
    super.key,
    required this.onChanged,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      // margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      height: Get.height * 0.06,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(28),
          color: Colors.white24),
      child: TextFormField(
        obscureText: !obsecureText,
        onChanged: widget.onChanged,
        cursorColor: Colors.teal,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.black54,
          ),
          hintText: "Enter Your Password",
          hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.black54,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obsecureText = !obsecureText;
              });
            },
            child: Icon(
              obsecureText
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.black54,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
