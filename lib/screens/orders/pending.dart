import 'package:semo/controller/orders/pending_controller.dart';
import '../../../core/class/handling_dataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../../widgets/orders/orderslistcard.dart';

//track Orders Page
class OrdersPending extends StatelessWidget {
  const OrdersPending({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
          title: const Text("تتبع الطلبات"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.offAllNamed(AppRoutes.navbar);
              },
              icon: const Icon(Icons.home),
            ),
          ]),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersPendingController>(
          builder: ((controller) => HandlingDataView(
                statusRequiest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: ((context, index) =>
                      CardOrdersList(listdata: controller.data[index])),
                ),
              )),
        ),
      ),
    );
  }
}
