// import 'package:shipment_admin/src/screens/drawer_screens/products/product_detail_page.dart';
import 'package:shipment_admin/src/screens/home_screen.dart';
import 'package:shipment_admin/src/screens/login_screen.dart';
import 'package:shipment_admin/src/screens/order/order_details.dart';
import 'package:shipment_admin/src/screens/profile/profile_screen.dart';
import 'package:shipment_admin/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';

// import 'package:shipment_admin/src/screens/users/user_regist.dart';

class NowbotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // use this lines if bloc provider if required
    // return ChangeNotifierProvider<CartBloc>(
    //   create: (context) => CartBloc(),
    //   child:
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        unselectedWidgetColor: Colors.orange.shade800,
        toggleableActiveColor: Colors.orange.shade800,
      ), //  Tema Claro
      //  theme: ThemeData.dark(), // Tema Obscuro
      home: SplashScreen(),
      initialRoute: '/',
      // this is another form to use routes
      routes: {
        //Home
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        //User
        // '/user_registration': (context) => UserRegistrationForm(),
        // Profile
        '/profile': (context) => Profile(),

        // Order
        '/order_details': (context) => OrderDetails()
      },
    );
    // );
  }
}
