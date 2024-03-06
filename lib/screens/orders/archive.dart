// import 'package:semo/controller/orders/archive_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/class/handling_dataview.dart';
// import '../../widgets/orders/orderslistcardarchive.dart';
// //order History

// class OrdersArchiveView extends StatelessWidget {
//   const OrdersArchiveView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Get.put(OrdersArchiveController());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("168".tr),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(10),
//         child: GetBuilder<OrdersArchiveController>(
//           builder: ((controller) => HandlingDataView(
//                 statusRequiest: controller.statusRequest,
//                 widget: ListView.builder(
//                   itemCount: controller.data.length,
//                   itemBuilder: ((context, index) =>
//                       CardOrdersListArchive(listdata: controller.data[index])),
//                 ),
//               )),
//         ),
//       ),
//     );
//   }
// }
