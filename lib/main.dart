import 'package:bmi_caclulator/screens/result_screen.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'screens/input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          sliderTheme: SliderTheme.of(context).copyWith(
              thumbColor: kAccentColor,
              activeTrackColor: Colors.white,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayColor: kAccentColorTransparent,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: TextTheme(body1: TextStyle(color: Colors.white))),
      routes: {
        RoutsKeys.Home: (context) => HomePage(),
        RoutsKeys.Result: (context) => ScreenResult()
      },
      initialRoute: RoutsKeys.Home,
    );
  }
}

class RoutsKeys {
  static String Home = '/';
  static String Result = '/result';
}
