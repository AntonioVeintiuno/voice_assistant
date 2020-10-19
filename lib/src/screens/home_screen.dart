import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:shipment_admin/src/providers/user_provider.dart';
import 'package:shipment_admin/src/widgets/drawer/HomeDrawer.dart';
// import 'package:shipment_admin/src/providers/category_provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shipment_admin/src/models/order.dart';
import 'package:shipment_admin/src/widgets/animation_wirdgets/points_color_loader.dart';
import 'package:alan_voice/alan_voice.dart';

class HomeScreen extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => HomeScreen(),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List orders;
  List promotions;
  // final userProvider = UserProvider();

  @override
  void initState() {
    AlanVoice.addButton(
        "5185b95f7ad8b2ce2d87e1889337d9142e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);
    selectedIndex = 0;
    super.initState();

    // AlanVoice.callbacks.add((command) => _handleCommand(command.data));
    AlanVoice.addConnectionCallback((state) => _handleConnectionState(state));
    // getUser();
  }

  //Resend visuals in case of disconnect from tutor
  void _handleConnectionState(String state) {
    if (state == "CONNECTED") {
      // _model.setVisuals();
      print('paso acl');
    }
  }

  // getUser() async {
  //   Map user = await userProvider.show();
  //   print('asd');
  //   print(user);
  // }

  // Future<List> getCategories() async {
  //   categories = await categoriesProvider.getCategories();
  //   return categories;
  // }

  selectCatalog(String name, int categorryId) {
    if (name == "order") {
      Navigator.pushNamed(context, '/order_details');
    } else {
      // Navigator.push(context,
      //   MaterialPageRoute(
      //     builder: (context) => ProductMenu(categorryId),
      //   ),
      // );
    }
  }

  Future<List> _getOrders() async {
    orders = getOrders();
    return orders;
  }

  changeTab(index) {
    if (index == 1) {
      print('change page');
      Navigator.pushNamed(context, '/profile');
    } else {}
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Card makeCard(Order order, int index) => Card(
        elevation: 2.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: InkWell(
          onTap: () => selectCatalog('order', order.id),
          child: Image.asset(order.sku),
        )
        // child: ListTile(
        //     leading: Icon(
        //       Icons.query_builder,
        //       color: Colors.grey,
        //       size: 30,
        //     ),
        //     title: Text(order.orderNumber,
        //         style: TextStyle(
        //             color: Colors.blueGrey, fontWeight: FontWeight.bold)),
        //     trailing: Icon(Icons.arrow_forward_ios),
        //     contentPadding: EdgeInsets.all(10),
        //     onTap: () => selectCatalog('order', order.id)),
        );

    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text("", style: TextStyle(color: Colors.grey)),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 120,
                ),
                BounceInLeft(
                    duration: Duration(milliseconds: 2000),
                    child: Text(
                      '¡Bienvenido!,',
                      style: TextStyle(
                          color: Colors.blue[300],
                          fontFamily: "Poppins-Medium",
                          fontSize: 17),
                    ))
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              BounceInRight(
                  duration: Duration(milliseconds: 2000),
                  child: Text('¿Listo para rastrear tu embarque?',
                      style: TextStyle(
                          color: Colors.blue[200],
                          fontFamily: "Poppins-Medium",
                          fontSize: 19)))
            ]),
            SizedBox(
              height: 20,
            ),
            Container(
              // height: 500,
              height: MediaQuery.of(context).size.height - 250,
              child: FutureBuilder(
                future: _getOrders(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                        child: Center(
                            child: PointsColorLoader(
                      dotOneColor: Colors.green,
                      dotTwoColor: Colors.blueAccent,
                      dotThreeColor: Colors.green,
                      dotType: DotType.circle,
                      dotIcon: Icon(Icons.adjust),
                      duration: Duration(seconds: 1),
                    )));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SlideInLeft(
                            child: makeCard(snapshot.data[index], index));
                      },
                    );
                  }
                },
              ),
            ),
            // AlanVoice.addButton(
            //     "8e0b083e795c924d64635bba9c3571f42e956eca572e1d8b807a3e2338fdd0dc",
            //     buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT)
          ],
        ),
      ),
    );
  }
}

List getOrders() {
  return [
    Order(orderNumber: '#45187878', sku: 'assets/img_menu.png'),
    Order(orderNumber: "#45145656", sku: 'assets/img_menu.png'),
    Order(orderNumber: "#45175646", sku: 'assets/img_menu.png'),
  ];
}
