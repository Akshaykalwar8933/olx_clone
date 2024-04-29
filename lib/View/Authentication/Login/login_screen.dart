// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/email_text_field.dart';
import '../../../widgets/forgot_password_screen.dart';
import '../../../widgets/have_acount_or_not.dart';
import '../../../widgets/password_text_field.dart';
import '../../../widgets/rounded_button.dart';
import '../Signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: const [Colors.orange, Colors.teal],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: Get.height / 8),
                Image.asset(
                  'assets/icons/login.png',
                  width: Get.width * 0.8,
                  // color: Colors.deepPurple.shade300,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: EmailTextField(
                    onChanged: (value) {
                      _emailController.text = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: PasswordField(
                    onChanged: (String value) {
                      _passwordController.text = value;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Get.to(ForgotPassword());
                      },
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.black54,
                        ),
                      )),
                ),
                RoundedButton(
                  text: 'Login',
                  press: () {
                    // Get.to(LoginScreen());
                  },
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                HaveAccountOrNOt(
                  login: true,
                  press: () {
                    Get.to(SignupScreen());
                  },
                ),
              ],
            ),
          )),
    ));
  }
}
