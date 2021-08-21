import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/components/home/phoneContainer.dart';
import 'package:ubuni_phone_app/models/phone.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
    required this.phones,
  }) : super(key: key);

  final List<Phone> phones;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return ClipRRect(
          child: PhoneContainer(phone: phones[index]),
          borderRadius: BorderRadius.circular(10.0),
        );
      },
    );
  }
}
