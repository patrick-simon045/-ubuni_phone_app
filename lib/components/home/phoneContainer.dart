import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/text.dart';
import 'package:ubuni_phone_app/globals/colors.dart';
import 'package:ubuni_phone_app/models/phone.dart';

import 'phoneMinimalDetails.dart';
import 'phoneWidget.dart';

class PhoneContainer extends StatelessWidget {
  final Phone phone;

  PhoneContainer({required this.phone});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PhoneWidget(phone: phone),
        PhoneMinimalDetails(phone: phone),
      ],
    );
  }
}
