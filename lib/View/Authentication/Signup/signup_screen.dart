// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  File? _image;
  final signUpFormKey = GlobalKey<FormState>();

  void _getFromCamera() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    _cropImage(pickedFile!.path);
    Navigator.pop(context);
  }

  void _getFromGalery() async {
    XFile? pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    _cropImage(pickedFile!.path);
    Navigator.pop(context);
  }

  void _cropImage(filePath) async {
    CroppedFile? croppedImage = await ImageCropper()
        .cropImage(sourcePath: filePath, maxHeight: 1080, maxWidth: 1080);

    if(croppedImage != null){
      setState(() {
        _image = File(croppedImage.path);
      });
    }
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: signUpFormKey,
                child: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                      radius: screenWidth * 0.20,
                      backgroundColor: Colors.white24,
                      backgroundImage:
                          _image == null ? null : FileImage(_image!),
                      child: _image == null
                          ? Icon(
                              Icons.camera_enhance,
                              size: screenWidth * 0.18,
                              color: Colors.black54,
                            )
                          : null),
                ))
          ],
        ),
      ),
    );
  }
}
