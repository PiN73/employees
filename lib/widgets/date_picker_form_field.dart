import 'package:flutter/material.dart';
import 'package:employees/utils.dart';

class DatePickerFormField extends StatelessWidget {
  final InputDecoration decoration;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final FormFieldValidator<DateTime> validator;
  final ValueChanged<DateTime> onSaved;

  const DatePickerFormField({
    this.decoration = const InputDecoration(),
    @required this.initialDate,
    @required this.firstDate,
    @required this.lastDate,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      builder: (state) => GestureDetector(
        child: InputDecorator(
          isEmpty: state.value == null,
          child: Text(state.value?.format() ?? ''),
          decoration: decoration.copyWith(
            errorText: state.errorText,
          ),
        ),
        onTap: () => showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
        ).then((value) {
          if (value != null) {
            state.didChange(value);
          }
        }),
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
