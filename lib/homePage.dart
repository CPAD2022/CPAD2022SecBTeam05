// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:go_router/go_router.dart';
import 'dart:io';
import 'package:demoapp/util/customButton.dart';
import 'package:demoapp/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:demoapp/util/logoText.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UploadTask? uploadTask;
  XFile? photo = null;

  Future<void> getPhoto(ImageSource imageSource) async {
    final ImagePicker _picker = ImagePicker();
    photo = await _picker.pickImage(source: imageSource);
    MyResultPage.image = photo;
    uploadImage(File(photo!.path));
    Logger l = Logger();
    var filePath = photo!.path;
    l.d(filePath);
    context.push('/result');
  }

  Future uploadImage(File image) async {
    var path = "files/${Uuid().v4()}.jpg";
    var file = image;

    var ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    var snapshot = await uploadTask!.whenComplete(() => {});

    var downladUrl = await snapshot.ref.getDownloadURL();
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
                  fontSize: 12,
                  letterSpacing: 1.25,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 10,
                ),
                children: [
                  TextSpan(
                    text: "More than",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 12,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                  TextSpan(
                    text: " 9,500 ",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 15,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                  TextSpan(
                    text:
                        "people are diagnosied with Skin Cancer every day in U.S. Alone. \n\nMore than",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 12,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                  TextSpan(
                    text: " 2 ",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 15,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                  TextSpan(
                    text: "people die of the disease every ",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 12,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                  TextSpan(
                    text: " Hour.\n\n",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 15,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                  TextSpan(
                    text:
                        "Skin cancer is a disease that can affect any one. \n\nResearch shows that we can increase the survival rate up to",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 12,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                  TextSpan(
                    text: " 99% ",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 15,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                  TextSpan(
                    text: "on early detection, and up to",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 12,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                  TextSpan(
                    text: " 68% ",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 15,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                  TextSpan(
                    text: " when detected in modarate stage of the disease.",
                    style: GoogleFonts.notoSans(
                      color: const Color(0xFF5D5D5A),
                      fontSize: 12,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              contextWidth * 0.1,
              0,
              contextWidth * 0.1,
              contextHeight * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => getPhoto(ImageSource.camera),
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
                  onPressed: () => getPhoto(ImageSource.gallery),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
