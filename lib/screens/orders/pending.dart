import 'package:semo/controller/orders/pending_controller.dart';
import '../../../core/class/handling_dataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../utils/helper.dart';
import '../../widgets/orders/orderslistcard.dart';

// Track Orders Page
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
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                Helper.getAssetName("splashIcon.png", "virtual"),
              ),
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersPendingController>(
            builder: (controller) {
              if (controller.data.isEmpty) {
                return const Center(
                  child: Text(
                    "لا يوجد بيانات",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                );
              }
              return HandlingDataView(
                statusRequiest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) =>
                      CardOrdersList(listdata: controller.data[index]),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final controller = Get.find<OrdersPendingController>();
            controller.clearData(); // Clear old data
            controller.getOrders(); // Fetch new data
          },
          tooltip: 'Reload Orders',
          backgroundColor: AppColor.orange,
          child: const Icon(Icons.refresh),
        ));
  }
}
