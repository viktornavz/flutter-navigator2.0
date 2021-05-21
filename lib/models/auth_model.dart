import 'package:flutter/foundation.dart';
import 'package:ptj_ultra_web/services/auth.dart';

class AuthModel extends ChangeNotifier {
  final Auth auth;
  bool logingIn = false;
  bool logingOut = false;
  AuthModel(this.auth);
  Future<bool> login() async {
    logingIn = true;
    notifyListeners();
    final result = await auth.login();
    logingIn = false;
    notifyListeners();
    return result;
  }

  Future<bool> logout() async {
    logingOut = true;
    notifyListeners();
    final logoutResult = await auth.logout();
    logingOut = false;
    notifyListeners();
    return logoutResult;
  }
}
