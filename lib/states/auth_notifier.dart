import 'package:flutter/widgets.dart';

class AuthenticationNotifier extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void setUserAuth(bool authState) {
    _isAuthenticated = authState;
    notifyListeners();
  }
}
