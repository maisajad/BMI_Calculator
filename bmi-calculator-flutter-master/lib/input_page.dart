import'package:bmi_calculator/results_page.dart';
import'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_contant.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'BottomButton.dart';
import 'RoundButton.dart';
import 'calculator_brain.dart';


enum Gender
{
  male,
  female,
}
class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:
      SafeArea(
        child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: Row(
                children: [
                  Expanded(child:ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                    colour: selectedGender==Gender.male?activeCardColor:inactiveCardColor,
                    cardChild: IconContent(text:'MALE',icon: FontAwesomeIcons.mars),
                  ),),
                  Expanded(child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    colour: selectedGender==Gender.female?activeCardColor:inactiveCardColor,
                    cardChild: IconContent(text:'FEMALE',icon: FontAwesomeIcons.venus),
                  ),),
                ],
              ),
              ),
              Expanded(child: ReusableCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                    style: labelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),
                        style: numStyle
                        ),
                        Text('cm',
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E8),
                        activeTrackColor:  Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30),
                        trackHeight:2,
    ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newVal)
                        {
                          setState(() {
                            height=newVal.round();
                          });
                        },
                      ),
                    ),
                    ],
                )
              ),),
              Expanded(child:Row(
                children: [
                  Expanded(child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style:
                          labelTextStyle,
                        ),
                        Text(
                            weight.toString(),
                          style:
                          numStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                              setState(() {
                                weight--;
                              });
                              },
                            ),
                            SizedBox(width: 10,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },),
                          ],
                        ),
                      ],
                    ),
                  ),),
                  Expanded(child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',style: labelTextStyle,),
                        Text(age.toString(),
                          style: numStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                              setState(() {
                                age--;
                              });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),),
                ],
              ),
              ),
              BottomButton(
                buttonTitle: 'CALCULATE',
                onTap:  (){
                  CalculatorBrain calc= CalculatorBrain(
                    weight: weight,
                    height: height,
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context)=>ResultPage(
                            BMIresult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            info: calc.getInfo(),
                          )
                      ),
                  );
                },
              ),
            ],
          ),
      ),
    );
  }
}





