import 'package:flutter/material.dart';
import 'package:ptj_ultra_web/screens/admin_screen.dart';

class AdminPage extends Page {
  final VoidCallback onLogout;
  AdminPage({
    required this.onLogout,
  }) : super(key: ValueKey('AdminPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return AdminScreen(
          onLogout: onLogout,
        );
      },
    );
  }
}
