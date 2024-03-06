import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';

class MyOrderPrice extends StatelessWidget {
  final String text;
  final String price;
  const MyOrderPrice({super.key, required this.text, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: Helper.getTheme(context).displaySmall,
          ),
        ),
        Text(
          price,
          style: Helper.getTheme(context).displaySmall?.copyWith(
                color: AppColor.orange,
              ),
        )
      ],
    );
  }
}
