import 'package:flutter/material.dart';
import '../../utils/helper.dart';

class CheckoutAdress extends StatelessWidget {
  final String location;
  final Widget widget;
  const CheckoutAdress(
      {super.key, required this.location, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Helper.getScreenWidth(context) * 0.4,
                child: Text(
                  location,
                  style: Helper.getTheme(context).displaySmall,
                ),
              ),
              widget,
            ],
          ),
        ),
      ],
    );
  }
}
