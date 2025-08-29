import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_practice/services/recipe_service.dart';

class _SearchBarState extends StatefulWidget {
  @override
  State<_SearchBarState> createState() => _SearchBarStateState();
}

class _SearchBarStateState extends State<_SearchBarState> {
  @override
  Widget build(BuildContext context) {
    final void Function(String) searchBy = Provider.of<RecipeService>(
      context,
    ).searchBy;
    final TextEditingController _controller = TextEditingController(text: '');
    return TextField(
      controller: _controller,
      onChanged: (value) {
        searchBy(value);
      },
    );
  }
}
