import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/models/phone.dart';

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({
    Key? key,
    required this.phone,
  }) : super(key: key);

  final Phone phone;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(phone.phoneImageUrl),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}