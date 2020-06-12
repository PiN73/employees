import 'package:dataclass/dataclass.dart';
import 'package:employees/models/child.dart';
import 'package:employees/models/user.dart';
import 'package:employees/utils.dart';
import 'package:flutter/foundation.dart';

part 'employee.g.dart';

@dataClass
class Employee extends _$Employee with User {
  final String id;
  final String lastName;
  final String firstName;
  final String middleName;
  final DateTime birthDate;
  final String position;
  @Collection(deepEquality: true)
  final List<Child> children;

  Employee({
    String id,
    @required this.lastName,
    @required this.firstName,
    @required this.middleName,
    @required this.birthDate,
    @required this.position,
    List<Child> children,
  })  : this.id = id ?? uuid.v4(),
        this.children = children ?? [];
}
