import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class HeaderLog extends StatelessWidget {
  final String text;
  const HeaderLog({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, 
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: AppColor.cyan));
  }
}