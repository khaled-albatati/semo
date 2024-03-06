import 'package:semo/controller/orders/pending_controller.dart';
import 'package:semo/core/constant/color.dart';
import 'package:semo/core/constant/routes.dart';
import 'package:semo/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;

  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

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
                  Text("رقم الفاتورة: #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text(
                    Jiffy(listdata.ordersDatetime!,).fromNow(),
                    style: const TextStyle(
                        color: AppColor.backgroundColor1,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text("${"171".tr} : ${listdata.ordersPrice}  ريال"),
              Text("${"172".tr} : ${listdata.ordersPricedelivery}  ريال "),
              Text(
                  "${"174".tr} : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: MaterialButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.ordersdetails,
                              arguments: {"ordersmodel": listdata});
                        },
                        color: AppColor.backgroundColor,
                        textColor: AppColor.backgroundColor12,
                        child: const Text("التفاصيل")),
                  ),
                  // const SizedBox(width: 10),
                  // if (listdata.ordersStatus! == "0")
                  //   MaterialButton(
                  //       onPressed: () {
                  //         controller.deleteOrder(listdata.ordersId!);
                  //       },
                  //       color: AppColor.backgroundColor,
                  //       textColor: AppColor.backgroundColor12,
                  //       child: Text(
                  //         "101".tr,
                  //       ))
                ],
              ),
            ],
          )),
    );
  }
}
