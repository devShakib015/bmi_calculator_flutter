import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/large_button.dart';
import 'package:flutter/material.dart';

class ConvertInchCm extends StatefulWidget {
  @override
  _ConvertInchCmState createState() => _ConvertInchCmState();
}

class _ConvertInchCmState extends State<ConvertInchCm> {
  String heightInCm = "0";
  double heightInInch = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inch To Cm"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$heightInCm",
                style: kNumberTextStyle,
              ),
              Text(
                "cm",
                style: kLabelTextStyle,
              )
            ],
          ),
          Column(
            children: [
              Text(
                "1 Foot = 12 Inches.\nSo if your height is 5'7\", \nthen 5'7\" = 5 * 12 + 7 = 60 + 7 = 67 Inches.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Height In Inch",
                  ),
                  onChanged: (vaule) {
                    heightInInch = double.tryParse(vaule) ?? 0.0;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LargeButton(
                buttonText: "Convert",
                onTap: () {
                  setState(() {
                    if (heightInInch == 0.0) {
                      heightInCm = "0";
                    } else
                      heightInCm = ((heightInInch * 2.54).round()).toString();
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
