import 'package:demoapp/util/customTextField.dart';
import 'package:demoapp/util/customButton.dart';
import 'package:demoapp/util/logoText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class MySocialLogin extends StatefulWidget {
  MySocialLogin({super.key});

  @override
  State<MySocialLogin> createState() => _MySocialLoginState();
}

class _MySocialLoginState extends State<MySocialLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final log = Logger();

  Future signIn() async {
    log.d("Testing");
    log.d(_emailController.text.trim());
    log.d(_passwordController.text.trim());

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var contextHeight = MediaQuery.of(context).size.height;
    var contextWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      body: Column(
        children: <Widget>[
          FittedBox(
            fit: BoxFit.fitHeight,
            child: MyLogoWithText(isSplash: false, isImage: true),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: contextHeight * 0.05,
                right: contextWidth * 0.1,
                left: contextWidth * 0.1,
              ),
              child: Column(children: [
                CircleAvatar(
                  maxRadius: contextHeight * 0.1,
                  backgroundColor: Color(0xFF6A615B),
                  child: Image.asset(
                    'assets/avatar.jpg',
                    fit: BoxFit.cover,
                    height: contextHeight * 0.14,
                  ),
                ),
                SizedBox(height: 20),
                MyTextField(
                  hintText: 'Email',
                  controller: _emailController,
                ),
                SizedBox(height: 15),
                MyTextField(
                  hintText: 'Password',
                  isPassword: true,
                  controller: _passwordController,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: contextWidth,
                  height: contextHeight * 0.15,
                  child: MyCustomButtom(btnText: 'Sign In', onPressed: signIn),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
