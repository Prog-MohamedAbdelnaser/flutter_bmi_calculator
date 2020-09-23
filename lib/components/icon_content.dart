import 'package:bmi_caclulator/style.dart';
import 'package:flutter/cupertino.dart';

import '../colors.dart';

class IconContent extends StatelessWidget {
  final IconData mIcon;
  final String text;

  IconContent({@required this.mIcon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          mIcon,
          color: kCardFontColor,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: kLabelStyle,
        )
      ],
    );
  }
}
