
import 'dart:math';
import 'package:flutter/cupertino.dart';

class CalculatorBrain
{
  CalculatorBrain({@required this.height,@required this.weight});
  final int height,weight;
  double _bmi;
  String calculateBMI()
  {
    _bmi=weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult()
  {
    if(_bmi<18.5)
      return 'UNDERWEIGHT';
    else if(_bmi>=18.5&&_bmi<=24.9)
      return 'NORMAL';
    else if(_bmi>=25&&_bmi<=29.9)
      return 'OVERWEIGHT';
    else if(_bmi>=30&&_bmi<=34.9)
      return 'OBESE';
    else
      return 'EXTREMELY OBESE';
  }
  String getInfo()
  {
    if(_bmi<18.5)
      return 'You need to gain some weight :( ';
    else if(_bmi>=18.5&&_bmi<=24.9)
      return 'You are HEALTHY , Good Job !';
    else if(_bmi>=25&&_bmi<=29.9)
      return 'You are good but you will be better if you loose some weight :)';
    else if(_bmi>=30&&_bmi<=34.9)
      return 'You should loose some weight :(';
    else
      return 'you are facing an increased risk of 50 different health problems.\n'
          ' All of these different health conditions include some of the top causes of death in the nation,\n'
          ' such as heart disease, diabetes, stroke, various cancers, gallstones and gout.';
  }
}