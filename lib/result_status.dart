import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultStatus extends StatelessWidget {
  final String bmiStatus;
  final String bmi;
  final String interpretation;
  final int age;
  final String gender;
  final String bmiSuggestion;

  ResultStatus(
      {@required this.bmi,
      @required this.bmiStatus,
      @required this.interpretation,
      @required this.age,
      @required this.gender,
      @required this.bmiSuggestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              gender == "male"
                  ? FontAwesomeIcons.male
                  : FontAwesomeIcons.female,
              size: 36,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              age.toString(),
              style: kNumberTextStyle,
            )
          ],
        ),
        Text(
          bmiStatus,
          style: TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
              fontSize: 24.0),
        ),
        Column(
          children: [
            Text(
              bmi,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Perfect BMI : 21.5 - 21.9\n$bmiSuggestion",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[200],
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 11.0,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            interpretation,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
