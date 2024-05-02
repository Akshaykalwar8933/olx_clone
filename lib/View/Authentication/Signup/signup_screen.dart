// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
  void _selectImageDialog(){

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3)
            ),
            title: Text("Choose an option",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),
            content: Column(
                mainAxisSize :MainAxisSize.min,
              children: [
                InkWell(
                  onTap: (){
                    _getFromCamera();
                  },
                  child:
                      Row(
                        children: [
                          Icon(Icons.camera),
                          SizedBox(width: 5,),
                          Text("Camera",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.purple),)
                        ],
                      )
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: (){
                      _getFromGalery();
                    },
                    child:
                    Row(
                      children: [
                        Icon(Icons.image),
                        SizedBox(width: 5,),
                        Text("Galery",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.purple),)
                      ],
                    )
                ),
              ],
            ),
          );
        },);
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
                  onTap: () {
                    _selectImageDialog();
                  },
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
