import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:semo/controller/trackwsl_controller.dart';
import 'package:semo/data/model/orderwsl_model.dart';
import '../../core/constant/color.dart';

class CardWsl extends GetView<TrackWslController> {
  final OrderWsl listdata;

   const CardWsl({Key? key, required this.listdata}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("رقم مرسال: #${listdata.addressOrderId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text(
                    Jiffy(listdata.addressOrderTime!,).fromNow(),
                    style: const TextStyle(
                        color: AppColor.backgroundColor1,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text("${"مكان الارسال"} : ${listdata.addressOrderSource}"),
              Text("${"مكان التوصيل"} : ${listdata.addressOrderDestination}"),
              Text("${"الوصف"} : ${listdata.addressOrderDetails}"),
              Text(
                  "${"الحالة " } : ${controller.printOrderStatus(listdata.addressOrderStatus!)} "),
              Text("${"السعر "} : ${listdata.addressOrderPrice}  ريال"),
              const Divider(),
                              ],
              ),
          )
    );
  }
}
