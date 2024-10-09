import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';

class PriceCheckOut extends StatelessWidget {
  final double subtotal;
  final int deliveryCost;
  final double discount ;
  final String total;
  const PriceCheckOut({super.key, required this.subtotal, required this.deliveryCost, required this.discount, required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("القيمة"),
              Text(
                subtotal.toString(),
                style: Helper.getTheme(context).displaySmall,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("سعر التوصيل"),
              Text(
                deliveryCost.toString(),
                style: Helper.getTheme(context).displaySmall,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("الخصم"),
              Text(
                discount.toString(),
                style: Helper.getTheme(context).displaySmall,
              )
            ],
          ),
          Divider(
            height: 40,
            color: AppColor.placeholder.withOpacity(0.25),
            thickness: 2,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("الاجمالي"),
                Text(
                  total.toString(),
                  style: Helper.getTheme(context).displaySmall,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
