// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:semo/controller/orders/details_controller.dart';
import 'package:semo/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/handling_dataview.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});
  @override
  Widget build(BuildContext context) {
    // OrdersDetailsController controller =
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("147".tr),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
          builder: ((controller) => HandlingDataView(
                statusRequiest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Table(
                              children: [
                                TableRow(children: [
                                  Text('الوجبة',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.backgroundColor1,
                                          fontWeight: FontWeight.bold)),
                                  Text("الكمية".tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.backgroundColor1,
                                          fontWeight: FontWeight.bold)),
                                  Text("السعر".tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.backgroundColor1,
                                          fontWeight: FontWeight.bold)),
                                ]),
                                ...List.generate(
                                    controller.data.length,
                                    (index) => TableRow(children: [
                                          Text(
                                              "${controller.data[index].foodName}",
                                              textAlign: TextAlign.center),
                                          Text(
                                              "${controller.data[index].countitems}",
                                              textAlign: TextAlign.center),
                                          Text(
                                              "${controller.data[index].foodPrice}",
                                              textAlign: TextAlign.center),
                                        ]))
                              ],
                            ),
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                  "الإجمالي:"
                                  "   ${controller.ordersModel.ordersTotalprice} ريال",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColor.backgroundColor1,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (controller.ordersModel.ordersType == "0")
                      Card(
                        child: ListTile(
                          title: Text("153".tr,
                              style: TextStyle(
                                  color: AppColor.backgroundColor1,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              "${controller.ordersModel.addressName} .. ${controller.ordersModel.addressLat} .. ${controller.ordersModel.addressLong}"),
                        ),
                      ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
