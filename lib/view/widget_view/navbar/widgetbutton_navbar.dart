import 'package:flutter/material.dart';

import '../../../const/colors.dart';
// import 'package:semo/core/constant/color.dart';

// ignore: must_be_immutable
class WidgetButtonNavBar extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData icon;
  // final Color color;
  bool active = false;

  WidgetButtonNavBar(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.icon,
      // required this.color,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: active == true ? AppColor.orange: AppColor.primary),
          Text(
            text,
            
            style: TextStyle(
              fontSize: 11,
                color: active == true ? AppColor.orange : AppColor.primary),
          )
        ],
      ),
    );
  }
}
