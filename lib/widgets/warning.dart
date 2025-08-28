import 'package:flutter/material.dart';

SnackBar snackBar(String content, Color color) {
  return SnackBar(
    content: Text(
      content,
      style: TextStyle(fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
    backgroundColor: color,
  );
}
