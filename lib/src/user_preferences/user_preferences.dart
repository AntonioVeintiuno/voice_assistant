import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instancia = new UserPreferences._internal();

  factory UserPreferences() {
    return _instancia;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET de succes de login
  get succesLog {
    return _prefs.getBool('login') ?? false;
  }

  set succesLog(bool value) {
    _prefs.setBool('login', value);
  }

  // GET y SET de la última página
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  set email(String value) {
    _prefs.setString('email', value);
  }

  get email {
    return _prefs.getString('email') ?? '';
  }


  set userId(int value) {
    _prefs.setInt('userId', value);
  }

  get userId {
    return _prefs.getInt('userId') ?? '';
  }

  // GET y SET de la última página
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
