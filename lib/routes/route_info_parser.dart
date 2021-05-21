import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ptj_ultra_web/routes/route_config.dart';

class RouteInforParser extends RouteInformationParser<RouteConfiguration> {
  @override
  Future<RouteConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.tryParse(routeInformation.location!);

    if (uri!.pathSegments.length == 0) {
      return RouteConfiguration.home();
    } else if (uri.pathSegments.length == 1) {
      final first = uri.pathSegments[0].toLowerCase();
      if (first == 'home') {
        return RouteConfiguration.home();
      } else if (first == 'login') {
        return RouteConfiguration.login();
      } else if (first == 'registro') {
        return RouteConfiguration.registro();
      } else if (first == 'registros') {
        return RouteConfiguration.registro();
      } else if (first == 'alumno') {
        return RouteConfiguration.alumno();
      } else if (first == 'ictj_account') {
        return RouteConfiguration.itcjem();
      } else if (first == 'nxxddsola') {
        return RouteConfiguration.admin();
      } else {
        return RouteConfiguration.unknown();
      }
    } else {
      return RouteConfiguration.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(RouteConfiguration configuration) {
    if (configuration.isUnknown) {
      return RouteInformation(location: '/unknown');
    } else if (configuration.isSplashPage) {
      return null;
    } else if (configuration.isLoginPage) {
      return RouteInformation(location: '/login');
    } else if (configuration.isHomePage) {
      return RouteInformation(location: '/');
    } else if (configuration.isRegistro) {
      return RouteInformation(location: '/registro');
    } else if (configuration.isAlumnoPage) {
      return RouteInformation(location: '/alumno');
    } else if (configuration.isItcjPage) {
      return RouteInformation(location: '/ictj_account');
    } else if (configuration.isAdminPage) {
      return RouteInformation(location: '/nxxddsola');
    } else {
      return null;
    }
  }
}
