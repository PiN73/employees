import 'package:employees/models/user.dart';
import 'package:flutter/foundation.dart';

@immutable
class Child extends User {
  Child({
    @required String lastName,
    @required String firstName,
    @required String middleName,
    @required DateTime birthDate,
  }) : super(
    lastName: lastName,
    firstName: firstName,
    middleName: middleName,
    birthDate: birthDate,
  );
}
