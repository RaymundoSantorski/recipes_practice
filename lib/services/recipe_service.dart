import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:recipes_practice/models/recipe_model.dart';

class RecipeService extends StatefulWidget {
  const RecipeService({super.key});
  @override
  State<RecipeService> createState() => RecipeServiceState();
}

/// This service all important aspects necessary while reading and showing recipes in the app
class RecipeServiceState<T extends RecipeService> extends State<T> {
  /// The list of recipes we are working with
  late List<Recipe> fullRecipes = [];

  /// The main list of recipes, where we save the result of [getRecipes], avoiding calling this method several times
  late List<Recipe> recipes = [];

  /// We implement it here, so when writing logic we don't worry about anything else
  TextEditingController controller = TextEditingController(text: '');

  /// Bool variable to control the grid-list view
  bool grid = false;

  /// get the recipes when mounting component
  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  /// change between list and grid view
  void toggleGrid() {
    setState(() {
      grid = !grid;
    });
  }

  /// filter the recipe list depending on the search string
  void filterRecipes(String value) {
    setState(() {
      recipes = fullRecipes
          .where(
            (Recipe recipe) =>
                recipe.title.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

  /// load recipes from json file and serialize as a Recipe list
  Future<void> getRecipes() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/recipes.json',
      );
      List<dynamic> data = await json.decode(response);
      setState(() {
        fullRecipes = data.map((phrase) => Recipe.fromJson(phrase)).toList();
        recipes = fullRecipes;
      });
    } catch (err) {
      print(err);
      setState(() {
        fullRecipes = [];
        recipes = fullRecipes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
