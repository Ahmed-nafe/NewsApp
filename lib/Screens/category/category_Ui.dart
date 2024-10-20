import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/Model/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;

  CategoryItem({super.key, required this.categoryModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: index.isEven ? const Radius.circular(20) : Radius.zero,
            bottomRight: index.isOdd ? const Radius.circular(20) : Radius.zero,
          )),
      child: Column(
        children: [
          Expanded(child: Image.asset(categoryModel.picture)),
          Text(
            categoryModel.name,
            style: GoogleFonts.elMessiri(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
