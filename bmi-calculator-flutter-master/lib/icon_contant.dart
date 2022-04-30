import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
  IconContent({@required this.text,@required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(
          text,
          style: TextStyle(
              color: Color(0xFF8D8E98),
              fontSize: 18
          ),
        )
      ],
    );
  }
}