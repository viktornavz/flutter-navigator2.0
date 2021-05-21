import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:ptj_ultra_web/models/auth_model.dart';
import 'package:ptj_ultra_web/screens/widgets/in_progress_message.dart';
import 'package:ptj_ultra_web/screens/widgets/logout_fab.dart';

class AdminScreen extends StatelessWidget {
  final VoidCallback onLogout;

  const AdminScreen({
    Key? key,
    required this.onLogout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
      ),
      body: _body(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: LogoutFab(onLogout: onLogout),
    );
  }
}

Widget _body(BuildContext context) {
  final authModel = context.watch<AuthModel>();
  bool inProgress;
  String progressName;
  if (authModel.logingOut) {
    inProgress = true;
    progressName = "Logout";
  } else {
    inProgress = false;
    progressName = '';
  }
  return inProgress
      ? InProgressMessage(progressName: progressName, screenName: "AdminScreen")
      : Text("Hola mijos como andas");
}
