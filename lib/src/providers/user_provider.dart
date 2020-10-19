// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;
// import 'package:shipment_admin/src/user_preferences/user_preferences.dart';

class UserProvider {
  // final _prefs = new UserPreferences();
  // final String _baseUrl = DotEnv().env['BASE_URL'];

  // ignore: missing_return
  Future<Map<String, dynamic>> login(String email, String password) async {
    // final authData = {
    //   "user": {
    //     "email": email,
    //     "password": password,
    //   }
    // };

    // final response = await http.post('$_baseUrl/login',
    // body: json.encode(authData),
    // headers: {HttpHeaders.contentTypeHeader: 'application/json'});

    // if (response.body != 'Invalid Email or password.') {
    //   Map<String, String> headers = response.headers;
    //   print(headers['authorization']);
    //   Map<String, dynamic> decodedResp = json.decode(response.body);

    // if (headers.containsKey('authorization')) {
    //   _prefs.token = headers['authorization'];
    //   _prefs.email = decodedResp['email'];
    //   _prefs.userId = decodedResp['id'];

    //   print('id user');
    //   print(_prefs.userId);
    //   return {'ok': true, 'token': headers['authorization']};
    // } else {
    //   return {'ok': false, 'mensaje': decodedResp['message']};
    // }
    // }
    // return {'ok': false, 'mensaje': 'Invalid Email or password.'};
  }

  // Future<Map<String, dynamic>> registeUser(user) async {
  // final customUser = {"user": user};
  // i can change the http pub package to Dio(check this chit)
  // final response = await http.post('$_baseUrl/signup',
  //     body: json.encode(customUser),
  //     headers: {HttpHeaders.contentTypeHeader: 'application/json'});
  // Map<String, dynamic> decodedResp = json.decode(response.body);

  // if (response.body != null) {
  //   return {'ok': true, 'user': decodedResp['name']};
  // } else {
  //   return {'ok': false, 'mensaje': 'Error'};
  // }
  // }

  // Future<Map<String, dynamic>> show() async {
  // final userId = _prefs.userId;
  // var data = await http.get(_baseUrl + '/users/$userId');
  // print('le date');
  // print(data);
  // var jsonData = json.decode(data.body);
  // print('jsondata');
  // print(jsonData);

  // return jsonData;
  // }
}
