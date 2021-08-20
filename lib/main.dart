import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ubuni_phone_app/root.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(Root());
}
