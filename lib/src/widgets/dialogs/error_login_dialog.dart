import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorLoginDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  ErrorLoginDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context, title, description, buttonText, image),
    );
  }
}

dialogContent(context, title, description, buttonText, image) {
  return Stack(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(
          top: Consts.avatarRadius + Consts.padding,
          bottom: Consts.padding,
          left: Consts.padding,
          right: Consts.padding,
        ),
        margin: EdgeInsets.only(top: Consts.avatarRadius),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Consts.padding),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 24.0),
            Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(); // To close the dialog
                },
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        left: Consts.padding,
        right: Consts.padding,
        child: CircleAvatar(
          backgroundColor: Colors.redAccent[100],
          radius: Consts.avatarRadius,
          child: SizedBox(
            height: 100.0,
            width: 100.0, // fixed width and height
            child: SvgPicture.asset('assets/fresh_icons/tomate_modal.svg')
          )),
      ),
    ],
  );
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 60.0;
}
