import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String picture;
  String name;
  Color color;

  CategoryModel(
      {required this.id,
      required this.picture,
      required this.name,
      required this.color});

  static List<CategoryModel> categories = [
    CategoryModel(
      id: 'business',
      name: 'business',
      picture: 'assets/bussines.png',
      color: const Color(0xffCF7E48),
    ),
    CategoryModel(
      id: 'entertainment',
      name: 'entertainment',
      picture: 'assets/Politics.png',
      color: const Color(0xff003E90),
    ),
    CategoryModel(
      id: 'general',
      name: 'general',
      picture: 'assets/environment.png',
      color: const Color(0xff4882CF),
    ),
    CategoryModel(
        id: 'health',
        name: 'health',
        picture: 'assets/health.png',
        color: const Color(0xffED1E79)),
    CategoryModel(
      id: 'science',
      name: 'science',
      picture: 'assets/science.png',
      color: const Color(0xffF2D352),
    ),
    CategoryModel(
      id: 'sports',
      name: 'sports',
      picture: 'assets/sports.png',
      color: const Color(0xffCF7E48),
    ),
    CategoryModel(
      id: 'technology',
      name: 'technology',
      picture: 'assets/bussines.png',
      color: const Color(0xffCF7E48),
    ),
  ];
}
