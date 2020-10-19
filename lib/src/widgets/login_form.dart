import 'package:flutter/material.dart';
// import 'package:shipment_admin/src/models/user.dart';
import 'package:shipment_admin/src/providers/user_provider.dart';
import 'package:shipment_admin/src/widgets/buttons/button.dart';
// import 'package:shipment_admin/src/widgets/dialogs/error_login_dialog.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final userProvider = UserProvider();
  // User user = new User();

  // Add validate email function.
  String validateEmail(String value) {
    //Create a validator or use a package
    if (value.isEmpty) {
      return 'El usuario no puede ir vacio';
    }
    return null;
  }

  // Add validate password function.
  String validatePassword(String value) {
    if (value.length < 8) {
      return 'La contraseña debe tener al menos 8 caracteres';
    }
    return null;
  }

  void onSubmited() async {
    // First validate form.
    if (this._loginFormKey.currentState.validate()) {
      _loginFormKey.currentState.save(); // Save our form now.
      // Map res = await userProvider.login(user.email, user.password);
      // if (res['ok']) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
      // } else {
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) => ErrorLoginDialog(
      //       title: "Error",
      //       description: "Email o contraseña invalida",
      //       buttonText: "ok",
      //     ),
      //   );
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 15.0),
                  blurRadius: 15.0),
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, -10.0),
                  blurRadius: 10.0),
            ]),
        child: Padding(
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 20),
            child: Form(
                key: _loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.lightBlueAccent,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(bottom: 7.0, top: 7.0),
                          labelText: "Usuario",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 12.0),
                          labelStyle:
                              new TextStyle(color: const Color(0xFF424242)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.lightBlueAccent)),
                        ),
                        validator: validateEmail,
                        onSaved: (String value) {
                          // this.user.email = value;
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        obscureText: true,
                        cursorColor: Colors.lightBlueAccent,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(bottom: 7.0, top: 7.0),
                          labelText: "Contraseña",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 12.0),
                          labelStyle:
                              new TextStyle(color: const Color(0xFF424242)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.lightBlueAccent)),
                        ),
                        validator: validatePassword,
                        onSaved: (String value) {
                          // this.user.password = value;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Olvidaste tu contraseña?",
                          style: TextStyle(
                              color: Colors.pink,
                              fontFamily: "Poppins-Medium",
                              fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Button(
                        title: 'Entrar',
                        height: 30,
                        width: 350,
                        colorBtn: Colors.deepPurple,
                        colorTxt: Colors.white,
                        onPressed: this.onSubmited)
                  ],
                ))));
  }
}
