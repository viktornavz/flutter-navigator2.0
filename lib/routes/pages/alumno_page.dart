import 'package:flutter/material.dart';
import 'package:ptj_ultra_web/screens/alumno_screen.dart';

class AlumnoPage extends Page {
  final VoidCallback onLogout;
  AlumnoPage({
    required this.onLogout,
  }) : super(key: ValueKey('AlumnoPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return ALumnoScreen(
          onLogout: onLogout,
        );
      },
    );
  }
}
