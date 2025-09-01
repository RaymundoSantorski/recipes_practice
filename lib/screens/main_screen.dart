import 'package:flutter/material.dart';
import 'package:recipes_practice/services/recipe_service.dart';
import 'package:recipes_practice/widgets/no_recipes.dart';
import 'package:recipes_practice/widgets/recipe_card.dart';
import 'package:recipes_practice/widgets/recipes_grid.dart';
import 'package:recipes_practice/widgets/search_bar.dart';

/// Main screen state class
class MainScreen extends RecipeService {
  const MainScreen({super.key, required this.title});
  final String title;
  @override
  State<RecipeService> createState() => _MainScreenState();
}

/// Main screen logic, inherits from recipe service
class _MainScreenState extends RecipeServiceState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: toggleGrid,
            icon: Icon(grid ? Icons.grid_3x3_outlined : Icons.list),
          ),
        ],
        title: Column(
          children: [
            Text(widget.title),
            MySearchBar(controller: controller, filter: filterRecipes),
          ],
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
      ),
      body: SafeArea(
        child: recipes.isNotEmpty
            ? grid
                  ? RecipesGrid(recipes: recipes)
                  : ListView.builder(
                      itemCount: recipes.length,
                      itemBuilder: (context, index) =>
                          RecipeCard(recipe: recipes[index]),
                    )
            : NoRecipes(),
      ),
    );
  }
}
