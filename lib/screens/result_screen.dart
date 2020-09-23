import 'package:bmi_caclulator/colors.dart';
import 'package:bmi_caclulator/components/resuable_card.dart';
import 'package:bmi_caclulator/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';
import '../main.dart';

class ScreenResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ResultArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsetsDirectional.only(start: 15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kNumberStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                color: Color(0xff1D1F33),
                cardChild: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          args.resultText,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          args.bmiResult,
                          style: TextStyle(
                              fontSize: 100,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'Normal BMI Rang :',
                          style: kLabelStyle,
                        ),
                        Text(
                          '18,5 - 25 kg/m2 ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          args.interpretation,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                            color: Color(0xff181A2E),
                            margin: EdgeInsets.only(top: 10),
                            height: 50,
                            child: FlatButton(
                              child: Text(
                                'SAVE RESULT',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16),
                              ),
                            ))
                      ],
                    ),
                  ),
                )),
          ),
          BottomButton(
            title: 'RE-CALCULATE',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

class ResultArgs {
  final String resultText;
  final String bmiResult;
  final String interpretation;

  ResultArgs({this.resultText, this.bmiResult, this.interpretation});
}
