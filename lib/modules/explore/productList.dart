import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/text.dart';
import 'package:ubuni_phone_app/globals/colors.dart';
import 'package:ubuni_phone_app/globals/padding.dart';
import 'package:ubuni_phone_app/models/phone.dart';

class ProductList extends StatefulWidget {
  final List<Phone> phones;
  final double dimension;

  ProductList({required this.phones, required this.dimension});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.phones.length,
      itemBuilder: (context, index) {
        final phone = widget.phones[index];
        return Padding(
          padding: EdgeInsets.only(
            top: index == 0 ? widget.dimension : 0.0,
            bottom: index == widget.phones.length - 1
                ? smallPadding
                : widget.dimension,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? lightAppBarColor.withOpacity(0.8)
                      : darkPhoneContainer,
              child: Row(
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? Colors.white.withOpacity(0.5)
                          : darkAppBarColor,
                      image: DecorationImage(
                        image: NetworkImage(phone.phoneImageUrl),
                      ),
                    ),
                  ),
                  SizedBox(width: smallPadding),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: "${phone.phoneName}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      TextWidget(
                        text: "${phone.phoneBrandName}",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}