import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  late BuildContext context;
  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool loading) {
    _busy = loading;
    notifyListeners();
  }
}
