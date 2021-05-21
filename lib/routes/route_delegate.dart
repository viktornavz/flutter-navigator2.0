import 'package:flutter/material.dart';
import 'package:ptj_ultra_web/routes/pages/home_page.dart';
import 'package:ptj_ultra_web/routes/pages/login_page.dart';
import 'package:ptj_ultra_web/routes/pages/splash_page.dart';
import 'package:ptj_ultra_web/routes/pages/unknown_page.dart';
import 'package:ptj_ultra_web/routes/route_config.dart';
import 'package:ptj_ultra_web/services/auth.dart';

class RouteDelegate extends RouterDelegate<RouteConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey;
  final Auth auth;
  bool? _show404;
  bool? get show404 => _show404;
  set show404(bool? value) {
    _show404 = value;
    if (value == true) {
      print('nelson semedo carnal');
    }
    notifyListeners();
  }

  bool? _loggedIn;
  bool? get loggedIn => _loggedIn;
  set loggedIn(value) {
    if (_loggedIn == true && value == false) {
      // It is a logout!
      _clear();
    }
    _loggedIn = value;
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  RouteDelegate(this.auth) : _navigatorKey = GlobalKey<NavigatorState>() {
    _init();
  }

  _init() async {
    loggedIn = await auth.isUserLoggedIn();
    if (loggedIn == true) {
      print('si hay carnal pero quien sabe que pedo con esto jajajaj');
    }
  }

  @override
  RouteConfiguration? get currentConfiguration {
    if (loggedIn == false) {
      return RouteConfiguration.login();
    } else if (loggedIn == null) {
      return RouteConfiguration.splash();
    } else if (_show404 == true) {
      return RouteConfiguration.unknown();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Page> stack;
    if (_show404 == true) {
      stack = _unknownStack;
    } else if (loggedIn == null) {
      stack = _splashStack;
    } else if (loggedIn!) {
      stack = _loggedInStack;
    } else {
      stack = _loggedOutStack;
    }
    return Navigator(
      key: navigatorKey,
      pages: stack,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  List<Page> get _splashStack {
    String process = '';
    if (loggedIn == null) {
      process = 'Checking login state...';
    }
    return [
      SplashPage(process: process),
    ];
  }

  List<Page> get _unknownStack => [UnknownPage()];

  List<Page> get _loggedOutStack => [
        LoginPage(onLogin: () async {
          loggedIn = true;
        })
      ];

  List<Page> get _loggedInStack {
    final onLogout = () async {
      loggedIn = false;
    };
    return [
      HomePage(
        onLogout: onLogout,
      ),
    ];
  }

  @override
  Future<void> setNewRoutePath(RouteConfiguration configuration) async {
    if (configuration.desconocido) {
      _show404 = true;
    } else if (configuration.isHomePage ||
        configuration.isLoginPage ||
        configuration.isSplashPage) {
      _show404 = false;
    } else if (configuration.isRegistro ||
        configuration.isAlumnoPage ||
        configuration.isItcjPage) {
      _show404 = false;
    } else if (configuration.isAdminPage) {
      _show404 = false;
    } else {
      print(' Could not set new route');
    }
  }

  //debes ser null para funcionar pero quien sabe que pedo

  _clear() {
    _show404 = null;
  }
}
