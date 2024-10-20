import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/Model/category_model.dart';
import 'package:newsapp/Screens/news/news_screen.dart';

import 'category/category_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff39A552),
        title: Text(
          'News App',
          style: GoogleFonts.elMessiri(
            fontWeight: FontWeight.w100,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: model == null
          ? CategoryScreen(
              onClick: OnClick,
            )
          : const NewsScreen(),
    );
  }

  CategoryModel? model;

  OnClick(categoryModel) {
    model = categoryModel;
    setState(() {});
  }
}
