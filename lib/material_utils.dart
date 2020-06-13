import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  void showSnack(String content) {
    Scaffold.of(this).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }

  Future<T> push<T>(Route<T> route) {
    Scaffold.of(this, nullOk: true)?.removeCurrentSnackBar();
    return Navigator.of(this).push(route);
  }
}
