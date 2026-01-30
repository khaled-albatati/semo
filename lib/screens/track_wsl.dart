import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/trackwsl_controller.dart';
import 'package:semo/widgets/wsl/card_wsl.dart';
import '../core/class/handling_dataview.dart';
import '../core/constant/color.dart';
import '../core/constant/routes.dart';
import '../utils/helper.dart';

class TrackWsl extends StatelessWidget {
  const TrackWsl({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackWslController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("تتبع مرسال"),
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
        child: GetBuilder<TrackWslController>(
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
                    CardWsl(listdata: controller.data[index]),
              ),
            );
          },
        ),
      ),floatingActionButton: FloatingActionButton(
          onPressed: () {
            final controller = Get.find<TrackWslController>();
            controller.clearData(); // Clear old data
            controller.getOrders(); // Fetch new data
          },
          tooltip: 'Reload Orders',
          backgroundColor: AppColor.orange,
          child: const Icon(Icons.refresh),
        ));
  }
}