import 'package:flutter/material.dart';
import 'package:ptj_ultra_web/screens/home_screen.dart';

class HomePage extends Page {
  final VoidCallback onLogout;
  HomePage({
    required this.onLogout,
  }) : super(key: ValueKey('HomePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return HomeScreen(
          onLogout: onLogout,
        );
      },
    );
  }
}
