import 'package:employees/data/db.dart';
import 'package:employees/data/dummy.dart';

class Repository {
  final _db = MyDatabase();

  Stream<List<EmployeeWithChildrenCount>> get employees =>
      _db.allEmployeesWithChildrenCount;

  Stream<Employee> employee(int id) => _db.getEmployeeById(id);

  Stream<List<Child>> employeeChildren(int id) =>
      _db.getChildrenByEmployeeId(id);

  Future<void> addEmployee(EmployeesCompanion entry) =>
      _db.addEmployee(entry);

  Future<void> addEmployeeChild(ChildrenCompanion entry) =>
      _db.addChild(entry);

  void addDummy() => addDummyData(_db);

  void clearAll() => _db.clearAllData();
}
