// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:go_router/go_router.dart';

import 'package:demoapp/util/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:demoapp/util/logoText.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void someFunction() {
    log("Some Function Triggered");
    context.go('/');
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
                Container(
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
                Text("OR"),
                MyCustomButtom(
                  btnText: "UPLOAD AN IMAGE",
                  onPressed: someFunction,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
