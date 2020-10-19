import 'package:flutter/material.dart';
import 'package:shipment_admin/src/user_preferences/user_preferences.dart';
import 'package:shipment_admin/src/widgets/dialogs/logout_dialog.dart';

class HomeDrawer extends StatelessWidget {
  final userPreferences = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Alan Brito Delgado"),
            accountEmail: Text(userPreferences.email),
            decoration: BoxDecoration(color: Colors.blue[400]),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue[700]
                  : Colors.blue[700],
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Align(
                alignment: Alignment(-0.9, 0),
                child: Text("Perfil",
                    style: TextStyle(fontSize: 14, color: Colors.blue[200]))),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            // trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.content_paste),
            title: Align(
                alignment: Alignment(-0.9, 0),
                child: Text("Embarques",
                    style: TextStyle(fontSize: 14, color: Colors.blue[200]))),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            // trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.phonelink_lock),
            title: Align(
                alignment: Alignment(-0.9, 0),
                child: Text("Cambiar contraseña",
                    style: TextStyle(fontSize: 14, color: Colors.blue[200]))),
            onTap: () {
              Navigator.pushNamed(context, '/change_password');
            },
            // trailing: Icon(Icons.arrow_forward),
          ),
          // ListTile(
          //   title: Align(
          //       alignment: Alignment(-0.7, 0),
          //       child: Text("Mis Domicilio de entrega",
          //           style: TextStyle(fontSize: 14, color: Colors.blue))),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/delivery_address');
          //   },
          //   // trailing: Icon(Icons.arrow_forward),
          // ),
          // ListTile(
          //   title: Align(
          //       alignment: Alignment(-0.8, 0),
          //       child: Text("Contacto fresh",
          //           style: TextStyle(fontSize: 14, color: Colors.blue))),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/contact');
          //   },
          //   // trailing: Icon(Icons.arrow_forward),
          // ),
          // ListTile(
          //   title: Align(
          //       alignment: Alignment(-0.6, 0),
          //       child: Text("Nuestro aviso de privacidad",
          //           style: TextStyle(fontSize: 14, color: Colors.blue))),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/privacy_policy');
          //   },
          // ),
          // ListTile(
          //   title: Align(
          //       alignment: Alignment(-0.8, 0),
          //       child: Text("Programar orden",
          //           style: TextStyle(fontSize: 14, color: Colors.blue))),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/sheduler_order');
          //   },
          // ),
          // ListTile(
          //   title: Align(
          //       alignment: Alignment(-0.8, 0),
          //       child: Text("Folio",
          //           style: TextStyle(fontSize: 14, color: Colors.blue))),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/folio');
          //   },
          // ),
          SizedBox(height: MediaQuery.of(context).size.height - 600),
          ListTile(
            title: Align(
                alignment: Alignment(-1, 0),
                child: Text("Salir",
                    style: TextStyle(fontSize: 14, color: Colors.grey))),
            onTap: () async {
              showDialog(
                context: context,
                builder: (_) => LogoutDialog(),
              );
            },
          )
        ],
      ),
    );
  }
}
