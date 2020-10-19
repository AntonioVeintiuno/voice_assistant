import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.lightBlueAccent[100]),
        title: Text(
          'Detalles de Embarque',
          style: TextStyle(color: Colors.blue[300]),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                width: 300,
                height: 150,
                decoration: _containerDecoration(),
                child: SizedBox(
                  child: Image.asset('assets/detail_ship.png'),
                )
                // child: Text('detalles de embarque'),
                ),
            SizedBox(height: 20),
            // Container(
            //   alignment: Alignment.center,
            //   width: 300,
            //   height: 200,
            //   decoration: _containerDecoration(),
            //   child: Text('mas detalles'),
            // )
          ],
        ),
      ),
    );
  }
}

_containerDecoration() {
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
            color: Colors.black12, offset: Offset(0.0, 15.0), blurRadius: 15.0),
        BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, -10.0),
            blurRadius: 10.0),
      ]);
}
