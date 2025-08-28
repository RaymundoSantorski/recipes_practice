import 'package:flutter/material.dart';
import 'package:recipes_practice/models/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Text(recipe.title);
  }
}
