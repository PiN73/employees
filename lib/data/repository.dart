import 'dart:collection';

import 'package:employees/data/dummy.dart';
import 'package:employees/models/employee.dart';
import 'package:flutter/foundation.dart';

class Repository with ChangeNotifier {
  List<Employee> _employees = dummyData;

  UnmodifiableListView<Employee> get employees =>
      UnmodifiableListView(_employees);
}
