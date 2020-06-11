import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class _Plural {
  final String one, few, many;

  const _Plural({
    @required this.one,
    @required this.few,
    @required this.many,
  });

  String call(int number) {
    return Intl.plural(
      number,
      one: one,
      few: few,
      many: many,
      other: many,
      args: [number],
    );
  }
}

class Strings {
  static const children = _Plural(
    one: 'ребёнок',
    few: 'ребёнка',
    many: 'детей',
  );

  static String childrenCount(int number) {
    final count = number == 0 ? 'нет' : '$number';
    final label = children(number);
    return '$count $label';
  }

  static const ages = _Plural(
    one: 'год',
    few: 'года',
    many: 'лет',
  );

  static String agesCount(int number) {
    final label = ages(number);
    return '$number $label';
  }
}
