import 'package:flutter/foundation.dart';

@immutable
abstract class User {
  final String lastName;
  final String firstName;
  final String middleName;
  final DateTime birthDate;

  User({
    @required this.lastName,
    @required this.firstName,
    @required this.middleName,
    @required this.birthDate,
  });

  String get fullName => '$lastName $firstName $middleName';

  String get initials => '$lastName ${firstName[0]}. ${middleName[0]}.';
}
