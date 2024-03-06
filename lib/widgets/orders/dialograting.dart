// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// import 'package:semo/controller/orders/archive_controller.dart';
// import 'package:semo/core/constant/imageassets.dart';
// import 'package:rating_dialog/rating_dialog.dart';
// import '../../../core/constant/color.dart';

// void showDialogRating(BuildContext context, String ordersid) {
//   showDialog(
//     context: context,
//     barrierDismissible: true, // set to false if you want to force a rating
//     builder: (context) => RatingDialog(
//       initialRating: 1.0,
//       // your app's name?
//       title: Text(
//         "30".tr,
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           fontSize: 25,
//           fontWeight: FontWeight.bold,
//           color: AppColor.backgroundColor,
//         ),
//       ),
//       // encourage your user to leave a high rating?
//       message: const Text(
//         'Tap a star to set your rating, Add more description here if you want',
//         textAlign: TextAlign.center,
//         style: TextStyle(fontSize: 15),
//       ),
//       // your app's logo?
//       image: Image.asset(AppImageAssets.logosemo, width: 200, height: 200),
//       starSize: 25,
//       submitButtonText: "76".tr,
//       commentHint: 'Set your custom comment hint',
//       // ignore: avoid_print
//       onCancelled: () => print('cancelled'),
//       onSubmitted: (response) {
//         OrdersArchiveController controller = Get.find();
//         // print('rating: ${response.rating}, comment: ${response.comment}');
//         controller.submitRating(ordersid, response.rating, response.comment);

//         // if (response.rating < 3.0) {
//         //   // send their comments to your email or anywhere you wish
//         //   // ask the user to contact you instead of leaving a bad review
//         // } else {
//         //   _rateAndReviewApp();
//         // }
//       },
//     ),
//   );
// }
