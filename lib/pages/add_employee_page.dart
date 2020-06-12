import 'package:employees/data/db.dart';
import 'package:employees/data/repository.dart';
import 'package:employees/widgets/date_picker_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// pops with true if employee has been added
class AddEmployeePage extends StatefulWidget {
  @override
  _AddEmployeePageState createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  final formKey = GlobalKey<FormState>();

  String lastName;
  String firstName;
  String middleName;
  DateTime birthDate;
  String position;

  @override
  Widget build(BuildContext context) {
    const double padding = 16;
    return WillPopScope(
      onWillPop: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('На странице есть несохранённые данные'),
          actions: [
            FlatButton(
              child: Text('УДАЛИТЬ'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
            FlatButton(
              child: Text('ПРОДОЛЖИТЬ'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Новый сотрудник'),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Фамилия',
                  ),
                  validator: (value) {
                    if (value.isEmpty) return 'Введите фамилию';
                    if (value.length > 20)
                      return 'Максимальная длина - 20 символов';
                    return null;
                  },
                  onSaved: (value) => lastName = value,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Имя',
                  ),
                  validator: (value) {
                    if (value.isEmpty) return 'Введите имя';
                    if (value.length > 20)
                      return 'Максимальная длина - 20 символов';
                    return null;
                  },
                  onSaved: (value) => firstName = value,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Отчество',
                  ),
                  validator: (value) {
                    if (value.isEmpty) return 'Введите отчество';
                    if (value.length > 20)
                      return 'Максимальная длина - 20 символов';
                    return null;
                  },
                  onSaved: (value) => middleName = value,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: DatePickerFormField(
                  decoration: InputDecoration(
                    labelText: 'Дата рождения',
                  ),
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900, 1, 1),
                  lastDate: DateTime.now(),
                  validator: (value) {
                    if (value == null) return 'Введите дату рождения';
                    return null;
                  },
                  onSaved: (value) => birthDate = value,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Должность',
                  ),
                  validator: (value) {
                    if (value.isEmpty) return 'Введите должность';
                    if (value.length > 100)
                      return 'Максимальная длина - 100 символов';
                    return null;
                  },
                  onSaved: (value) => position = value,
                ),
              ),
              SizedBox(height: padding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: RaisedButton(
                  child: Text('Сохранить'),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      final employee = EmployeesCompanion.insert(
                        lastName: lastName,
                        firstName: firstName,
                        middleName: middleName,
                        birthDate: birthDate,
                        position: position,
                      );
                      context.read<Repository>().addEmployee(employee);
                      Navigator.of(context).pop(true);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
