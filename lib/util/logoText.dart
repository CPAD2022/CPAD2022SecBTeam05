// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLogoWithText extends StatefulWidget {
  final bool isSplash;
  final bool isImage;
  const MyLogoWithText(
      {Key? key, required this.isSplash, required this.isImage})
      : super(key: key);

  @override
  State<MyLogoWithText> createState() => _MyLogoWithTextState();
}

class _MyLogoWithTextState extends State<MyLogoWithText> {
  @override
  Widget build(BuildContext context) {
    var contextHeight = MediaQuery.of(context).size.height;
    var contextWidth = MediaQuery.of(context).size.width;
    var fontSize = (contextHeight + contextWidth) / 65;

    return Container(
      width: contextWidth,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: widget.isSplash
            ? Border()
            : Border.all(
                // bottom: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 5,
                // ),
              ),
        borderRadius: widget.isSplash
            ? BorderRadius.zero
            : const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisAlignment: widget.isSplash
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Padding(
            padding: widget.isSplash
                ? EdgeInsets.zero
                : EdgeInsets.only(top: contextHeight * 0.05),
          ),
          widget.isImage
              ? Image.asset('assets/splashScreen.png')
              : SizedBox.shrink(),
          Text(
            'SKIN CANCER DETECTION',
            style: GoogleFonts.notoSans(
              fontSize: fontSize,
              letterSpacing: 1.25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
