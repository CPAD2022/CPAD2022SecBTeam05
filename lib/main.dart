import 'package:demoapp/socialSignin.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';

import 'package:demoapp/spalshScreen/splashScreen.dart';
import 'package:demoapp/login.dart';
import 'package:demoapp/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // runApp(MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   initialRoute: 'splash',
  //   routes: {
  //     'splash':(context) => const SplashScreen(),
  //     'login': (context) => MySocialLogin(),
  //   },
  // ));

  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => SplashScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: 'login',
            builder: (context, state) => MyLogin(),
          ),
          GoRoute(
            path: 'signup',
            builder: (context, state) => MySocialLogin(),
          ),
          GoRoute(
            path: 'home',
            builder: (context, state) => MyHomePage(),
          )
        ],
      ),
    ],
  );

  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    ),
  );
}
