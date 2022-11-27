import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  RoundedButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Colors.white,
      child: Icon(
        icon,
        color: Colors.brown,
      ),
      onPressed: onPress,
      constraints: BoxConstraints(
        minWidth: 55,
        minHeight: 55,
      ),
    );
  }
}
