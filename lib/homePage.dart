// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:go_router/go_router.dart';

import 'package:demoapp/util/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:demoapp/util/logoText.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> get_photo_from_camera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    log("Some Function Triggered");
  }

  Future<void> get_photo_from_gallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    var contextHeight = MediaQuery.of(context).size.height;
    var contextWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MyLogoWithText(isSplash: false, isImage: true),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.notoSans(
                  color: const Color(0xFF5D5D5A),
                  fontSize: 15,
                  letterSpacing: 1.25,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 10,
                ),
                children: [
                  TextSpan(text: "More than"),
                  TextSpan(
                    text: " 9,500 ",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 18,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                  TextSpan(
                      text:
                          "people are diagnosied with Skin Cancer every day in U.S. Alone. \nMore than"),
                  TextSpan(
                    text: " 2 ",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 18,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                  TextSpan(text: "people die of the disease every "),
                  TextSpan(
                    text: " Hour.\n",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 18,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                  TextSpan(
                      text:
                          "Skin cancer is a disease that can affect any one. \n Research shows that we can increase the survival rate up to"),
                  TextSpan(
                    text: " 99% ",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 18,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                  TextSpan(text: "on early detection, and up to"),
                  TextSpan(
                    text: " 68% ",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 18,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                  TextSpan(
                      text: " when detected in modarate stage of the disease."),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              contextWidth * 0.2,
              0,
              contextWidth * 0.2,
              contextHeight * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: get_photo_from_camera,
                  child: Container(
                    height: contextHeight * 0.035,
                    width: contextWidth * 0.13,
                    decoration: BoxDecoration(
                      color: Color(0xFF5D5D5A),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Color(0xFFFFCDAB),
                    ),
                  ),
                ),
                Text("OR"),
                MyCustomButtom(
                  btnText: "UPLOAD AN IMAGE",
                  onPressed: get_photo_from_gallery,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
