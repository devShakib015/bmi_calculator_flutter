import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableGenderCardChild extends StatelessWidget {
  final IconData icon;
  final String gender;

  ReusableGenderCardChild({@required this.icon, @required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: kIconSize,
        ),
        SizedBox(
          height: kSizedBoxHeight,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
