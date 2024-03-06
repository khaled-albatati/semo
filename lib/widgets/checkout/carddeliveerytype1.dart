import 'package:semo/core/constant/color.dart';
// import 'package:haz4u/core/constant/imgaeassets.dart';
import 'package:flutter/material.dart';

class CardDeliveryTypeCheckout1 extends StatelessWidget {
  final String imagename;
  final String title;
  final bool active;
  const CardDeliveryTypeCheckout1(
      {Key? key1,
      required this.imagename,
      required this.title,
      required this.active})
      : super(key: key1);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: active ? AppColor.backgroundColor1 : null,
          border: Border.all(color: AppColor.backgroundColor1)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          imagename,
          width: 50,
          color: active ? Colors.white : null,
        ),
        Text(
          title,
          style: TextStyle(
              color: active ? Colors.white : AppColor.backgroundColor1,
              fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
