// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HaveAccountOrNOt extends StatelessWidget {
  final bool login;
  final VoidCallback press;

   HaveAccountOrNOt({super.key,
     this.login = true,
     required this.press});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account?" : "Already have an account?",
          style: TextStyle(
            fontFamily: 'italic',
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.w400

          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " Sign Up" : " Sign in",
            style: TextStyle(
                fontFamily: 'italic',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w400
            ),
          ),
        )

      ],
    );
  }
}
