import 'package:flutter/material.dart';
import 'package:ptj_ultra_web/screens/splash_screen.dart';

class SplashPage extends Page {
  final String process;
  SplashPage({required this.process})
      : super(key: ValueKey('SplashPage$process'));
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return SplashScreen(process: process);
      },
    );
  }
}
