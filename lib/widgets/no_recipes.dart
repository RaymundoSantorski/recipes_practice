import 'package:flutter/material.dart';

/// Shows a message when there is no recipes to show e.g. when you search a string no contained in any recipe title
class NoRecipes extends StatelessWidget {
  const NoRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('No hay recetas para mostrar'));
  }
}
