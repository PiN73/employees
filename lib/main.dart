import 'package:employees/data/repository.dart';
import 'package:employees/pages/employees_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() async {
  // support only russian
  Intl.defaultLocale = 'ru-RU';
  await initializeDateFormatting('ru-RU');
  runApp(
    Provider(
      create: (context) => Repository(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employees',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonTheme.of(context).copyWith(
          disabledColor: ButtonTheme.of(context).colorScheme.onSurface.withOpacity(.05),
        ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: EmployeesPage(),
    );
  }
}
