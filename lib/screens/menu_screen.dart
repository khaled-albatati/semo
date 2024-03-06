// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:semo/const/colors.dart';
// import 'package:semo/utils/helper.dart';
// import '../core/constant/routes.dart';
// import '../widgets/menu_screen/menu_card.dart';

// class MenuScreen extends StatelessWidget {
//   const MenuScreen({super.key});

//   // static const routeName = "/menuScreen";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SafeArea(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Menu",
//                         style: Helper.getTheme(context).headline5,
//                       ),
//                       // Image.asset(
//                       //   Helper.getAssetName("cart.png", "virtual"),
//                       // )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 // const CustomSearchBar(title: "Search Food"),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                     height: Helper.getScreenHeight(context) * 0.6,
//                     width: Helper.getScreenWidth(context),
//                     child: Stack(
//                       children: [
//                         Container(
//                           height: double.infinity,
//                           width: 100,
//                           decoration: const ShapeDecoration(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(30),
//                                   bottomRight: Radius.circular(30),
//                                 ),
//                               ),
//                               color: AppColor.orange),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               MenuCard(
//                                 clipper: CustomTriangle(),
//                                 image: 'hamburger3.jpg',
//                                 path: 'real',
//                                 name: "Food",
//                                 count: "120",
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               MenuCard(
//                                 clipper: CustomTriangle(),
//                                 image: 'hamburger3.jpg',
//                                 path: 'real',
//                                 name: "Beverage",
//                                 count: "220",
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Get.toNamed(AppRoutes.dessertScreen);
//                                 },
//                                 child: MenuCard(
//                                   clipper: CustomTriangle(),
//                                   image: 'hamburger3.jpg',
//                                   path: 'real',
//                                   name: "Desserts",
//                                   count: "135",
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               MenuCard(
//                                 clipper: CustomTriangle(),
//                                 image: 'hamburger3.jpg',
//                                 path: 'real',
//                                 name: "Promotions",
//                                 count: "25",
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ))
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:semo/const/colors.dart';
// // import 'package:semo/utils/helper.dart';
// // import 'package:semo/widgets/custom_navbar.dart';
// // import 'package:semo/widgets/searchbar.dart';

// // import '../core/constant/routes.dart';
// // import '../widgets/menu_screen/menu_card.dart';

// // class MenuScreen extends StatelessWidget {
// //   const MenuScreen({super.key});

// //   // static const routeName = "/menuScreen";
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           SafeArea(
// //             child: Column(
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(
// //                     horizontal: 20,
// //                   ),
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Text(
// //                         "Menu",
// //                         style: Helper.getTheme(context).headline5,
// //                       ),
// //                       Image.asset(
// //                         Helper.getAssetName("cart.png", "virtual"),
// //                       )
// //                     ],
// //                   ),
// //                 ),
// //                 const SizedBox(
// //                   height: 20,
// //                 ),
// //                 const SearchBar(title: "Search Food"),
// //                 const SizedBox(
// //                   height: 20,
// //                 ),
// //                 SizedBox(
// //                     height: Helper.getScreenHeight(context) * 0.6,
// //                     width: Helper.getScreenWidth(context),
// //                     child: Stack(
// //                       children: [
// //                         Container(
// //                           height: double.infinity,
// //                           width: 100,
// //                           decoration: const ShapeDecoration(
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.only(
// //                                   topRight: Radius.circular(30),
// //                                   bottomRight: Radius.circular(30),
// //                                 ),
// //                               ),
// //                               color: AppColor.orange),
// //                         ),
// //                         Padding(
// //                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
// //                           child: Column(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             children: [
// //                               MenuCard(
// //                                 imageShape: ClipOval(
// //                                   child: Container(
// //                                     height: 60,
// //                                     width: 60,
// //                                     child: Image.asset(
// //                                       Helper.getAssetName(
// //                                           "western2.jpg", "real"),
// //                                       fit: BoxFit.cover,
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 name: "Food",
// //                                 count: "120",
// //                               ),
// //                               const SizedBox(
// //                                 height: 20,
// //                               ),
// //                               MenuCard(
// //                                 imageShape: ClipRRect(
// //                                   borderRadius: BorderRadius.circular(10),
// //                                   child: Container(
// //                                     height: 60,
// //                                     width: 60,
// //                                     child: Image.asset(
// //                                       Helper.getAssetName(
// //                                           "coffee2.jpg", "real"),
// //                                       fit: BoxFit.cover,
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 name: "Beverage",
// //                                 count: "220",
// //                               ),
// //                               const SizedBox(
// //                                 height: 20,
// //                               ),
// //                               GestureDetector(
// //                                 onTap: () {
// //                                   Get.toNamed(AppRoutes.dessertScreen);
// //                                 },
// //                                 child: MenuCard(
// //                                   imageShape: ClipPath(
// //                                     clipper: CustomTriangle(),
// //                                     child: Container(
// //                                       height: 70,
// //                                       width: 70,
// //                                       child: Image.asset(
// //                                         Helper.getAssetName(
// //                                             "dessert.jpg", "real"),
// //                                         fit: BoxFit.cover,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                   name: "Desserts",
// //                                   count: "135",
// //                                 ),
// //                               ),
// //                               const SizedBox(
// //                                 height: 20,
// //                               ),
// //                               MenuCard(
// //                                 imageShape: ClipPath(
// //                                   clipper: CustomDiamond(),
// //                                   child: Container(
// //                                     height: 80,
// //                                     width: 80,
// //                                     child: Image.asset(
// //                                       Helper.getAssetName(
// //                                           "hamburger3.jpg", "real"),
// //                                       fit: BoxFit.cover,
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 name: "Promotions",
// //                                 count: "25",
// //                               ),
// //                             ],
// //                           ),
// //                         )
// //                       ],
// //                     ))
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

