import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/circularProgressIndicatorWidget.dart';
import 'package:ubuni_phone_app/models/phone.dart';
import 'package:ubuni_phone_app/modules/home/errorOnDataFetch.dart';
import 'package:ubuni_phone_app/utils/httpHandler/httpGetRequest.dart';

import 'exploreContents.dart';

class Explore extends StatefulWidget {
  const Explore({
    Key? key,
  }) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final httpHandler = HttpGetRequest();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Phone>>(
      future: httpHandler.requestPhoneList(),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return ExploreContents(phones: snapShot.data!);
        } else if (snapShot.hasError) {
          return ErrorOnDataFetch();
        }
        return CircularProgressIndicatorWidget();
      },
    );
  }
}
