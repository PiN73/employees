import 'package:employees/models/user.dart';
import 'package:employees/strings.dart';
import 'package:employees/utils.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final User data;

  const UserInfo({@required this.data});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          _DataTile(
            label: 'Фамилия: ',
            value: data.lastName,
          ),
          _DataTile(
            label: 'Имя: ',
            value: data.firstName,
          ),
          _DataTile(
            label: 'Отчество: ',
            value: data.middleName,
          ),
          _DataTile(
            label: 'Дата рождения: ',
            value: '${data.birthDate.format()} (${Strings.agesCount(data.birthDate.getAge())})',
          ),
        ],
      ),
    );
  }
}

class _DataTile extends StatelessWidget {
  final String label;
  final String value;

  const _DataTile({
    @required this.label,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 2,
      ),
      child: Text.rich(
        TextSpan(
          style: Theme.of(context).textTheme.subtitle1,
          children: [
            TextSpan(
              text: label,
              style: TextStyle(
                color: Theme.of(context).textTheme.caption.color,
              ),
            ),
            TextSpan(
              text: value,
            ),
          ],
        ),
      ),
    );
  }
}
