// import 'package:semo/controller/orders/archive_controller.dart';
// import 'package:semo/core/constant/color.dart';
// import 'package:semo/core/constant/routes.dart';
// import 'package:semo/data/model/ordersmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:semo/widgets/orders/dialograting.dart';
// import 'package:jiffy/jiffy.dart';

// class CardOrdersListArchive extends GetView<OrdersArchiveController> {
//   final OrdersModel listdata;

//   const CardOrdersListArchive({Key? key, required this.listdata})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text("${"161".tr}: #${listdata.ordersId}",
//                       style: const TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.bold)),
//                   const Spacer(),
//                   // Text(listdata.ordersDatetime!)
//                   Text(
//                     Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow(),
//                     style: const TextStyle(
//                         color: AppColor.backgroundColor1,
//                         fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//               const Divider(),
//               Text("${"170".tr} : ${controller.printOrderType(listdata.ordersType!)}"),
//               Text("${"171".tr} : ${listdata.ordersPrice} \$"),
//               Text("${"172".tr} : ${listdata.ordersPricedelivery} \$ "),
//               Text("${"173".tr} : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
//               Text("${"174".tr} : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
//               const Divider(),
//               Row(
//                 children: [
//                   Text("${"140".tr} : ${listdata.ordersTotalprice} \$ ",
//                       style: const TextStyle(
//                           color: AppColor.backgroundColor1,
//                           fontWeight: FontWeight.bold)),
//                   const Spacer(),
//                   MaterialButton(
//                       onPressed: () {
//                         Get.toNamed(AppRoutes.ordersdetails,
//                             arguments: {"ordersmodel": listdata});
//                       },
//                       color: AppColor.backgroundColor,
//                       textColor: AppColor.backgroundColor12,
//                       child: Text(
//                         "147".tr,
//                       )),
//                   const SizedBox(width: 10),
//                   if (listdata.ordersRating == "0")
//                     MaterialButton(
//                         onPressed: () {
//                           showDialogRating(context, listdata.ordersId!);
//                           // Get.toNamed(AppRoutes.ordersdetails,
//                           //     arguments: {"ordersmodel": listdata});
//                         },
//                         color: AppColor.backgroundColor,
//                         textColor: AppColor.backgroundColor12,
//                         child: Text(
//                           "112".tr,
//                         )),
//                 ],
//               ),
//             ],
//           )),
//     );
//   }
// }
