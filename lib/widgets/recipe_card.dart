import 'package:flutter/material.dart';
import 'package:recipes_practice/models/recipe_model.dart';
import 'package:recipes_practice/screens/recipe_screen.dart';

/// A card that shows the image and title of a single recipe. Used when user selects the list view
class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});

  /// A Recipe object that contains id, title, image, ingredients and steps
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => RecipeScreen(recipe: recipe),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 12.0),
          child: Row(
            children: [
              Image.asset('assets/${recipe.image}', width: 60, height: 60),
              SizedBox(width: 40),
              Text(recipe.title),
            ],
          ),
        ),
      ),
    );
  }
}
