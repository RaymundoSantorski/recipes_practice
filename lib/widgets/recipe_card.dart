import 'package:flutter/material.dart';
import 'package:recipes_practice/models/recipe_model.dart';
import 'package:recipes_practice/screens/recipe_screen.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => RecipeScreen()),
        );
      },
      child: Card(child: Row(children: [Text(recipe.title)])),
    );
  }
}
