import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/trackwsl_controller.dart';
import 'package:semo/widgets/wsl/card_wsl.dart';
import '../core/class/handling_dataview.dart';
import '../core/constant/routes.dart';

class TrackWsl extends StatelessWidget {
  const TrackWsl({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackWslController());
    return Scaffold(
      appBar:
          AppBar(title: const Text("تتبع مرسال"), centerTitle: true, actions: [
        IconButton(
          onPressed: () {
            Get.offAllNamed(AppRoutes.navbar);
          },
          icon: const Icon(Icons.home),
        ),
      ]),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<TrackWslController>(
          builder: ((controller) => HandlingDataView(
                statusRequiest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: ((context, index) =>
                      CardWsl(listdata: controller.data[index])),
                ),
              )),
        ),
      ),
    );
  }
}
