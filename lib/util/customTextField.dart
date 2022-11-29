import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  const MyTextField({Key? key, required this.controller, required this.hintText, this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: textStyle(),
      decoration: InputDecoration(
        fillColor: const Color(0xFF5D5D5A),
        filled: true,
        hintText: hintText,
        hintStyle: textStyle(isHint: true),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  TextStyle textStyle({bool isHint = false}) {
    return GoogleFonts.notoSans(
      color: isHint ? const Color(0xAAFFCDAB) : const Color(0xDDFFCDAB),
      fontSize: 16,
      letterSpacing: 1.25,
      fontWeight: FontWeight.bold,
    );
  }
}
