import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:ubuni_phone_app/models/phone.dart';
import 'package:ubuni_phone_app/root.dart';
import 'package:ubuni_phone_app/utils/httpHandler/httpGetRequest.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(
    MultiProvider(
      child: Root(),
      providers: [
        ChangeNotifierProvider(create: (_) => PhoneListNotifier())
      ],
    ),
  );
}

class PhoneListNotifier with ChangeNotifier {
  List<Phone> _phonesList = [];
  bool loading = false;

  List<Phone> get phonesList => _phonesList;

  void setPhoneList() async {
    try {
      final response = await HttpGetRequest().requestPhoneList();
      _phonesList = response;
      notifyListeners();
    } catch (error) {
      // return some error message
      print("An error has occurred");
      notifyListeners();
    }
  }
}
