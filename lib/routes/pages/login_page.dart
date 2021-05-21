import 'package:flutter/material.dart';
import 'package:ptj_ultra_web/screens/login_screen.dart';

class LoginPage extends Page {
  final VoidCallback onLogin;
  LoginPage({required this.onLogin}) : super(key: ValueKey('LoginPage'));
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return LogginScreen(onLogin: onLogin);
        });
  }
}
