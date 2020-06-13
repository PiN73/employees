import 'package:employees/data/models.dart';
import 'package:employees/data/repository.dart';
import 'package:employees/material_utils.dart';
import 'package:employees/pages/add_child_page.dart';
import 'package:employees/strings.dart';
import 'package:employees/utils.dart';
import 'package:employees/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeePage extends StatelessWidget {
  final int id;

  const EmployeePage({@required this.id});

  @override
  Widget build(BuildContext context) {
    final repository = context.watch<Repository>();
    return StreamBuilder<Employee>(
      stream: repository.employee(id),
      builder: (context, employeeSnapshot) {
        return StreamBuilder<List<Child>>(
          stream: repository.employeeChildren(id),
          builder: (context, childrenSnapshot) {
            if (!employeeSnapshot.hasData || !childrenSnapshot.hasData) {
              return Scaffold(
                appBar: AppBar(),
                body: LinearProgressIndicator(),
              );
            }
            return _EmployeePage(
              employee: employeeSnapshot.data,
              children: childrenSnapshot.data,
            );
          }
        );
      }
    );
  }
}

class _EmployeePage extends StatelessWidget {
  final Employee employee;
  final List<Child> children;

  const _EmployeePage({
    @required this.employee,
    @required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee.initials),
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
          UserInfo(data: employee),
          SliverToBoxAdapter(
            child: DataTile(
              label: 'Должность: ',
              value: employee.position,
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                children.isNotEmpty
                  ? 'Дети (${children.length})'
                  : 'Детей нет',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          _ChildrenList(data: children),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Center(child: _AddChild(data: employee)),
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
        backgroundColor: Theme.of(context).colorScheme.secondaryVariant,
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
      onPressed: () => context.push<bool>(
        MaterialPageRoute(
          builder: (context) => AddChildPage(employeeId: data.id),
          fullscreenDialog: true,
        ),
      ).then((wasSaved) {
        if (wasSaved == true) {
          context.showSnack('Ребёнок добавлен');
        }
      }),
    );
  }
}
