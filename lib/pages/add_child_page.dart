import 'package:employees/data/models.dart';
import 'package:employees/data/repository.dart';
import 'package:employees/material_utils.dart';
import 'package:employees/widgets/date_picker_form_field.dart';
import 'package:employees/widgets/dialogs.dart';
import 'package:employees/widgets/form_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// pops with true if child has been added
class AddChildPage extends StatefulWidget {
  final int employeeId;

  const AddChildPage({@required this.employeeId});

  @override
  _AddChildPageState createState() => _AddChildPageState();
}

class _AddChildPageState extends State<AddChildPage> {
  final formKey = GlobalKey<FormState>();

  String lastName;
  String firstName;
  String middleName;
  DateTime birthDate;

  @override
  Widget build(BuildContext context) {
    const double padding = 16;
    return Scaffold(
      appBar: AppBar(
        title: Text('Новый ребёнок'),
      ),
      body: FormStatus(
        builder: (context) => Form(
          key: formKey,
          autovalidate: context.watch<FormStatusData>().wasValidated,
          onChanged: () => context.read<FormStatusData>().onChange(),
          onWillPop: () async {
            if (!context.read<FormStatusData>().wasChanged) {
              return true;
            }
            FocusScope.of(context).unfocus();
            if (await confirmDiscard(context)) {
              return true;
            } else {
              onSubmitPressed(context);
              return false;
            }
          },
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
                padding: EdgeInsets.all(padding),
                child: RaisedButton(
                  child: Text('Сохранить'),
                  onPressed: () => onSubmitPressed(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSubmitPressed(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      final child = ChildrenCompanion.insert(
        lastName: lastName,
        firstName: firstName,
        middleName: middleName,
        birthDate: birthDate,
        parentId: widget.employeeId,
      );
      context.read<Repository>().addEmployeeChild(child);
      Navigator.of(context).pop(true);
    } else {
      context.showSnack('Пожалуйста, проверьте введённые данные');
      context.read<FormStatusData>().onValidate();
    }
  }
}
