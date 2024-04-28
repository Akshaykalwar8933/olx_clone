// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/rounded_button.dart';
import '../Authentication/Login/login_screen.dart';
import '../Authentication/Signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orange, Colors.teal],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp)),
          child: Padding(
            padding:  EdgeInsets.only(top: Get.height/4),
            child: Column(
              children: [
                Text(
                  "OLX Clone",
                  style: TextStyle(
                    fontFamily: 'Signatra',
                    fontWeight: FontWeight.w500,
                    fontSize: 60,
                  ),
                ),
                Image.asset('assets/icons/chat.png'),
                RoundedButton(
                  text: 'Login',
                  press: () {
                    Get.to(LoginScreen());
                    },
                ),
                SizedBox(height: 10,),
                RoundedButton(
                  text: 'Signup',
                  press: () {
                    Get.to(SignupScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
