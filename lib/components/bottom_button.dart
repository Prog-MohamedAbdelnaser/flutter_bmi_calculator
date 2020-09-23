import 'package:bmi_caclulator/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const BottomButton({this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffEB1A55),
        width: double.infinity,
        height: 50,
        child: FlatButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: kLargButtonTextStyle,
          ),
        ));
  }
}
