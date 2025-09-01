import 'package:flutter/material.dart';
import 'package:recipes_practice/models/recipe_model.dart';
import 'package:recipes_practice/screens/recipe_screen.dart';

/// Grid view of the recipes, required a list of Recipe objects, show an image of every recipe
class RecipesGrid extends StatelessWidget {
  const RecipesGrid({super.key, required this.recipes});
  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(8.0),
      crossAxisCount: 3,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      children: [
        for (Recipe recipe in recipes)
          AspectRatio(
            aspectRatio: 1,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RecipeScreen(recipe: recipe),
                  ),
                );
              },
              child: Image.asset('assets/${recipe.image}', fit: BoxFit.cover),
            ),
          ),
      ],
    );
  }
}
