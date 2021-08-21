import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/text.dart';

class ErrorOnDataFetch extends StatelessWidget {
  const ErrorOnDataFetch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextWidget(
        text: "Something went wrong",
      ),
    );
  }
}
