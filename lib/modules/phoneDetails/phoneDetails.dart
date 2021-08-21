import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/circularProgressIndicatorWidget.dart';
import 'package:ubuni_phone_app/components/text.dart';
import 'package:ubuni_phone_app/globals/fontSizes.dart';
import 'package:ubuni_phone_app/globals/urls.dart';
import 'package:ubuni_phone_app/models/phone.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(text: "$phoneId"),
          TextWidget(text: "$phoneName"),
          TextWidget(text: "$phoneBrandName"),
          TextWidget(text: phoneDetailEndpoint(phoneId: phoneId)),
          FutureBuilder<Phone>(
            future: HttpGetRequest().requestPhoneDetails(
              endpoint: phoneDetailEndpoint(phoneId: phoneId),
            ),
            builder: (context, snapShot) {
              if(snapShot.hasData) {
                print("name: ${snapShot.data!.phoneName}");
                print("brand: ${snapShot.data!.phoneBrandName}");

                return TextWidget(text: "we are good to go");
              }
              return CircularProgressIndicatorWidget();
            },
          ),
        ],
      ),
    );
  }
}
