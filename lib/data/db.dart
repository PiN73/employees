import 'package:employees/models/user.dart';
import 'package:employees/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:moor/moor.dart';
import 'dart:io';

part 'db.g.dart';

class Employees extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get lastName => text().withLength(min: 1, max: 20)();
  TextColumn get firstName => text().withLength(min: 1, max: 20)();
  TextColumn get middleName => text().withLength(min: 1, max: 20)();
  DateTimeColumn get birthDate => dateTime()();
  TextColumn get position => text().withLength(min: 1, max: 100)();
}

@DataClassName("Child")
class Children extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get lastName => text().withLength(min: 1, max: 20)();
  TextColumn get firstName => text().withLength(min: 1, max: 20)();
  TextColumn get middleName => text().withLength(min: 1, max: 20)();
  DateTimeColumn get birthDate => dateTime()();
  IntColumn get parentId => integer()();
}


LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Employees, Children])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<Employee>> get allEmployees => select(employees).watch();

  Stream<List<EmployeeWithChildrenCount>> get allEmployeesWithChildrenCount {
    final childrenCount = children.id.count();

    final query = select(employees).join([
      innerJoin(
        children,
        children.parentId.equalsExp(employees.id),
        useColumns: false,
      )
    ])
      ..addColumns([childrenCount])
      ..groupBy([employees.id]);

    return query.watch().map(
      (rows) => rows.mapToList(
        (row) => EmployeeWithChildrenCount(
          row.readTable(employees),
          row.read(childrenCount),
        ),
      ),
    );
  }

  Stream<Employee> getEmployeeById(int id) {
    return (select(employees)..where((e) => e.id.equals(id))).watchSingle();
  }

  Future<int> addEmployee(EmployeesCompanion entry) {
    return into(employees).insert(entry);
  }

  Future<int> addChild(ChildrenCompanion entry) {
    return into(children).insert(entry);
  }

  Stream<List<Child>> getChildrenByEmployeeId(int id) {
    return (select(children)..where((e) => e.parentId.equals(id))).watch();
  }
}

@immutable
class EmployeeWithChildrenCount {
  final Employee employee;
  final int childrenCount;

  EmployeeWithChildrenCount(this.employee, this.childrenCount);
}
