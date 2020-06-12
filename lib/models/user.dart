import 'package:flutter/foundation.dart';

@immutable
abstract class User {
  String get lastName;
  String get firstName;
  String get middleName;
  DateTime get birthDate;

  String get fullName => '$lastName $firstName $middleName';

  String get initials => '$lastName ${firstName[0]}. ${middleName[0]}.';
}
