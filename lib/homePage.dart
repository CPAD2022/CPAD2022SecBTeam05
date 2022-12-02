// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:go_router/go_router.dart';
import 'dart:io';
import 'package:demoapp/util/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:demoapp/MLHandler.dart';
import 'package:image/image.dart' as img;
import 'package:demoapp/util/logoText.dart';

late mlHandler _mlHandler;
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Image? _imageWidget;
  File? _image;
  Category? category;
  Future<void> get_photo_from_camera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    log("Some Function Triggered");
    setState(() {
      _image = File(photo!.path);
      _imageWidget = Image.file(_image!);

      _predict();
    });
  }

  Future<void> get_photo_from_gallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(photo!.path);
      _imageWidget = Image.file(_image!);

      _predict();
    });
  }

  void _predict() async {
    img.Image imageInput = img.decodeImage(_image!.readAsBytesSync())!;
    var pred = _mlHandler.predict(imageInput);

    setState(() {
      this.category = pred;
    });
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
