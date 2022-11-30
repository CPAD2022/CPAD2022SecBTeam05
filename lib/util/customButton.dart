import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCustomButtom extends StatefulWidget {
  final String btnText;
  final Function onPressed;
  MyCustomButtom({Key? key, required this.btnText, required this.onPressed})
      : super(key: key);

  @override
  State<MyCustomButtom> createState() => _MyCustomButtomState();
}

class _MyCustomButtomState extends State<MyCustomButtom> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor:
            const MaterialStatePropertyAll<Color>(Color(0xFFFFCDAB)),
        backgroundColor:
            const MaterialStatePropertyAll<Color>(Color(0xFF5D5D5A)),
        textStyle: MaterialStatePropertyAll<TextStyle>(
          GoogleFonts.notoSans(
            fontSize: 16,
            letterSpacing: 1.25,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: const MaterialStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
        ),
      ),
      onPressed: () => widget.onPressed(),
      child: Text(widget.btnText),
    );
  }
}
