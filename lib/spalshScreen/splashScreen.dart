// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

import 'package:demoapp/login.dart';
import 'package:demoapp/socialSignin.dart';
import 'package:flutter/material.dart';

// import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:demoapp/util/logoText.dart';

bool play = false;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navToHome();
  }

  _navToHome() async {
    await Future.delayed(const Duration(milliseconds: 3500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MySocialLogin(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final log = Logger();
    var contextHeight = MediaQuery.of(context).size.height;
    var contextWidth = MediaQuery.of(context).size.width;
    var fontSize = (contextHeight + contextWidth) / 65;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color(0xFFD9D9D9),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: MyLogoWithText(isImage: true, isSplash: true),
        ),
      ),
    );
  }
}
