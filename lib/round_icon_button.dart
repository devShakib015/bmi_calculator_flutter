import 'package:flutter/material.dart';
import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  RoundIconButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      fillColor: kRoundIconButtonColor,
      shape: CircleBorder(),
      elevation: 0.0,
      child: Icon(icon),
      constraints: BoxConstraints(
        minHeight: 50,
        minWidth: 50,
      ),
    );
  }
}
