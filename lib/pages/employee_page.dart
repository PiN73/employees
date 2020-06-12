import 'package:employees/data/repository.dart';
import 'package:employees/models/child.dart';
import 'package:employees/models/employee.dart';
import 'package:employees/pages/add_child_page.dart';
import 'package:employees/strings.dart';
import 'package:employees/utils.dart';
import 'package:employees/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeePage extends StatelessWidget {
  final String id;

  const EmployeePage({@required this.id});

  @override
  Widget build(BuildContext context) {
    return _EmployeePage(
      data: context.select((Repository r) => r.getEmployee(id)),
    );
  }
}

class _EmployeePage extends StatelessWidget {
  final Employee data;

  const _EmployeePage({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.initials),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'Данные сотрудника',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          UserInfo(data: data),
          SliverToBoxAdapter(
            child: DataTile(
              label: 'Должность: ',
              value: data.position,
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                data.children.isNotEmpty
                  ? 'Дети (${data.children.length})'
                  : 'Детей нет',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          _ChildrenList(data: data.children),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: _AddChild(data: data),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
        ],
      ),
    );
  }
}

class _ChildrenList extends StatelessWidget {
  final List<Child> data;

  const _ChildrenList({@required this.data});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) => _Child(data: data[i]),
        childCount: data.length,
      ),
    );
  }
}

class _Child extends StatelessWidget {
  final Child data;

  const _Child({@required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.person),
        foregroundColor: Colors.white,
      ),
      title: Text(
        data.fullName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        Strings.agesCount(data.birthDate.getAge()),
      ),
    );
  }
}

class _AddChild extends StatelessWidget {
  final Employee data;

  const _AddChild({@required this.data});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Добавить ребёнка'),
      onPressed: () => Navigator.of(context)
          .push<bool>(
        MaterialPageRoute(
          builder: (context) => AddChildPage(employeeId: data.id),
        ),
      ).then((wasSaved) {
        if (wasSaved == true) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Ребёнок добавлен'),
            ),
          );
        }
      }),
    );
  }
}
