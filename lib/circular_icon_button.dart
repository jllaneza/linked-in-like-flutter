import 'package:flutter/material.dart';
import 'constants.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double radius;
  final BorderSide side;
  final Function onPressed;

  CircularIconButton({
    this.icon,
    this.onPressed,
    this.side = BorderSide.none,
    this.iconColor = kColorBlue,
    this.radius = 45.0,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(
        side: side,
      ),
      constraints: BoxConstraints.tightFor(
        width: radius,
        height: radius,
      ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
