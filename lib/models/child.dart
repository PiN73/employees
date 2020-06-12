import 'package:dataclass/dataclass.dart';
import 'package:employees/models/user.dart';
import 'package:employees/utils.dart';
import 'package:flutter/foundation.dart';

part 'child.g.dart';

@dataClass
class Child extends _$Child with User {
  final String id;
  final String lastName;
  final String firstName;
  final String middleName;
  final DateTime birthDate;

  Child({
    String id,
    @required this.lastName,
    @required this.firstName,
    @required this.middleName,
    @required this.birthDate,
  })  : this.id = id ?? uuid.v4();
}
