import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:recipes_practice/models/recipe_model.dart';

class RecipeService extends ChangeNotifier {
  late List<Recipe> recipes;

  Future<void> init() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/recipes.json',
      );
      List<dynamic> data = await json.decode(response);
      recipes = data.map((phrase) => Recipe.fromJson(phrase)).toList();
    } catch (err) {
      print(err);
      recipes = [];
    }
  }

  Future<void> searchBy(String param) async {
    if (param.isEmpty) {
      await init();
    } else {
      List<Recipe> recipesFiltered = recipes
          .where((recipe) => recipe.title.contains(param))
          .toList();
      recipes = recipesFiltered;
      notifyListeners();
    }
  }
}
