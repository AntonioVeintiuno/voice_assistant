import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shipment_admin/src/user_preferences/user_preferences.dart';
import 'src/app/app.dart';
import 'package:alan_voice/alan_voice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // first lines clean all shared preferences
  // final pref = await SharedPreferences.getInstance();
  // await pref.clear();
  final pref = UserPreferences();
  await pref.initPrefs();
  await DotEnv().load('.env');
  runApp(NowbotApp());
}
