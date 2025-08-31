import 'package:flutter/material.dart';

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
