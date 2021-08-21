import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/text.dart';
import 'package:ubuni_phone_app/globals/textStyles.dart';

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
    Center(child: TextWidget(text: "Explore")),
    Center(child: TextWidget(text: "Options")),
  ];

  List<String> navigationLabels = ["Home", "Explore", "Options"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
            text: navigationLabels.elementAt(_currentIndex),
            style: appBarTitleStyle),
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
