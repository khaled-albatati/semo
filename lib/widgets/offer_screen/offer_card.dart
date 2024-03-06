import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    Key? key,
    required String name,
    required Image image,
  })  : _image = image,
        _name = name,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 200, width: double.infinity, child: _image),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  _name,
                  style: Helper.getTheme(context)
                      .headlineMedium
                      ?.copyWith(color: AppColor.primary),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Image.asset(
                  Helper.getAssetName("star_filled.png", "virtual"),
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
                const SizedBox(
                  width: 5,
                ),
                const Text("(124 ratings) Cafe"),
                const SizedBox(
                  width: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    ".",
                    style: TextStyle(
                        color: AppColor.orange, fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(" Western Food"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
