import 'package:employees/data/repository.dart';
import 'package:employees/pages/employees_page.dart';
import 'package:employees/widgets/hide_keyboard_on_tap.dart';
import 'package:employees/widgets/wrap_page_transitions_builder.dart';
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
      theme: ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: Colors.deepPurple[300],
          primaryVariant: Colors.purple,
          secondary: Colors.deepOrange[100],
          secondaryVariant: Colors.orange[300],
          error: Colors.red[300],
        ),
      ).copyWith(
        primaryColorLight: Colors.lightBlue[100],
        primaryColorDark: Colors.lightBlue[500],
        appBarTheme: AppBarTheme(
          elevation: 1,
        ),
        inputDecorationTheme: InputDecorationTheme(
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonTheme.of(context).copyWith(
          disabledColor: ButtonTheme.of(context).colorScheme.onSurface.withOpacity(.05),
        ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: WrapPageTransitionsBuilder(
              wrapper: HideKeyboardOnTap.wrapper,
              base: ZoomPageTransitionsBuilder(),
            ),
            TargetPlatform.iOS: WrapPageTransitionsBuilder(
              wrapper: HideKeyboardOnTap.wrapper,
              base: CupertinoPageTransitionsBuilder(),
            ),
          },
        ),
      ),
      home: EmployeesPage(),
    );
  }
}
