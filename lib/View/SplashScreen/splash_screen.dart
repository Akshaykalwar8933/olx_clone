// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:olx/View/WelcomePage/welcome_screen.dart';
import 'package:olx/home_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  startTimer() {
    Timer(Duration(seconds: 3),
            () async{
      if(FirebaseAuth.instance.currentUser != null){
        Get.to(HomeScreen());
      }
      else{
        Get.to(WelcomeScreen());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange, Colors.teal],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                'assets/images/logo.png',
                width: Get.width/1.1,
              )),
              SizedBox(
                height: 20,
              ),
              Text(
                "Sell , purches or Exchange your old Home applicaton",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Varela'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
