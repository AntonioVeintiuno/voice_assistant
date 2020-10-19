import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  GreenButton({@required this.onPressed,
    this.title,
    this.width,
    this.height
  });
  final GestureTapCallback onPressed;
  final String title;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RaisedButton(
        onPressed: onPressed,
        color: Colors.green,
        child: Text(title,
          style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: "Poppins-Medium" ),
        ),
      ),
    );
  }
}
