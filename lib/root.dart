import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/modules/homeRoot.dart';
import 'package:ubuni_phone_app/utils/theme/ThemeManager.dart';


class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeManager.lightTheme,
      darkTheme: ThemeManager.darkTheme,
      home: HomeRoot(title: "Home"),
    );
  }
}
