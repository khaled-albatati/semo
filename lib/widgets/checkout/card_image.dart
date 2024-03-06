import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';

class CardCheckOutImage extends StatelessWidget {
  final String image;
  final String path;
  final String hint;
  const CardCheckOutImage(
      {super.key, required this.image, required this.path, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              child: Image.asset(
                Helper.getAssetName(
                  image,
                  path,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(hint),
          ],
        ),
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
