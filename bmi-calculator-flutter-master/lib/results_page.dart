import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';
import 'BottomButton.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.BMIresult,@required this.resultText, @required this.info});
  final String BMIresult,resultText,info;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child:
                Container(
                  padding: EdgeInsets.all(15),
                    alignment: Alignment.bottomLeft,
                    child: Text(BMIresult,
                      style: resultTitleStyle,)),
            ),
            Expanded(
              flex: 5,
                child: ReusableCard(colour:activeCardColor,cardChild:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(resultText,
                        style: resultTitleStyle2,
                      ),
                      Text('158',
                        style: BMItextStyle,
                      ),
                      Text(info,
                        style: bodyTextStyle,
                      textAlign: TextAlign.center,
                      ),
                    ],
                  )
              ,),
            ),
            BottomButton(buttonTitle: 'RE-CALCULATE',
              onTap: (){
              Navigator.pop(context);
              },
            )
          ],
        )
    );
  }
}
