import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/circularProgressIndicatorWidget.dart';
import 'package:ubuni_phone_app/components/text.dart';
import 'package:ubuni_phone_app/globals/fontSizes.dart';
import 'package:ubuni_phone_app/globals/urls.dart';
import 'package:ubuni_phone_app/models/phone.dart';
import 'package:ubuni_phone_app/modules/phoneDetails/phoneDetailsScreen.dart';
import 'package:ubuni_phone_app/utils/httpHandler/httpGetRequest.dart';

class PhoneDetails extends StatelessWidget {
  final int phoneId;
  final String phoneName;
  final String phoneBrandName;

  PhoneDetails({
    required this.phoneId,
    required this.phoneName,
    required this.phoneBrandName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: TextWidget(
          text: "$phoneName Details",
          style: TextStyle(
            fontSize: mediumFontSize,
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: TextWidget(text: "Back"),
        ),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<Phone>(
        future: HttpGetRequest().requestPhoneDetails(
          endpoint: phoneDetailEndpoint(phoneId: phoneId),
        ),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return PhoneDetailsScreen(phone: snapShot.data!);
          }
          return CircularProgressIndicatorWidget();
        },
      ),
    );
  }
}
