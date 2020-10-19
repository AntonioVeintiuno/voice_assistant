import 'dart:async';
import 'package:shipment_admin/src/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shipment_admin/src/user_preferences/user_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;
  final userPreferences = UserPreferences();
  bool logueado;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), _onShowLogin);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onShowLogin() {
    if (mounted) {
      Navigator.of(context).pushReplacement(LoginScreen.route());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ),
          Flexible(
            flex: 2,
            child: SafeArea(
              child: FractionallySizedBox(
                widthFactor: 0.7,
                // child: Image.asset('assets//login/logo_fresh.png'),
              ),
            ),
          ),
          Text(
            'Bienvenido',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.grey),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Image.asset("assets/splashimng.png"),
            ),
          ),
          Flexible(
            flex: 2,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 64.0, horizontal: 16.0),
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
