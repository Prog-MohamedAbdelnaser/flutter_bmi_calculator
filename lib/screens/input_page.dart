import 'package:bmi_caclulator/colors.dart';
import 'package:bmi_caclulator/main.dart';
import 'package:bmi_caclulator/components/resuable_card.dart';
import 'package:bmi_caclulator/screens/result_screen.dart';
import 'package:bmi_caclulator/components/round_icon_button.dart';
import 'package:bmi_caclulator/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../CalculatorBrain.dart';
import '../components/bottom_button.dart';
import '../components/icon_content.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Gender gender;
  int height = 180;
  int weight = 50;
  int age = 10;
//1 = male 2 = female
  void updateGender(Gender gender) {
    this.gender = gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculatoor '),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        onClick: () {
                          setState(() {
                            updateGender(Gender.Male);
                          });
                        },
                        color: gender == Gender.Male
                            ? kInActiveCardColor
                            : kActiveCardColor,
                        cardChild: IconContent(
                          mIcon: FontAwesomeIcons.mars,
                          text: 'MALE',
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onClick: () {
                        setState(() {
                          updateGender(Gender.Female);
                        });
                      },
                      color: gender == Gender.Female
                          ? kInActiveCardColor
                          : kActiveCardColor,
                      cardChild: IconContent(
                        mIcon: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                    ),
                  )
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
                      'HEIGHT',
                      style: kLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelStyle,
                        )
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: kInActiveCardColor,
                      onChanged: (double newValue) {
                        //  height = newValue;
                        setState(() {
                          height = newValue.toInt();
                        });
                        print("object$newValue");
                      },
                    )
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
                            'WEIGHT',
                            style: kLabelStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight = weight + 1;
                                    });
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight = weight - 1;
                                    });
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  )),
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
                            'AGE',
                            style: kLabelStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age = age + 1;
                                    });
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age = age - 1;
                                    });
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              title: 'CALCULATE',
              onPressed: () {
                CalculateBrain calc =
                    CalculateBrain(weight = weight, height = height);
                calc.calculateResult();
                ResultArgs args = ResultArgs(
                    resultText: calc.getResult(),
                    bmiResult: calc.getBMI(),
                    interpretation: calc.getInterpretation());
                Navigator.pushNamed(context, RoutsKeys.Result, arguments: args);
              },
            )
          ],
        ));
  }
}

enum Gender { Male, Female }
