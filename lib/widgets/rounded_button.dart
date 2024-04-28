
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final VoidCallback press;
  final Color color, textColor;

  const RoundedButton({
    super.key,
    required this.text,
    required this.press,
    this.color = Colors.black54,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height/18,
      width: Get.width/1.5,
      child: ClipRRect(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
          ),
          onPressed : press,
          child: Text(
              text!,style: TextStyle(color:textColor,fontSize: 12),
          ),
        ),
      ),
    );
  }
}
