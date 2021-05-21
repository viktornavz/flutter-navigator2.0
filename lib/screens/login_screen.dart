import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptj_ultra_web/models/auth_model.dart';
import 'package:ptj_ultra_web/resources/dimens/app_dimens.dart';
import 'package:ptj_ultra_web/screens/widgets/in_progress_message.dart';

class LogginScreen extends StatelessWidget {
  final VoidCallback onLogin;
  const LogginScreen({required this.onLogin});
  @override
  Widget build(BuildContext context) {
    final authModel = context.watch<AuthModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login screen"),
      ),
      body: Center(
        child: authModel.logingIn
            ? InProgressMessage(
                progressName: 'Login', screenName: "LoginScreen")
            : ElevatedButton(
                onPressed: () async {
                  final authModel = context.read<AuthModel>();
                  final result = await authModel.login();
                  if (result == true) {
                    onLogin();
                  } else {
                    authModel.logingIn = false;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.SIZE_SPACING_MEDIUM),
                  child: Text('Log in'),
                )),
      ),
    );
  }
}
