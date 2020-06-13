import 'package:flutter/material.dart';

class WrapPageTransitionsBuilder extends PageTransitionsBuilder {
  final Widget Function(BuildContext, Widget) wrapper;
  final PageTransitionsBuilder base;

  const WrapPageTransitionsBuilder({
    @required this.wrapper,
    @required this.base,
  });

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return base.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      wrapper(context, child),
    );
  }
}
