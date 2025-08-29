import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_practice/models/recipe_model.dart';
import 'package:recipes_practice/services/recipe_service.dart';
import 'package:recipes_practice/widgets/no_recipes.dart';
import 'package:recipes_practice/widgets/recipe_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Recipe> recipes = Provider.of<RecipeService>(context).recipes;
    return SafeArea(
      child: recipes.isNotEmpty
          ? ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) =>
                  RecipeCard(recipe: recipes[index]),
            )
          : NoRecipes(),
    );
  }
}
