import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:recipes_practice/models/recipe_model.dart';
import 'package:recipes_practice/widgets/warning.dart';

class RecipeService {
  static List<Recipe> recipes = [];

  static Future<void> init(BuildContext context) async {
    try {
      final String response = await rootBundle.loadString(
        'assets/recipes.json',
      );
      List<dynamic> data = await json.decode(response);
      recipes = data.map((phrase) => Recipe.fromJson(phrase)).toList();
      print(data);
    } catch (err) {
      recipes = [];
      ScaffoldMessenger.of(context).showSnackBar(
        snackBar('No se pudieron cargar las recetas', Colors.redAccent),
      );
    }
  }
}
