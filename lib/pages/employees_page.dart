import 'package:employees/data/db.dart';
import 'package:employees/data/repository.dart';
import 'package:employees/pages/add_employee_page.dart';
import 'package:employees/pages/employee_page.dart';
import 'package:employees/strings.dart';
import 'package:employees/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Сотрудники'),
      ),
      body: StreamBuilder<List<EmployeeWithChildrenCount>>(
        stream: context.watch<Repository>().employees,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }
          return _EmployeesList(
            data: snapshot.data,
          );
        }
      ),
      floatingActionButton: _AddEmployeeButton(),
    );
  }
}

class _AddEmployeeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.of(context).push<bool>(
        MaterialPageRoute(
          builder: (context) => AddEmployeePage(),
        ),
      ).then((wasSaved) {
        if (wasSaved == true) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Сотрудник добавлен'),
            ),
          );
        }
      }),
    );
  }
}


class _EmployeesList extends StatelessWidget {
  final List<EmployeeWithChildrenCount> data;

  const _EmployeesList({@required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            'Список сотрудников пуст\nДля добавления нажмите кнопку +',
            style: Theme.of(context).textTheme.subtitle1.copyWith(
              height: 1.5,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return ListView.separated(
      itemCount: data.length,
      itemBuilder: (context, i) => _Employee(data: data[i]),
      separatorBuilder: (context, i) => Divider(height: 0, indent: 72),
    );
  }
}

class _Employee extends StatelessWidget {
  final EmployeeWithChildrenCount data;

  const _Employee({@required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(data.employee.lastName[0]),
      ),
      title: Text(
        data.employee.fullName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        subtitleText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EmployeePage(id: data.employee.id),
        ),
      ),
    );
  }

  String get subtitleText {
    if (data.childrenCount != 0) {
      final children = Strings.childrenCount(data.childrenCount).capitalize();
      return children + '  |  ' + data.employee.position;
    }
    return data.employee.position;
  }
}
