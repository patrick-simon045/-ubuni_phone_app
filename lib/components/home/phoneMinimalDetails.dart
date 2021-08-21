import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/globals/colors.dart';
import 'package:ubuni_phone_app/models/phone.dart';

import '../text.dart';

class PhoneMinimalDetails extends StatelessWidget {
  const PhoneMinimalDetails({
    Key? key,
    required this.phone,
  }) : super(key: key);

  final Phone phone;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: MediaQuery.of(context).platformBrightness == Brightness.light
            ? lightPhoneContainer
            : darkPhoneContainer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              child: TextWidget(
                text: phone.phoneName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: TextWidget(
                text: phone.phoneBrandName,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
