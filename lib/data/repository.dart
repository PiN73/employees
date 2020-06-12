import 'package:employees/data/db.dart';

class Repository {
  final _db = MyDatabase();

  Stream<List<Employee>> get employees => _db.allEmployees;

  Stream<Employee> employee(int id) => _db.getEmployeeById(id);

  Future<void> addEmployee(EmployeesCompanion entry) =>
      _db.addEmployee(entry);

  // currently not thread safe
  /*void addEmployeeChild(String employeeId, Child child) {
    final i = _employees.indexWhere((it) => it.id == employeeId);
    final employee = _employees[i];
    _employees[i] = employee.copyWith(
      children: [...employee.children, child],
    );
    notifyListeners();
  }*/
}
