import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:recipes_practice/models/recipe_model.dart';

class RecipeError {
  String title;
  RecipeError(this.title);
}

class RecipeService {
  static late List<Recipe> recipes;
  static RecipeError? error;

  static setError(RecipeError? err) {
    error = err;
  }

  static Future<void> init() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/recipes.json',
      );
      List<dynamic> data = await json.decode(response);
      recipes = data.map((phrase) => Recipe.fromJson(phrase)).toList();
      setError(null);
      print(data);
    } catch (err) {
      recipes = [];
      setError(RecipeError('No se pudieron cargar las recetas'));
    }
  }
}
