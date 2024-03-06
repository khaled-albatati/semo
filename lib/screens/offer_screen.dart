// import 'package:flutter/material.dart';
// import 'package:semo/utils/helper.dart';
// import '../widgets/offer_screen/offer_card.dart';

// class OfferScreen extends StatelessWidget {
//   // static const routeName = "/offerScreen";

//   const OfferScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SafeArea(
//             child: SizedBox(
//               height: Helper.getScreenHeight(context),
//               width: Helper.getScreenWidth(context),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Latest Offers",
//                             style: Helper.getTheme(context).headline5,
//                           ),
//                           Image.asset(
//                             Helper.getAssetName("cart.png", "virtual"),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 20.0),
//                       child: Row(
//                         children: [Text("Find discounts, Offer special")],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     // Padding(
//                     //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     //   child: Row(
//                     //     children: [
//                     //       SizedBox(
//                     //         height: 30,
//                     //         width: Helper.getScreenWidth(context) * 0.4,
//                     //         child: ElevatedButton(
//                     //             onPressed: () {},
//                     //             child: const Text("Check Offers")),
//                     //       ),
//                     //     ],
//                     //   ),
//                     // ),
//                     // const SizedBox(
//                     //   height: 30,
//                     // ),
//                     OfferCard(
//                       image: Image.asset(
//                         Helper.getAssetName("breakfast.jpg", "real"),
//                         fit: BoxFit.cover,
//                       ),
//                       name: "Cafe de Noires",
//                     ),
//                     OfferCard(
//                       image: Image.asset(
//                         Helper.getAssetName("western2.jpg", "real"),
//                         fit: BoxFit.cover,
//                       ),
//                       name: "Isso",
//                     ),
//                     OfferCard(
//                       image: Image.asset(
//                         Helper.getAssetName("coffee3.jpg", "real"),
//                         fit: BoxFit.cover,
//                       ),
//                       name: "Cafe Beans",
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
