import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/text.dart';
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
  Set<String> _phoneBrandCategories = Set();
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    widget.phones.forEach((phone) {
      _phoneBrandCategories.add(phone.phoneBrandName);
    });
    _phoneBrandCategories.add("All");

    // phone brand list
    final _phoneBrandCategoriesAsList = _phoneBrandCategories.toList();
    _phoneBrandCategoriesAsList.sort();

    final dimension = smallPadding;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dimension / 2),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: 50.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: _phoneBrandCategoriesAsList.map(
                (category) {
                  int categoryIndex =
                      _phoneBrandCategoriesAsList.indexOf(category);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = categoryIndex;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        left: _selectedCategoryIndex == categoryIndex
                            ? smallPadding * 2
                            : 0.0,
                        right: _selectedCategoryIndex == categoryIndex
                            ? smallPadding * 2
                            : smallPadding,
                      ),
                      child: TextWidget(
                        text: "$category",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _selectedCategoryIndex == categoryIndex
                              ? 50.0
                              : 40.0,
                          color: _selectedCategoryIndex == categoryIndex
                              ? Colors.grey
                              : Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          ProductList(
            phones: widget.phones,
            dimension: dimension,
          ),
        ],
      ),
    );
  }
}
