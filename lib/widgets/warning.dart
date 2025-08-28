import 'package:flutter/material.dart';

SnackBar snackBar(String content, Color color) {
  return SnackBar(content: Text(content), backgroundColor: color);
}
