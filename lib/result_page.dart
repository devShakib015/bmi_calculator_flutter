import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'large_button.dart';
import 'result_status.dart';
import 'bmi_reference_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiStatus;
  final String bmi;
  final String interpretation;
  final int age;
  final String gender;
  final String bmiSuggestion;

  ResultPage(
      {@required this.bmi,
      @required this.bmiStatus,
      @required this.interpretation,
      @required this.age,
      @required this.gender,
      @required this.bmiSuggestion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI Result'),
        actions: [
          IconButton(
            tooltip: "BMI References",
            icon: Icon(Icons.help_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BmiReferenePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ReusableCard(
              cardChild: ResultStatus(
                bmi: bmi,
                bmiStatus: bmiStatus,
                interpretation: interpretation,
                age: age,
                gender: gender,
                bmiSuggestion: bmiSuggestion,
              ),
              color: kActiveCardColor,
            ),
          ),
          LargeButton(
            buttonText: "RE-CALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
