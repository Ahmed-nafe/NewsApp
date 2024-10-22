import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerItem extends StatelessWidget {
  DrawerItem({super.key, required this.onClicked});

  Function onClicked;
  static int category = 0;
  static int setting = 1;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.green,
            height: MediaQuery.sizeOf(context).height * 0.35,
            child: Text(
              "News App !",
              style: GoogleFonts.aBeeZee(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(15),
            splashColor: Colors.greenAccent,
            onTap: () {
              onClicked(category);
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  const Icon(
                    Icons.format_list_bulleted,
                    size: 35,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.02,
                  ),
                  Text(
                    "Categories",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(15),
            splashColor: Colors.greenAccent,
            onTap: () {
              onClicked(setting);
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    size: 35,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.02,
                  ),
                  Text(
                    "settings",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
