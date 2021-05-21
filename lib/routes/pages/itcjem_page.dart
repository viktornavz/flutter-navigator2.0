import 'package:flutter/material.dart';
import 'package:ptj_ultra_web/screens/itcjem_screen.dart';

class ItcjemPage extends Page {
  final VoidCallback onLogout;
  ItcjemPage({
    required this.onLogout,
  }) : super(key: ValueKey('ItcjemPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return ItcjEmScreen(
          onLogout: onLogout,
        );
      },
    );
  }
}
