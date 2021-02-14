import 'dart:math';

import 'package:flutter/cupertino.dart';

class Calculator {
  final int height;
  final int weight;

  double _bmi;

  Calculator({@required this.height, @required this.weight});

  String calculateBMI() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String bmiStatus() {
    if (_bmi < 18.5) {
      return "Underweight";
    } else if (_bmi < 24.9) {
      return "Normal weight";
    } else if (_bmi < 29.9) {
      return "Pre-obesity";
    } else if (_bmi < 34.9) {
      return "Obesity class I";
    } else if (_bmi < 39.9) {
      return "Obesity class II";
    } else {
      return "Obesity class III";
    }
  }

  String bmiInterpretation() {
    if (_bmi < 18.5) {
      return "Hey!!! Eat a little bit and do some physical exercises. You can reach the level!";
    } else if (_bmi < 24.9) {
      return "Great!!! You are already normal in shape. Try your best to be prefect in it.";
    } else if (_bmi < 29.9) {
      return "You are not doing great. From now on don't make it more than this. Try your best to make it normal.";
    } else if (_bmi < 34.9) {
      return "You are getting out of this. Please do some exercises regularly. Otherwise You will regret a lot.";
    } else if (_bmi < 39.9) {
      return "You have gone too far. Don't lose hope though. Do exerices regularly. And get a good diet.";
    } else {
      return "I have nothing to say about you. You are just out of the limit. But Still you can come back to normal. Just try your best and keep your hope. You can do it!!!";
    }
  }

  String weightSuggestion() {
    return (21.70 * (pow(height / 100, 2))).toStringAsPrecision(2);
  }

  String bmiSuggestion() {
    if (_bmi < 21.5) {
      return "You need to gain ${double.parse(this.weightSuggestion()) - weight.toDouble()} kg more\nto become perfect in shape.";
    } else if (_bmi > 21.9) {
      return "You need to lose ${weight.toDouble() - double.parse(this.weightSuggestion())} kg more\nto become perfect in shape.";
    } else {
      return "Superb!!! You are in the most perfect shape. Keep it up.";
    }
  }
}
