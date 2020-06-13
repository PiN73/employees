import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  void showSnack(String content) {
    Scaffold.of(this).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }
}
