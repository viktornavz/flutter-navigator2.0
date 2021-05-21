import 'package:flutter/material.dart';

import 'package:ptj_ultra_web/screens/registro_screen.dart';

class RegistroPage extends Page {
  final VoidCallback onLogin;
  RegistroPage({
    required this.onLogin,
  }) : super(key: ValueKey('RegistroPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return RegistroScreen(
          onLogin: this.onLogin,
        );
      },
    );
  }
}
