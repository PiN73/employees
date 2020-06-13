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
          child: Text(trueAction),
          onPressed: () => Navigator.of(context).pop(true),
        ),
        FlatButton(
          child: Text(falseAction),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ],
    ),
  );
}

Future<bool> confirmDiscard(BuildContext context) {
  return confirm(
    context: context,
    content: 'Данные не сохранены',
    trueAction: 'Не сохранять',
    falseAction: 'Сохранить',
  );
}
