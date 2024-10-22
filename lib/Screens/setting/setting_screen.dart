import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatelessWidget {
  static String routeName = "setting";
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )),
        centerTitle: true,
        backgroundColor: const Color(0xff39A552),
        title: Text(
          "Settings",
          style: GoogleFonts.elMessiri(
            fontWeight: FontWeight.w100,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Language",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("English"),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_drop_down_sharp),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
