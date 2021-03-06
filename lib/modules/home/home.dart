import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/circularProgressIndicatorWidget.dart';

import 'package:ubuni_phone_app/models/phone.dart';
import 'package:ubuni_phone_app/modules/home/errorOnDataFetch.dart';
import 'package:ubuni_phone_app/modules/home/homeContents.dart';
import 'package:ubuni_phone_app/utils/httpHandler/httpGetRequest.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final httpHandler = HttpGetRequest();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Phone>>(
      future: httpHandler.requestPhoneList(),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return HomeContents(phones: snapShot.data!);
        } else if (snapShot.hasError) {
          return ErrorOnDataFetch();
        }
        return CircularProgressIndicatorWidget();
      },
    );
  }
}
