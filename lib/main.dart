import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptj_ultra_web/cache/preference.dart';
import 'package:ptj_ultra_web/models/auth_model.dart';
import 'package:ptj_ultra_web/routes/route_delegate.dart';
import 'package:ptj_ultra_web/routes/route_info_parser.dart';
import 'package:ptj_ultra_web/services/auth.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

void main() {
  configureApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late RouteDelegate delegate;
  late RouteInforParser parser;
  late Auth auth;

  @override
  initState() {
    super.initState();
    auth = Auth(Preference());
    delegate = RouteDelegate(auth);
    parser = RouteInforParser();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthModel>(
          create: (_) => AuthModel(auth),
        ),
      ],
      child: MaterialApp.router(
          routeInformationParser: parser, routerDelegate: delegate),
    );
  }
}
