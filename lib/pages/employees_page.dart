import 'package:employees/data/repository.dart';
import 'package:employees/models/employee.dart';
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
      body: _EmployeesList(
        data: context.select((Repository r) => r.employees),
      ),
    );
  }
}

class _EmployeesList extends StatelessWidget {
  final List<Employee> data;

  const _EmployeesList({@required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: data.length,
      itemBuilder: (context, i) => _Employee(data: data[i]),
      separatorBuilder: (context, i) => Divider(height: 0, indent: 72),
    );
  }
}

class _Employee extends StatelessWidget {
  final Employee data;

  const _Employee({@required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(data.lastName[0]),
      ),
      title: Text(
        data.fullName,
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
          builder: (context) => EmployeePage(data: data),
        ),
      ),
    );
  }

  String get subtitleText {
    if (data.children.isNotEmpty) {
      final children = Strings.childrenCount(data.children.length).capitalize();
      return children + '  |  ' + data.position;
    }
    return data.position;
  }
}
