import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ubuni_phone_app/components/text.dart';

class Exit extends StatelessWidget {
  const Exit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade800),
        ),
        onPressed: () {
          SystemNavigator.pop();
        },
        child: TextWidget(
          text: "Close the App",
        ),
      ),
    );
  }
}
