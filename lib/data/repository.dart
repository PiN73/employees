import 'dart:collection';
import 'package:employees/data/dummy.dart';
import 'package:employees/models/child.dart';
import 'package:employees/models/employee.dart';
import 'package:flutter/foundation.dart';

class Repository with ChangeNotifier {
  List<Employee> _employees = dummyData;

  UnmodifiableListView<Employee> get employees =>
      UnmodifiableListView(_employees);

  Employee getEmployee(String id) =>
      _employees.singleWhere((it) => it.id == id);

  void addEmployee(Employee data) {
    _employees.insert(0, data);
    notifyListeners();
  }

  // currently not thread safe
  void addEmployeeChild(String employeeId, Child child) {
    final i = _employees.indexWhere((it) => it.id == employeeId);
    final employee = _employees[i];
    _employees[i] = employee.copyWith(
      children: [...employee.children, child],
    );
    notifyListeners();
  }
}
