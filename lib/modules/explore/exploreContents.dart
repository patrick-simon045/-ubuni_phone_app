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
  int _selectedCategoryIndex = 0;
  List<Phone> _filteredPhoneList = [];

  @override
  Widget build(BuildContext context) {
    Set<String> _phoneBrandCategories = Set();

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
          SizedBox(height: mediumPadding),
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
                      List<Phone> _newFilteredPhoneList = [];
                      _newFilteredPhoneList = widget.phones
                          .where((phone) =>
                              _phoneBrandCategoriesAsList
                                  .elementAt(categoryIndex) ==
                              phone.phoneBrandName)
                          .toList();

                      setState(() {
                        _selectedCategoryIndex = categoryIndex;
                        _filteredPhoneList = _newFilteredPhoneList.length == 0
                            ? widget.phones
                            : _newFilteredPhoneList;
                      });

                      // filtering the phone list
                      print(
                          "${_phoneBrandCategoriesAsList.elementAt(categoryIndex)}");
                      print("_filteredPhoneList; $_newFilteredPhoneList");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        left: _selectedCategoryIndex == categoryIndex
                            ? smallPadding * 2
                            : categoryIndex == 0
                                ? mediumPadding * 2
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
          SizedBox(height: mediumPadding),
          ProductList(
            phones: _filteredPhoneList,
            dimension: dimension,
            categories: _phoneBrandCategoriesAsList,
          ),
        ],
      ),
    );
  }
}
