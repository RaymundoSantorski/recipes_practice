import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:recipes_practice/models/recipe_model.dart';

class RecipeService {
  static late List<Recipe> recipes;

  static Future<void> init() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/recipes.json',
      );
      List<dynamic> data = await json.decode(response);
      recipes = data.map((phrase) => Recipe.fromJson(phrase)).toList();
      print(data);
    } catch (error) {
      recipes = [];
      print('No se pudieron cargar las frases');
    }
  }
}
