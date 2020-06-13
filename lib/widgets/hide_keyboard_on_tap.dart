import 'package:flutter/widgets.dart';

// https://stackoverflow.com/q/51652897/6131611
/// Hides soft input keyboard on tap outside of buttons, text-fields, etc
class HideKeyboardOnTap extends StatelessWidget {
  final Widget child;

  const HideKeyboardOnTap({this.child});

  @override
  Widget build(BuildContext context) {
    final scope = FocusScope.of(context);
    return GestureDetector(
      onTap: scope.hasPrimaryFocus || scope.hasFocus
          ? () => FocusScope.of(context).unfocus()
          : null,
      child: child,
    );
  }

  static Widget wrapper(BuildContext context, Widget child) {
    return HideKeyboardOnTap(child: child);
  }
}
