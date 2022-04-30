import 'package:flutter/material.dart';
import 'constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonTitle,@required this.onTap});

  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom:20),
        alignment: Alignment.center,
        child: Text(buttonTitle,style: largeButtonStyle,),
        color: Color(0xFFFB1555),
        height: buttonContainerHeight,
        margin: EdgeInsets.only(top:10.0),
        width: double.infinity,
      ),
    );
  }
}
