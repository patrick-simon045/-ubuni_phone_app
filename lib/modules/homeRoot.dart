import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/text.dart';
import 'package:ubuni_phone_app/globals/fontSizes.dart';

import 'exit/exit.dart';
import 'explore/explore.dart';
import 'home/home.dart';

class HomeRoot extends StatefulWidget {
  final String title;

  HomeRoot({required this.title});

  @override
  _HomeRootState createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  int _currentIndex = 0;

  List<Widget> navigationScreens = [
    Home(),
    Explore(),
    Exit(),
  ];

  List<String> navigationLabels = ["Home", "All Phones", "Exit"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: TextWidget(
          text: navigationLabels.elementAt(_currentIndex),
          style: TextStyle(
            fontSize: mediumFontSize,
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: navigationLabels
            .map(
              (label) => BottomNavigationBarItem(
                  icon: SizedBox.shrink(), label: "$label"),
            )
            .toList(),
      ),
      body: navigationScreens.elementAt(_currentIndex),
    );
  }
}
