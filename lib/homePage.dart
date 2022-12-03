// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:go_router/go_router.dart';
import 'dart:io';
import 'package:demoapp/util/customButton.dart';
import 'package:demoapp/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
