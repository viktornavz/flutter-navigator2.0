import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptj_ultra_web/models/auth_model.dart';

class LogoutFab extends StatelessWidget {
  final VoidCallback onLogout;

  const LogoutFab({Key? key, required this.onLogout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authModel = context.watch<AuthModel>();
    return authModel.logingOut ? _inProgressFab() : _extendedFab(authModel);
  }

  FloatingActionButton _inProgressFab() {
    return FloatingActionButton(
        onPressed: null,
        foregroundColor: Colors.white,
        backgroundColor: Colors.cyan,
        child: CircularProgressIndicator(backgroundColor: Colors.white));
  }

  FloatingActionButton _extendedFab(AuthModel authModel) {
    return FloatingActionButton.extended(
      icon: Icon(Icons.exit_to_app),
      onPressed: () async {
        await authModel.logout();
        onLogout();
      },
      foregroundColor: Colors.white,
      backgroundColor: Colors.cyan,
      label: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Logout'),
      ),
    );
  }
}
