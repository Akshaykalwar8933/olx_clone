import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  File? _file;
  final signUpFormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height,
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: const [Colors.orange, Colors.teal],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: const [0.0, 1.0],
        tileMode: TileMode.clamp)),
        child: Column(
          children: [
            Form(
              key: signUpFormKey,
                child: InkWell(
                  onTap: (){},
                  child: CircleAvatar(
                    radius: screenWidth * 0.20,
                    backgroundColor: Colors.white24,

                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
