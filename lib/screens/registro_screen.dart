import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:ptj_ultra_web/models/auth_model.dart';
import 'package:ptj_ultra_web/resources/dimens/app_dimens.dart';
import 'package:ptj_ultra_web/screens/widgets/in_progress_message.dart';
import 'package:ptj_ultra_web/screens/widgets/logout_fab.dart';

class RegistroScreen extends StatelessWidget {
  final VoidCallback onLogin;
  const RegistroScreen({
    required this.onLogin,
  });
  @override
  Widget build(BuildContext context) {
    final authModel = context.watch<AuthModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Itcj empleado"),
      ),
      body: Center(
        child: authModel.logingIn
            ? InProgressMessage(
                progressName: 'Registro', screenName: "RegistroScreen")
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
                  child: Text('Registrarte'),
                )),
      ),
    );
  }
}
