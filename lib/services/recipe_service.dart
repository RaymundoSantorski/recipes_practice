import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:recipes_practice/models/recipe_model.dart';

class RecipeService extends StatefulWidget {
  const RecipeService({super.key});
  @override
  State<RecipeService> createState() => RecipeServiceState();
}

class RecipeServiceState<T extends RecipeService> extends State<T> {
  late List<Recipe> fullRecipes = [];
  late List<Recipe> recipes = [];
  TextEditingController controller = TextEditingController(text: '');
  bool grid = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  void toggleGrid() {
    setState(() {
      grid = !grid;
    });
  }

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
