import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/home/phoneContainer.dart';
import 'package:ubuni_phone_app/components/text.dart';
import 'package:ubuni_phone_app/globals/textStyles.dart';
import 'package:ubuni_phone_app/models/phone.dart';

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
        Container(
          alignment: Alignment.center,
          child: TextWidget(text: "$topDeals", style: navigationTitleText),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return ClipRRect(
              child: PhoneContainer(phone: phones[index]),
              borderRadius: BorderRadius.circular(10.0),
            );
          },
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}

final String topDeals = "Top deals";
