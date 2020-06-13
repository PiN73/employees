import 'db.dart';

void addDummyData(MyDatabase db) async {
  final cesarId = await db.addEmployee(EmployeesCompanion.insert(
    lastName: 'Меркушев',
    firstName: 'Цезарь',
    middleName: 'Брониславович',
    birthDate: DateTime(1991, 7, 26),
    position: 'Региональный представитель',
  ));

  db.addChild(ChildrenCompanion.insert(
    lastName: 'Меркушев',
    firstName: 'Болеслав',
    middleName: 'Цезаревич',
    birthDate: DateTime(2002, 12, 08),
    parentId: cesarId,
  ));

  db.addChild(ChildrenCompanion.insert(
    lastName: 'Меркушева',
    firstName: 'Устина',
    middleName: 'Цезаревна',
    birthDate: DateTime(2006, 11, 18),
    parentId: cesarId,
  ));

  db.addEmployee(EmployeesCompanion.insert(
    lastName: 'Цветкова',
    firstName: 'Яромириана',
    middleName: 'Юхимовна',
    birthDate: DateTime(1994, 8, 30),
    position: 'Кладовщик-комплектовщик',
  ));

  db.addEmployee(EmployeesCompanion.insert(
    lastName: 'Третьяков',
    firstName: 'Никита',
    middleName: 'Данилович',
    birthDate: DateTime(1996, 7, 14),
    position: 'Вальцовщик',
  ));

  db.addEmployee(EmployeesCompanion.insert(
    lastName: 'Гребневский',
    firstName: 'Остин',
    middleName: 'Романович',
    birthDate: DateTime(1996, 5, 7),
    position: 'Наладчик прессово-штамповой оснастки',
  ));

  db.addEmployee(EmployeesCompanion.insert(
    lastName: 'Кулибаба',
    firstName: 'Жигерьетта',
    middleName: 'Валериевна',
    birthDate: DateTime(1993, 2, 24),
    position: 'Финансовый менеджер',
  ));
}
