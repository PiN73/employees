// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Employee extends DataClass with User implements Insertable<Employee> {
  final int id;
  final String lastName;
  final String firstName;
  final String middleName;
  final DateTime birthDate;
  final String position;
  Employee(
      {@required this.id,
      @required this.lastName,
      @required this.firstName,
      @required this.middleName,
      @required this.birthDate,
      @required this.position});
  factory Employee.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Employee(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      lastName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      firstName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      middleName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}middle_name']),
      birthDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}birth_date']),
      position: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}position']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || middleName != null) {
      map['middle_name'] = Variable<String>(middleName);
    }
    if (!nullToAbsent || birthDate != null) {
      map['birth_date'] = Variable<DateTime>(birthDate);
    }
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<String>(position);
    }
    return map;
  }

  EmployeesCompanion toCompanion(bool nullToAbsent) {
    return EmployeesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      middleName: middleName == null && nullToAbsent
          ? const Value.absent()
          : Value(middleName),
      birthDate: birthDate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthDate),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
    );
  }

  factory Employee.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Employee(
      id: serializer.fromJson<int>(json['id']),
      lastName: serializer.fromJson<String>(json['lastName']),
      firstName: serializer.fromJson<String>(json['firstName']),
      middleName: serializer.fromJson<String>(json['middleName']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      position: serializer.fromJson<String>(json['position']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lastName': serializer.toJson<String>(lastName),
      'firstName': serializer.toJson<String>(firstName),
      'middleName': serializer.toJson<String>(middleName),
      'birthDate': serializer.toJson<DateTime>(birthDate),
      'position': serializer.toJson<String>(position),
    };
  }

  Employee copyWith(
          {int id,
          String lastName,
          String firstName,
          String middleName,
          DateTime birthDate,
          String position}) =>
      Employee(
        id: id ?? this.id,
        lastName: lastName ?? this.lastName,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        birthDate: birthDate ?? this.birthDate,
        position: position ?? this.position,
      );
  @override
  String toString() {
    return (StringBuffer('Employee(')
          ..write('id: $id, ')
          ..write('lastName: $lastName, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('birthDate: $birthDate, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          lastName.hashCode,
          $mrjc(
              firstName.hashCode,
              $mrjc(middleName.hashCode,
                  $mrjc(birthDate.hashCode, position.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Employee &&
          other.id == this.id &&
          other.lastName == this.lastName &&
          other.firstName == this.firstName &&
          other.middleName == this.middleName &&
          other.birthDate == this.birthDate &&
          other.position == this.position);
}

class EmployeesCompanion extends UpdateCompanion<Employee> {
  final Value<int> id;
  final Value<String> lastName;
  final Value<String> firstName;
  final Value<String> middleName;
  final Value<DateTime> birthDate;
  final Value<String> position;
  const EmployeesCompanion({
    this.id = const Value.absent(),
    this.lastName = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.position = const Value.absent(),
  });
  EmployeesCompanion.insert({
    this.id = const Value.absent(),
    @required String lastName,
    @required String firstName,
    @required String middleName,
    @required DateTime birthDate,
    @required String position,
  })  : lastName = Value(lastName),
        firstName = Value(firstName),
        middleName = Value(middleName),
        birthDate = Value(birthDate),
        position = Value(position);
  static Insertable<Employee> custom({
    Expression<int> id,
    Expression<String> lastName,
    Expression<String> firstName,
    Expression<String> middleName,
    Expression<DateTime> birthDate,
    Expression<String> position,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lastName != null) 'last_name': lastName,
      if (firstName != null) 'first_name': firstName,
      if (middleName != null) 'middle_name': middleName,
      if (birthDate != null) 'birth_date': birthDate,
      if (position != null) 'position': position,
    });
  }

  EmployeesCompanion copyWith(
      {Value<int> id,
      Value<String> lastName,
      Value<String> firstName,
      Value<String> middleName,
      Value<DateTime> birthDate,
      Value<String> position}) {
    return EmployeesCompanion(
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      birthDate: birthDate ?? this.birthDate,
      position: position ?? this.position,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (middleName.present) {
      map['middle_name'] = Variable<String>(middleName.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    return map;
  }
}

class $EmployeesTable extends Employees
    with TableInfo<$EmployeesTable, Employee> {
  final GeneratedDatabase _db;
  final String _alias;
  $EmployeesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  GeneratedTextColumn _lastName;
  @override
  GeneratedTextColumn get lastName => _lastName ??= _constructLastName();
  GeneratedTextColumn _constructLastName() {
    return GeneratedTextColumn('last_name', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  GeneratedTextColumn _firstName;
  @override
  GeneratedTextColumn get firstName => _firstName ??= _constructFirstName();
  GeneratedTextColumn _constructFirstName() {
    return GeneratedTextColumn('first_name', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _middleNameMeta = const VerificationMeta('middleName');
  GeneratedTextColumn _middleName;
  @override
  GeneratedTextColumn get middleName => _middleName ??= _constructMiddleName();
  GeneratedTextColumn _constructMiddleName() {
    return GeneratedTextColumn('middle_name', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _birthDateMeta = const VerificationMeta('birthDate');
  GeneratedDateTimeColumn _birthDate;
  @override
  GeneratedDateTimeColumn get birthDate => _birthDate ??= _constructBirthDate();
  GeneratedDateTimeColumn _constructBirthDate() {
    return GeneratedDateTimeColumn(
      'birth_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _positionMeta = const VerificationMeta('position');
  GeneratedTextColumn _position;
  @override
  GeneratedTextColumn get position => _position ??= _constructPosition();
  GeneratedTextColumn _constructPosition() {
    return GeneratedTextColumn('position', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, lastName, firstName, middleName, birthDate, position];
  @override
  $EmployeesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'employees';
  @override
  final String actualTableName = 'employees';
  @override
  VerificationContext validateIntegrity(Insertable<Employee> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name'], _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name'], _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('middle_name')) {
      context.handle(
          _middleNameMeta,
          middleName.isAcceptableOrUnknown(
              data['middle_name'], _middleNameMeta));
    } else if (isInserting) {
      context.missing(_middleNameMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date'], _birthDateMeta));
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position'], _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Employee map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Employee.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EmployeesTable createAlias(String alias) {
    return $EmployeesTable(_db, alias);
  }
}

class Child extends DataClass with User implements Insertable<Child> {
  final int id;
  final String lastName;
  final String firstName;
  final String middleName;
  final DateTime birthDate;
  final int parentId;
  Child(
      {@required this.id,
      @required this.lastName,
      @required this.firstName,
      @required this.middleName,
      @required this.birthDate,
      @required this.parentId});
  factory Child.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Child(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      lastName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      firstName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      middleName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}middle_name']),
      birthDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}birth_date']),
      parentId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}parent_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || middleName != null) {
      map['middle_name'] = Variable<String>(middleName);
    }
    if (!nullToAbsent || birthDate != null) {
      map['birth_date'] = Variable<DateTime>(birthDate);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    return map;
  }

  ChildrenCompanion toCompanion(bool nullToAbsent) {
    return ChildrenCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      middleName: middleName == null && nullToAbsent
          ? const Value.absent()
          : Value(middleName),
      birthDate: birthDate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthDate),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
    );
  }

  factory Child.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Child(
      id: serializer.fromJson<int>(json['id']),
      lastName: serializer.fromJson<String>(json['lastName']),
      firstName: serializer.fromJson<String>(json['firstName']),
      middleName: serializer.fromJson<String>(json['middleName']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      parentId: serializer.fromJson<int>(json['parentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lastName': serializer.toJson<String>(lastName),
      'firstName': serializer.toJson<String>(firstName),
      'middleName': serializer.toJson<String>(middleName),
      'birthDate': serializer.toJson<DateTime>(birthDate),
      'parentId': serializer.toJson<int>(parentId),
    };
  }

  Child copyWith(
          {int id,
          String lastName,
          String firstName,
          String middleName,
          DateTime birthDate,
          int parentId}) =>
      Child(
        id: id ?? this.id,
        lastName: lastName ?? this.lastName,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        birthDate: birthDate ?? this.birthDate,
        parentId: parentId ?? this.parentId,
      );
  @override
  String toString() {
    return (StringBuffer('Child(')
          ..write('id: $id, ')
          ..write('lastName: $lastName, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('birthDate: $birthDate, ')
          ..write('parentId: $parentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          lastName.hashCode,
          $mrjc(
              firstName.hashCode,
              $mrjc(middleName.hashCode,
                  $mrjc(birthDate.hashCode, parentId.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Child &&
          other.id == this.id &&
          other.lastName == this.lastName &&
          other.firstName == this.firstName &&
          other.middleName == this.middleName &&
          other.birthDate == this.birthDate &&
          other.parentId == this.parentId);
}

class ChildrenCompanion extends UpdateCompanion<Child> {
  final Value<int> id;
  final Value<String> lastName;
  final Value<String> firstName;
  final Value<String> middleName;
  final Value<DateTime> birthDate;
  final Value<int> parentId;
  const ChildrenCompanion({
    this.id = const Value.absent(),
    this.lastName = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.parentId = const Value.absent(),
  });
  ChildrenCompanion.insert({
    this.id = const Value.absent(),
    @required String lastName,
    @required String firstName,
    @required String middleName,
    @required DateTime birthDate,
    @required int parentId,
  })  : lastName = Value(lastName),
        firstName = Value(firstName),
        middleName = Value(middleName),
        birthDate = Value(birthDate),
        parentId = Value(parentId);
  static Insertable<Child> custom({
    Expression<int> id,
    Expression<String> lastName,
    Expression<String> firstName,
    Expression<String> middleName,
    Expression<DateTime> birthDate,
    Expression<int> parentId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lastName != null) 'last_name': lastName,
      if (firstName != null) 'first_name': firstName,
      if (middleName != null) 'middle_name': middleName,
      if (birthDate != null) 'birth_date': birthDate,
      if (parentId != null) 'parent_id': parentId,
    });
  }

  ChildrenCompanion copyWith(
      {Value<int> id,
      Value<String> lastName,
      Value<String> firstName,
      Value<String> middleName,
      Value<DateTime> birthDate,
      Value<int> parentId}) {
    return ChildrenCompanion(
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      birthDate: birthDate ?? this.birthDate,
      parentId: parentId ?? this.parentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (middleName.present) {
      map['middle_name'] = Variable<String>(middleName.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    return map;
  }
}

class $ChildrenTable extends Children with TableInfo<$ChildrenTable, Child> {
  final GeneratedDatabase _db;
  final String _alias;
  $ChildrenTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  GeneratedTextColumn _lastName;
  @override
  GeneratedTextColumn get lastName => _lastName ??= _constructLastName();
  GeneratedTextColumn _constructLastName() {
    return GeneratedTextColumn('last_name', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  GeneratedTextColumn _firstName;
  @override
  GeneratedTextColumn get firstName => _firstName ??= _constructFirstName();
  GeneratedTextColumn _constructFirstName() {
    return GeneratedTextColumn('first_name', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _middleNameMeta = const VerificationMeta('middleName');
  GeneratedTextColumn _middleName;
  @override
  GeneratedTextColumn get middleName => _middleName ??= _constructMiddleName();
  GeneratedTextColumn _constructMiddleName() {
    return GeneratedTextColumn('middle_name', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _birthDateMeta = const VerificationMeta('birthDate');
  GeneratedDateTimeColumn _birthDate;
  @override
  GeneratedDateTimeColumn get birthDate => _birthDate ??= _constructBirthDate();
  GeneratedDateTimeColumn _constructBirthDate() {
    return GeneratedDateTimeColumn(
      'birth_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _parentIdMeta = const VerificationMeta('parentId');
  GeneratedIntColumn _parentId;
  @override
  GeneratedIntColumn get parentId => _parentId ??= _constructParentId();
  GeneratedIntColumn _constructParentId() {
    return GeneratedIntColumn(
      'parent_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, lastName, firstName, middleName, birthDate, parentId];
  @override
  $ChildrenTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'children';
  @override
  final String actualTableName = 'children';
  @override
  VerificationContext validateIntegrity(Insertable<Child> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name'], _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name'], _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('middle_name')) {
      context.handle(
          _middleNameMeta,
          middleName.isAcceptableOrUnknown(
              data['middle_name'], _middleNameMeta));
    } else if (isInserting) {
      context.missing(_middleNameMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date'], _birthDateMeta));
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id'], _parentIdMeta));
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Child map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Child.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ChildrenTable createAlias(String alias) {
    return $ChildrenTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $EmployeesTable _employees;
  $EmployeesTable get employees => _employees ??= $EmployeesTable(this);
  $ChildrenTable _children;
  $ChildrenTable get children => _children ??= $ChildrenTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [employees, children];
}
