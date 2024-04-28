// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const EmailTextField(
      {super.key,
        required this.onChanged,
       });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
      height: Get.height * 0.06,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black38,
        ),
          borderRadius: BorderRadius.circular(28),
        color: Colors.white24
      ),
      child: TextFormField(
        onChanged: onChanged,
        cursorColor: Colors.teal,
        decoration: InputDecoration(
          hintText: 'Enter your E-mail',
          hintStyle: TextStyle(
            color: Colors.black54,
                fontSize: 15
          ),
          prefixIcon: Icon(Icons.mail,color: Colors.black54,),
          border: InputBorder.none
        ),
      ),
    );
  }
}
