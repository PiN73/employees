import 'package:employees/data/db.dart';

class Repository {
  final _db = MyDatabase();

  Stream<List<Employee>> get employees => _db.allEmployees;

  Stream<Employee> employee(int id) => _db.getEmployeeById(id);

  Stream<List<Child>> employeeChildren(int id) =>
      _db.getChildrenByEmployeeId(id);

  Future<void> addEmployee(EmployeesCompanion entry) =>
      _db.addEmployee(entry);

  Future<void> addEmployeeChild(ChildrenCompanion entry) =>
      _db.addChild(entry);
}
