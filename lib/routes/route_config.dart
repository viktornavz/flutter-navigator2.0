class RouteConfiguration {
  final bool desconocido;
  final bool iniciado;

  RouteConfiguration.splash()
      : desconocido = false,
        iniciado = null ?? false;

  RouteConfiguration.login()
      : desconocido = false,
        iniciado = null ?? false;

  RouteConfiguration.home()
      : desconocido = false,
        iniciado = null ?? false;

  RouteConfiguration.registro()
      : desconocido = false,
        iniciado = null ?? false;

  RouteConfiguration.alumno()
      : desconocido = false,
        iniciado = true;

  RouteConfiguration.itcjem()
      : desconocido = false,
        iniciado = true;

  RouteConfiguration.admin()
      : desconocido = false,
        iniciado = true;

  RouteConfiguration.unknown()
      : desconocido = true,
        iniciado = true;

  bool get isUnknown => desconocido == true;
  bool get isHomePage => desconocido == false && iniciado == false;
  bool get isRegistro => desconocido == false && iniciado == false;
  bool get isAlumnoPage => desconocido == false && iniciado == true;
  bool get isItcjPage => desconocido == false && iniciado == true;
  bool get isAdminPage => desconocido == false && iniciado == true;
  bool get isLoginPage => desconocido == false && iniciado == false;
  bool get isSplashPage => desconocido == false && iniciado == null;
}
