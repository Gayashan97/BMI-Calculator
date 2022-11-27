import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  ReusableContainer({@required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        child: cardChild,
        margin: EdgeInsets.all(10),
        color: colour,
      ),
    );
  }
}
