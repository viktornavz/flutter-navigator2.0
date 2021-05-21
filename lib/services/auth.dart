import 'package:ptj_ultra_web/cache/preference.dart';

const String _AUTH_KEY = 'AuthKey';

class Auth {
  final Preference preference;
  Auth(this.preference);

  /**
   * Otra cosa que no pudea funcionar por la causa de null safety
   * entonces en return preference.getbool(_AUTH_KEY,defaultValue:false) ?? false
   * la parte de ultimo se removio pero a ver que pedo carnal
   */

  Future<bool> isUserLoggedIn() async =>
      Future.delayed(Duration(seconds: 2)).then((value) {
        return preference.getBool(_AUTH_KEY, defaultValue: false);
      });

  Future<bool> _updateLoginStatus(bool loggedIn) =>
      Future.delayed(Duration(seconds: 2)).then((value) {
        return preference.putBool(_AUTH_KEY, loggedIn);
      });

  Future<bool> logout() => _updateLoginStatus(false);

  Future<bool> login() => _updateLoginStatus(true);
}
