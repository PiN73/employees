// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$Child {
  const _$Child();

  String get id;
  String get lastName;
  String get firstName;
  String get middleName;
  DateTime get birthDate;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! Child) return false;

    return true &&
        this.id == other.id &&
        this.lastName == other.lastName &&
        this.firstName == other.firstName &&
        this.middleName == other.middleName &&
        this.birthDate == other.birthDate;
  }

  int get hashCode {
    return mapPropsToHashCode([id, lastName, firstName, middleName, birthDate]);
  }

  String toString() {
    return 'Child <\'id\': ${this.id},\'lastName\': ${this.lastName},\'firstName\': ${this.firstName},\'middleName\': ${this.middleName},\'birthDate\': ${this.birthDate},>';
  }

  Child copyWith(
      {String id,
      String lastName,
      String firstName,
      String middleName,
      DateTime birthDate}) {
    return Child(
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      birthDate: birthDate ?? this.birthDate,
    );
  }
}
