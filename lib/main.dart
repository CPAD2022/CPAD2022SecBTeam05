import 'package:demoapp/socialSignin.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


import 'package:demoapp/spalshScreen/splashScreen.dart';
import 'package:demoapp/login.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash',
    routes: {
      'splash':(context) => const SplashScreen(),
      'login': (context) => MySocialLogin(),
    },
  ));
}
