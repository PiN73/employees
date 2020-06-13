import 'package:flutter/material.dart';

Future<bool> confirm({
  @required BuildContext context,
  @required String content,
  @required String trueAction,
  @required String falseAction,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(content),
      actions: [
        FlatButton(
          child: Text(falseAction),
          textColor: Theme.of(context).colorScheme.primary,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        FlatButton(
          child: Text(trueAction),
          textColor: Theme.of(context).colorScheme.primary,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    ),
  );
}

Future<bool> confirmDiscard(BuildContext context) {
  return confirm(
    context: context,
    content: 'Данные не сохранены',
    trueAction: 'НЕ СОХРАНЯТЬ',
    falseAction: 'СОХРАНИТЬ',
  );
}
