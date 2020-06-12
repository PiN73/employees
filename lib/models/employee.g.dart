// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$Employee {
  const _$Employee();

  String get id;
  String get lastName;
  String get firstName;
  String get middleName;
  DateTime get birthDate;
  String get position;
  List<Child> get children;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! Employee) return false;

    return true &&
        this.id == other.id &&
        this.lastName == other.lastName &&
        this.firstName == other.firstName &&
        this.middleName == other.middleName &&
        this.birthDate == other.birthDate &&
        this.position == other.position &&
        DeepCollectionEquality().equals(this.children, other.children);
  }

  int get hashCode {
    return mapPropsToHashCode(
        [id, lastName, firstName, middleName, birthDate, position, children]);
  }

  String toString() {
    return 'Employee <\'id\': ${this.id},\'lastName\': ${this.lastName},\'firstName\': ${this.firstName},\'middleName\': ${this.middleName},\'birthDate\': ${this.birthDate},\'position\': ${this.position},\'children\': ${this.children},>';
  }

  Employee copyWith(
      {String id,
      String lastName,
      String firstName,
      String middleName,
      DateTime birthDate,
      String position,
      List<Child> children}) {
    return Employee(
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      birthDate: birthDate ?? this.birthDate,
      position: position ?? this.position,
      children: children ?? this.children,
    );
  }
}
