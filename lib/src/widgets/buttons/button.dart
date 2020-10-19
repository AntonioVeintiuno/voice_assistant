import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button(
      {@required this.onPressed,
      this.title,
      this.width,
      this.height,
      this.colorBtn,
      this.colorTxt});
  final GestureTapCallback onPressed;
  final String title;
  final double width;
  final double height;
  final Color colorBtn;
  final Color colorTxt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RaisedButton(
        onPressed: onPressed,
        color: colorBtn,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 14, color: colorTxt, fontFamily: "Poppins-Medium"),
        ),
      ),
    );
  }
}
