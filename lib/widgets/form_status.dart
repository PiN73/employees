import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FormStatusData with ChangeNotifier {
  bool _wasChanged = false;
  bool _wasValidated = false;

  bool get wasChanged => _wasChanged;
  bool get wasValidated => _wasValidated;

  void onChange() {
    _wasChanged = true;
    notifyListeners();
  }

  void onValidate() {
    _wasValidated = true;
    notifyListeners();
  }
}

class FormStatus extends StatelessWidget {
  final WidgetBuilder builder;

  const FormStatus({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormStatusData(),
      builder: (context, child) => builder(context),
    );
  }
}
