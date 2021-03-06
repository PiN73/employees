import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String format() => DateFormat.yMd().format(this);

  int getAge() {
    final now = DateTime.now();
    final age = now.year - this.year;
    if (this.month > now.month) {
      return age - 1;
    }
    if (this.month == now.month && this.day > now.day) {
      return age - 1;
    }
    return age;
  }
}

extension IterableExtensions<T> on Iterable<T> {
  List<U> mapToList<U>(U f(T t)) => map(f).toList();
}

extension StringExtensions on String {
  String capitalize() => toBeginningOfSentenceCase(this);
}
