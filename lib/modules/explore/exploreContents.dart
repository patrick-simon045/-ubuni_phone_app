
import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/globals/padding.dart';
import 'package:ubuni_phone_app/models/phone.dart';

import 'productList.dart';

class ExploreContents extends StatefulWidget {
  final List<Phone> phones;

  ExploreContents({required this.phones});

  @override
  _ExploreContentsState createState() => _ExploreContentsState();
}

class _ExploreContentsState extends State<ExploreContents> {
  @override
  Widget build(BuildContext context) {
    final dimension = smallPadding;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dimension / 2),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProductList(
            phones: widget.phones,
            dimension: dimension,
          ),
        ],
      ),
    );
  }
}

