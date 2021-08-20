import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/text.dart';
import 'package:ubuni_phone_app/globals/fontSizes.dart';
import 'package:ubuni_phone_app/globals/padding.dart';
import 'package:ubuni_phone_app/globals/textStyles.dart';

class WelcomeText extends StatefulWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  _WelcomeTextState createState() => _WelcomeTextState();
}

class _WelcomeTextState extends State<WelcomeText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: largePadding),
        TextWidget(text: "$boldMessage", style: welcomeBoldTextStyle),
        SizedBox(height: tinyPadding / 5),
        TextWidget(text: "$normalMessage1", style: welcomeNormalTextStyle),
        SizedBox(height: tinyPadding / 5),
        TextWidget(text: "$normalMessage2", style: welcomeNormalTextStyle),
        SizedBox(height: largePadding),
      ],
    );
  }
}

final String boldMessage = "Ubuni Phone Deals";
final String normalMessage1 = "Get the best phone deals";
final String normalMessage2 = "We offer only the best deals you can find";