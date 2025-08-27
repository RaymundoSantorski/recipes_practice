import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Recipe {
  final String title;
  final String image;
  final List ingredients;
  final List steps;

  Recipe({
    required this.title,
    required this.image,
    required this.ingredients,
    required this.steps,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'] as String,
      image: json['image'] as String,
      ingredients: json['ingredients'] as List,
      steps: json['steps'] as List,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'image': image,
    'ingredients': ingredients,
    'steps': steps,
  };
}

class RecipeService {
  static Future<void> init() async {
    dynamic data = loadJsonFromAssets('assets/recipes.json');
  }

  static Future<Map<String, dynamic>> loadJsonFromAssets(
    String filePath,
  ) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }
}
