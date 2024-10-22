import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/Model/category_model.dart';
import 'package:newsapp/Screens/drawer.dart';
import 'package:newsapp/Screens/news/news_screen.dart';
import 'package:newsapp/Screens/setting/setting_screen.dart';
import 'category/category_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home";
  var categories = CategoryModel.categories;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? categoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerItem(
        onClicked: onClickedDrawer,
      ),
      appBar: categoryModel == null
          ? AppBar(
              foregroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              centerTitle: true,
              backgroundColor: const Color(0xff39A552),
              title: Text(
                'News App',
                style: GoogleFonts.elMessiri(
                  fontWeight: FontWeight.w100,
                  fontSize: 22,
                ),
              ),
            )
          : AppBar(
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              shadowColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              centerTitle: true,
              backgroundColor: const Color(0xff39A552),
              title: Text(
                categoryModel?.name ?? "",
                style: GoogleFonts.elMessiri(
                  fontWeight: FontWeight.w100,
                  fontSize: 22,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
      body: categoryModel == null
          ? CategoryScreen(
              onClick: onClick,
            )
          : NewsScreen(
              categoryModel: categoryModel!,
            ),
    );
  }

  onClick(categoryModels) {
    categoryModel = categoryModels;
    setState(() {});
  }

  onClickedDrawer(int num) {
    if (num == DrawerItem.category) {
      categoryModel = null;
      Navigator.pop(context);
      setState(() {});
    } else if (num == DrawerItem.setting) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const SettingScreen();
      }),
      );
    }
  }
}
