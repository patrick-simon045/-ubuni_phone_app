import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/text.dart';
import 'package:ubuni_phone_app/globals/padding.dart';
import 'package:ubuni_phone_app/globals/textStyles.dart';
import 'package:ubuni_phone_app/models/phone.dart';

import 'productGrid.dart';
import 'welcomeText.dart';

class HomeContents extends StatelessWidget {
  final List<Phone> phones;

  HomeContents({required this.phones});

  @override
  Widget build(BuildContext context) {

    print("phones.length: ${phones.length}");
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      children: [
        WelcomeText(),
        TopDeals(text: "Top Deals"),
        ProductGrid(phones: phones),
        SizedBox(height: 10.0),
      ],
    );
  }
}

class TopDeals extends StatelessWidget {
  final String text;

  TopDeals({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: smallPadding),
      child: Container(
        alignment: Alignment.center,
        child: TextWidget(text: "$text", style: TextStyle(
          fontSize: 15.0, color: Colors.grey
        )),
      ),
    );
  }
}


