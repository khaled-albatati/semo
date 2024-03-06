import 'package:flutter/material.dart';

import '../utils/helper.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: Helper.getTheme(context).headlineSmall,
          ),
        ),
      ],
    );
  }
}
