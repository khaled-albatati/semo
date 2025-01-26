// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:semo/const/colors.dart';
// import 'package:semo/core/constant/routes.dart';
// import 'package:semo/widgets/custom_navbar.dart';
// import 'package:semo/widgets/custom_title.dart';
// import 'package:semo/widgets/myorder_screen/myorder_card.dart';
// import 'package:semo/widgets/myorder_screen/myorder_price.dart';
// import 'package:semo/widgets/myorder_screen/myorder_resturant.dart';

// class MyOrderScreen extends StatelessWidget {
//   // static const routeName = "/myOrderScreen";
//   const MyOrderScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SafeArea(
//             child: Column(
//               children: [
//                 const CustomTitle(title: 'My Order'),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0),
//                   child: SizedBox(
//                     height: 80,
//                     child: MyOrderResturant(),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   color: AppColor.placeholderBg,
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Column(
//                       children: [
//                         MyOrderCard(
//                           price: "16",
//                           name: "Beef Burger",
//                         ),
//                         MyOrderCard(
//                           price: "14",
//                           name: "Classic Burger",
//                         ),
//                         MyOrderCard(
//                           price: "17",
//                           name: "Cheese Chicken Burger",
//                         ),
//                         MyOrderCard(
//                           price: "15",
//                           name: "Chicken Legs Basket",
//                         ),
//                         MyOrderCard(
//                           price: "6",
//                           name: "French Fries Large",
//                           isLast: true,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Column(
//                     children: [
//                       // Container(
//                       //   height: 50,
//                       //   decoration: BoxDecoration(
//                       //     border: Border(
//                       //       bottom: BorderSide(
//                       //         color: AppColor.placeholder.withOpacity(0.25),
//                       //       ),
//                       //     ),
//                       //   ),
//                       //   child:
//                       //   Row(
//                       //     children: [
//                       //       Expanded(
//                       //         child: Text(
//                       //           "Delivery Instruction",
//                       //           style: Helper.getTheme(context).headline3,
//                       //         ),
//                       //       ),
//                       //       TextButton(
//                       //           onPressed: () {},
//                       //           child: Row(
//                       //             children: const [
//                       //               Icon(
//                       //                 Icons.add,
//                       //                 color: AppColor.orange,
//                       //               ),
//                       //               Text(
//                       //                 "Add Notes",
//                       //                 style: TextStyle(
//                       //                   color: AppColor.orange,
//                       //                 ),
//                       //               )
//                       //             ],
//                       //           ))
//                       //     ],
//                       //   ),
//                       // ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       const MyOrderPrice(text: 'السعر', price: '5000'),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const MyOrderPrice(text: 'سعر التوصيل', price: '1000'),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Divider(
//                         color: AppColor.placeholder.withOpacity(0.25),
//                         thickness: 1.5,
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const MyOrderPrice(text: 'الاجمالي', price: '6000'),
//                       const SizedBox(height: 20),
//                       SizedBox(
//                         height: 50,
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Get.toNamed(AppRoutes.checkout);
//                           },
//                           child: const Text("Checkout"),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const Positioned(
//             bottom: 0,
//             left: 0,
//             child: CustomNavBar(),
//           ),
//         ],
//       ),
//     );
//   }
// }
