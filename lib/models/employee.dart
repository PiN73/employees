import 'package:employees/models/child.dart';
import 'package:employees/models/user.dart';
import 'package:flutter/foundation.dart';

@immutable
class Employee extends User {
  final String position;
  final List<Child> children;

  Employee({
    @required String lastName,
    @required String firstName,
    @required String middleName,
    @required DateTime birthDate,
    @required this.position,
    this.children = const [],
  }) : super(
    lastName: lastName,
    firstName: firstName,
    middleName: middleName,
    birthDate: birthDate,
  );
}
