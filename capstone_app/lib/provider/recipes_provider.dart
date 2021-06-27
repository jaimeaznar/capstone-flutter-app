import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';

class _RecipesProvider {
  List<dynamic> popularRecipes = [];
  List<dynamic> categories = [];
  List<dynamic> categoryRecipes = [];

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<dynamic>> loadPopularRecipes() async {
    final List<dynamic> recipesTempList = [];
    await firestore
        .collection("recipes")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                Map<String, dynamic> recipesMap = doc.data();
                recipesTempList.add(recipesMap);
              })
            });
    popularRecipes = recipesTempList;

    return popularRecipes;
  }

  Future<List<dynamic>> loadCategories() async {
    final List<dynamic> categoriesTempList = [];
    await firestore
        .collection("categories")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                Map<String, dynamic> recipesMap = doc.data();
                categoriesTempList.add(recipesMap);
              })
            });
    categories = categoriesTempList;

    return categories;
  }

  Future<List<dynamic>> loadCategory(String categoryName) async {
    final List<dynamic> categoryTempList = [];
    await firestore
        .collection(categoryName)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                Map<String, dynamic> recipesMap = doc.data();
                categoryTempList.add(recipesMap);
              })
            });
    categoryRecipes = categoryTempList;

    return categoryRecipes;
  }

  // Future<List<dynamic>> loadPopularRecipes() async {
  //   final response = await rootBundle.loadString('data/recipes.json');

  //   Map<String, dynamic> recipesMap = json.decode(response);

  //   popularRecipes = recipesMap['PopularRecipes'];

  //   // print(popularRecipes);

  //   return popularRecipes;
  // }

  // Future<List<dynamic>> loadCategories() async {
  //   final response = await rootBundle.loadString('data/recipes.json');

  //   Map<String, dynamic> categoriesMap = json.decode(response);

  //   categories = categoriesMap['categories'];

  //   // print(popularRecipes);

  //   return categories;
  // }

  // Future<List<dynamic>> loadCategory(String categoryName) async {
  //   final response = await rootBundle.loadString('data/recipes.json');

  //   Map<String, dynamic> categoryMap = json.decode(response);

  //   categoryRecipes = categoryMap[categoryName];

  //   // print(popularRecipes);

  //   return categoryRecipes;
  // }
}

final recipesProvider = _RecipesProvider();
