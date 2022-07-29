import 'package:flutter/widgets.dart';

class AuthenticationNotifier extends ChangeNotifier {
  //TODO: true를 false로 변경할것.
  bool _isAuthenticated = true;

  bool get isAuthenticated => _isAuthenticated;

  void setUserAuth(bool authState) {
    _isAuthenticated = authState;
    notifyListeners();
  }
}
