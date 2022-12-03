import 'package:demoapp/util/logoText.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyResultPage extends StatefulWidget {
  static XFile? image;
  MyResultPage({Key? key}) : super(key: key);

  @override
  State<MyResultPage> createState() => _MyResultPageState();
}

class _MyResultPageState extends State<MyResultPage> {
  DateTime curTime = DateTime.now();
  static const months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  late String now =
      "${curTime.day} ${months[curTime.month - 1]} ${curTime.year} ${curTime.hour}:${curTime.minute}:${curTime.second}";

  @override
  Widget build(BuildContext context) {
    Image img = Image.file(File(MyResultPage.image!.path));

    var contextHeight = MediaQuery.of(context).size.height;
    var contextWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyLogoWithText(isSplash: false, isImage: false),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Result:",
                  style: GoogleFonts.notoSans(
                    color: Color(0xFF5D5D5A),
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  color: Color(0xFF5D5D5A),
                  padding: EdgeInsets.symmetric(
                    horizontal: contextWidth * 0.05,
                    vertical: contextHeight * 0.05,
                  ),
                  child: Column(
                    children: [
                      img,
                      Divider(
                        color: Colors.white,
                        thickness: 3,
                      ),
                      Text(
                        'Negative',
                        style: GoogleFonts.notoSans(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        now,
                        style: GoogleFonts.notoSans(
                          color: const Color(0xDDFFCDAB),
                          fontSize: 16,
                          letterSpacing: 1.25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
