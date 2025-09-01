import 'package:flutter/material.dart';

/// Search bar that uses the [filterRecipes] method in the [RecipeService] to filter the recipe results
class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
    required this.controller,
    required this.filter,
  });
  final TextEditingController controller;
  final void Function(String) filter;

  @override
  Widget build(BuildContext context) {
    return TextField(controller: controller, onChanged: filter);
  }
}
