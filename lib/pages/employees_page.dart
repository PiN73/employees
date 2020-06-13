import 'package:employees/data/models.dart';
import 'package:employees/data/repository.dart';
import 'package:employees/material_utils.dart';
import 'package:employees/pages/add_employee_page.dart';
import 'package:employees/pages/employee_page.dart';
import 'package:employees/strings.dart';
import 'package:employees/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<EmployeeWithChildrenCount>>(
      stream: context.watch<Repository>().employees,
      builder: (context, snapshot) => Scaffold(
        appBar: AppBar(
          title: Text('Сотрудники'),
          actions: [
            if (snapshot.hasData && snapshot.data.isNotEmpty)
              Builder(
                builder: (context) => PopupMenuButton<int>(
                  icon: Icon(Icons.more_vert),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 0,
                      child: Text('Очистить данные'),
                    ),
                  ],
                  onSelected: (i) {
                    context.read<Repository>().clearAll();
                    context.showSnack('Данные очищены');
                  },
                ),
              ),
          ],
        ),
        body: Builder(builder: (context) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }
          return _EmployeesList(
            data: snapshot.data,
          );
        }),
        floatingActionButton: _AddEmployeeButton(),
      ),
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
          fullscreenDialog: true,
        ),
      ).then((wasSaved) {
        if (wasSaved == true) {
          context.showSnack('Сотрудник добавлен');
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
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 200),
      switchInCurve: Curves.ease,
      child: data.isEmpty
          ? _EmployeesEmptyList()
          : ListView.separated(
              itemCount: data.length,
              itemBuilder: (context, i) => _Employee(data: data[i]),
              separatorBuilder: (context, i) => Divider(height: 0, indent: 72),
            ),
    );
  }
}

class _EmployeesEmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Список сотрудников пуст\nДля добавления нажмите кнопку +',
            style: Theme.of(context).textTheme.subtitle1.copyWith(
              height: 1.5,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  color: Colors.black.withOpacity(.25),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'или',
                  style: TextStyle(
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.black.withOpacity(.25),
                ),
              ),
            ],
          ),
          _AddDummyButton(),
        ],
      ),
    );
  }
}

class _AddDummyButton extends StatefulWidget {
  @override
  _AddDummyButtonState createState() => _AddDummyButtonState();
}

class _AddDummyButtonState extends State<_AddDummyButton> {
  bool isGenerating = false;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Сгенерировать список'),
      onPressed: isGenerating ? null : () async {
        setState(() {
          isGenerating = true;
        });
        context.read<Repository>().addDummy();
      },
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
      onTap: () => Navigator.of(context).push<void>(
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
