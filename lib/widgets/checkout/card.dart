import 'package:flutter/material.dart';
import '../../const/colors.dart';

class CardCheckOutText extends StatelessWidget {
  final String? text;
  const CardCheckOutText({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(text!),
        Container(
          width: 15,
          height: 15,
          decoration: const ShapeDecoration(
            shape: CircleBorder(
              side: BorderSide(color: AppColor.orange),
            ),
          ),
        )
      ],
    );
  }
}
