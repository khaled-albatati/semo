import 'package:semo/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout(
      {Key? key, required this.title, required this.isActive, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: isActive == true
              ? const Color.fromARGB(255, 25, 150, 52)
              : AppColor.backgroundColor12,
          borderRadius: BorderRadius.circular(20)),
      child: Text(title,
          style: TextStyle(
              color:
                  isActive == true ? Colors.white : AppColor.backgroundColor1,
              height: 1,
              fontWeight: FontWeight.bold)),
    );
  }
}
