import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/text.dart';
import 'package:ubuni_phone_app/globals/fontSizes.dart';

class Home extends StatelessWidget {
  final String title;

  Home({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: title,
          style: TextStyle(fontSize: smallFontSize),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: TextWidget(text: "This is Home"),
      ),
    );
  }
}
