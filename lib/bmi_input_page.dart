import 'package:bmi_calculator/convert_inch_cm.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'reusable_gender_card_child.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'round_icon_button.dart';
import 'result_page.dart';
import 'large_button.dart';
import 'calculator.dart';
import 'constants.dart';

enum GenderType { male, female }

class BmiInputPage extends StatefulWidget {
  @override
  _BmiInputPageState createState() => _BmiInputPageState();
}

class _BmiInputPageState extends State<BmiInputPage> {
  int height = kDefaultHeight;
  int weight = kDefaultWeight;
  int age = kDefaultAge;

  GenderType selectedGender = GenderType.male;

  void updateSelectedGender(GenderType gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        leading: Icon(Icons.fitness_center_outlined),
        actions: [
          IconButton(
            icon: Icon(Icons.calculate_outlined),
            tooltip: "Convert inch To cm",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConvertInchCm()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              showAboutDialog(
                applicationLegalese: "Copyright © 2021 | venomShakib",
                context: context,
                applicationVersion: "1.1.2",
                applicationName: "BMI Calculator",
                applicationIcon: Image.asset(
                  "images/icon.png",
                  width: 44,
                ),
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Developed By Shakib",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPressed: () => updateSelectedGender(GenderType.male),
                    cardChild: ReusableGenderCardChild(
                      gender: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),
                    color: selectedGender == GenderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () => updateSelectedGender(GenderType.female),
                    cardChild: ReusableGenderCardChild(
                      gender: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                    color: selectedGender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 24)),
                    child: Slider(
                      value: height.toDouble(),
                      max: kSliderMaxValue,
                      min: kSliderMinValue,
                      activeColor: kSliderActiveColor,
                      inactiveColor: kSliderInactiveColor,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT [KG]",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          LargeButton(
            buttonText: "CALCULATE",
            onTap: () {
              String resultedGender =
                  selectedGender == GenderType.male ? "male" : "female";

              Calculator bmiCalculator =
                  Calculator(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: bmiCalculator.calculateBMI(),
                    bmiStatus: bmiCalculator.bmiStatus(),
                    interpretation: bmiCalculator.bmiInterpretation(),
                    age: age,
                    gender: resultedGender,
                    bmiSuggestion: bmiCalculator.bmiSuggestion(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
