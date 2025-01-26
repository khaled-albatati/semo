// import 'package:flutter/material.dart';
// import 'package:semo/const/colors.dart';
// import 'package:semo/utils/helper.dart';
// import '../widgets/inbox_screen/inbox_mail.dart';

// class InboxScreen extends StatelessWidget {
//   const InboxScreen({super.key});

//   // static const routeName = "/inboxScreen";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SafeArea(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           icon: const Icon(Icons.arrow_back_ios_rounded),
//                         ),
//                         Expanded(
//                           child: Text(
//                             "Inbox",
//                             style: Helper.getTheme(context).headlineSmall,
//                           ),
//                         ),
//                         Image.asset(
//                           Helper.getAssetName("cart.png", "virtual"),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   const MailCard(
//                     title: "MealMonkey Promotions",
//                     description:
//                         "Lorem Ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor ",
//                     time: "6th July",
//                   ),
//                   const MailCard(
//                     title: "MealMonkey Promotions",
//                     description:
//                         "Lorem Ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor ",
//                     time: "6th July",
//                     color: AppColor.placeholderBg,
//                   ),
//                   const MailCard(
//                     title: "MealMonkey Promotions",
//                     description:
//                         "Lorem Ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor ",
//                     time: "6th July",
//                   ),
//                   const MailCard(
//                     title: "MealMonkey Promotions",
//                     description:
//                         "Lorem Ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor ",
//                     time: "6th July",
//                     color: AppColor.placeholderBg,
//                   ),
//                   const MailCard(
//                     title: "MealMonkey Promotions",
//                     description:
//                         "Lorem Ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor ",
//                     time: "6th July",
//                   ),
//                   const MailCard(
//                     title: "MealMonkey Promotions",
//                     description:
//                         "Lorem Ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor ",
//                     time: "6th July",
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
