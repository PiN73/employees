import 'package:employees/models/child.dart';
import 'package:employees/models/employee.dart';

final List<Employee> dummyData = [
  Employee(
    lastName: 'Меркушев',
    firstName: 'Цезарь',
    middleName: 'Брониславович',
    birthDate: DateTime(1991, 7, 26),
    position: 'Региональный представитель',
    children: [
      Child(
        lastName: 'Меркушев',
        firstName: 'Болеслав',
        middleName: 'Цезаревич',
        birthDate: DateTime(2002, 12, 08),
      ),
      Child(
        lastName: 'Меркушева',
        firstName: 'Устина',
        middleName: 'Цезаревна',
        birthDate: DateTime(2006, 11, 18),
      ),
    ],
  ),
  Employee(
    lastName: 'Цветкова',
    firstName: 'Яромириана',
    middleName: 'Юхимовична',
    birthDate: DateTime(1994, 8, 30),
    position: 'Кладовщик-комплектовщик',
  ),
  Employee(
    lastName: 'Третьяков',
    firstName: 'Никита',
    middleName: 'Данилович',
    birthDate: DateTime(1996, 7, 14),
    position: 'Вальцовщик',
  ),
  Employee(
    lastName: 'Гребневский',
    firstName: 'Остин',
    middleName: 'Романович',
    birthDate: DateTime(1996, 5, 7),
    position: 'Наладчик прессово-штамповой оснастки',
  ),
  Employee(
    lastName: 'Кулибаба',
    firstName: 'Жигерьетта',
    middleName: 'Валериевна',
    birthDate: DateTime(1993, 2, 24),
    position: 'Финансовый менеджер',
  ),
];
