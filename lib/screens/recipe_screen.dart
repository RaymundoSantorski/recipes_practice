import 'package:flutter/material.dart';
import 'package:recipes_practice/models/recipe_model.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image.asset('assets/${recipe.image}', fit: BoxFit.fill),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Title(
              color: Colors.black,
              child: Text(
                recipe.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(height: 40),
            Text('Ingredientes:'),
            for (String ingredient in recipe.ingredients)
              Text('* $ingredient', textAlign: TextAlign.center),
            Divider(),
            Text('Pasos:'),
            for (String step in recipe.steps)
              Text('* $step', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
