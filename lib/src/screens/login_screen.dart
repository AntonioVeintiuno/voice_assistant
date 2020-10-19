import 'package:shipment_admin/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shipment_admin/src/user_preferences/user_preferences.dart';
import 'package:shipment_admin/src/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => LoginScreen(),
    );
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userPreferences = UserPreferences();

  String mensaje = '';
  bool _logueado = false;

  loginButton() {
    setState(() {
      _logueado = true;
    });
  }

  initState() {
    super.initState();
    checkIsLogin();
  }

  Future<Null> checkIsLogin() async {
    String _token = "";
    _token = userPreferences.token;
    if (_token != "" && _token != null) {
      print("alreay login.");
      _logueado = true;
    } else {
      _logueado = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _logueado ? HomeScreen() : loginForm(),
    );
  }

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: 90,
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  // @override
  Widget loginForm() {
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset("assets/image_01.png"),
              ),
              Expanded(
                child: Container(),
              ),
              // Expanded(child: Image.asset("assets/image_02.png"))
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 28.0,
                  right: 28.0,
                  top: MediaQuery.of(context).size.height / 10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 180,
                        // child: Image.asset(
                        //   "assets/logo.png",
                        // )
                      )
                    ],
                  ),
                  SizedBox(height: 230),
                  LoginForm(),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Nuevo usuario?",
                        style: TextStyle(fontFamily: "Poppins-Medium"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/user_registration');
                        },
                        child: Text("  Regístrarse",
                            style: TextStyle(
                                color: Colors.pink,
                                fontFamily: "Poppins-Bold")),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
