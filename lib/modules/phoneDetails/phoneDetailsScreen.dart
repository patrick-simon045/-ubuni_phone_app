import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/text.dart';
import 'package:ubuni_phone_app/globals/colors.dart';
import 'package:ubuni_phone_app/models/phone.dart';

class PhoneDetailsScreen extends StatelessWidget {
  final Phone phone;

  PhoneDetailsScreen({required this.phone});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.white,
                  ),
              child: InteractiveViewer(
                child: Image.network(phone.phoneImageUrl),
              ),
            )),
        Expanded(
          child: Container(
            color: MediaQuery.of(context).platformBrightness ==
                Brightness.light
                ? Colors.white.withOpacity(0.5)
                : darkAppBarColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                  text: "${phone.phoneName}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Icon(Icons.chevron_right),
                TextWidget(
                  text: "${phone.phoneBrandName}",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
