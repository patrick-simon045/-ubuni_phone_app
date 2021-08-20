import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/circularProgressIndicatorWidget.dart';
import 'package:ubuni_phone_app/components/text.dart';
import 'package:ubuni_phone_app/globals/fontSizes.dart';
import 'package:ubuni_phone_app/globals/getRequestHeaders.dart';
import 'package:ubuni_phone_app/globals/textStyles.dart';
import 'package:ubuni_phone_app/globals/urls.dart';
import 'package:ubuni_phone_app/models/phone.dart';
import 'package:ubuni_phone_app/modules/home/errorOnDataFetch.dart';
import 'package:ubuni_phone_app/modules/home/homeContents.dart';
import 'package:ubuni_phone_app/utils/httpHandler/httpGetRequest.dart';

class Home extends StatefulWidget {
  final String title;

  Home({required this.title});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final httpHandler = HttpGetRequest(url: phoneListEndpoint, headers: headers);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(text: widget.title, style: appBarTitleStyle),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Phone>>(
        future: httpHandler.requestPhoneList(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            print(snapShot.data!);
            // return  TextWidget(text: "text");
            return HomeContents(phones: snapShot.data!);
          } else if (snapShot.hasError) {
            return ErrorOnDataFetch();
          }
          return CircularProgressIndicatorWidget();
        },
      ),
    );
  }
}
