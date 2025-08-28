import 'package:flutter/material.dart';
import 'package:recipes_practice/models/recipe_model.dart';
import 'package:recipes_practice/services/recipe_service.dart';
import 'package:recipes_practice/widgets/recipe_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Recipe> recipes = RecipeService.recipes;
    return SafeArea(
      child: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) => RecipeCard(recipe: recipes[index]),
      ),
    );
  }
}
