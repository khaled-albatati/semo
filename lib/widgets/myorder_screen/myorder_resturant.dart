import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';

class MyOrderResturant extends StatelessWidget {
  const MyOrderResturant({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 80,
            width: 80,
            child: Image.asset(
              Helper.getAssetName("hamburger.jpg", "real"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "King Burgers",
              style: Helper.getTheme(context).displaySmall,
            ),
            Row(
              children: [
                Image.asset(
                  Helper.getAssetName(
                    "star_filled.png",
                    "virtual",
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "4.9",
                  style: TextStyle(
                    color: AppColor.orange,
                  ),
                ),
                const Text(" (124 ratings)"),
              ],
            ),
            const Row(
              children:  [
                Text("Burger"),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 5,
                  ),
                  child: Text(
                    ".",
                    style: TextStyle(
                      color: AppColor.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text("Western Food"),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 15,
                  child: Image.asset(
                    Helper.getAssetName(
                      "loc.png",
                      "virtual",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text("No 03, 4th Lane, Newyork")
              ],
            )
          ],
        )
      ],
    );
  }
}
