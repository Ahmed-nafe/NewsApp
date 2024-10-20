import 'package:flutter/material.dart';
import 'package:newsapp/Model/category_model.dart';
import 'package:newsapp/Screens/category/category_Ui.dart';

class CategoryScreen extends StatelessWidget {
  var categories = CategoryModel.categories;
  Function onClick;

  CategoryScreen({required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {

              onClick(categories[index]);
            },
            child: CategoryItem(
              categoryModel: categories[index],
              index: index,
            ));
      },
    );
  }
}
