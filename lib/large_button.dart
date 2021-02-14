import 'package:flutter/material.dart';
import 'constants.dart';

class LargeButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;

  LargeButton({this.onTap, @required this.buttonText});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: kLargeButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: kBottomContainerColor,
            borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
