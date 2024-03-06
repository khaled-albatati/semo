import 'package:flutter/material.dart';
//second box

class CheckOutPayment extends StatelessWidget {
  const CheckOutPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("طريقة الدفع"),
          // TextButton(
          //   onPressed: () {
          //     showModalBottomSheet(
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(20),
          //         ),
          //         isScrollControlled: true,
          //         isDismissible: false,
          //         context: context,
          //         builder: (context) {
          //           return SizedBox(
          //             height: Helper.getScreenHeight(context) * 0.7,
          //             child: Column(
          //               children: [
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.end,
          //                   children: [
          //                     IconButton(
          //                       onPressed: () {
          //                         Navigator.of(context).pop();
          //                       },
          //                       icon: const Icon(
          //                         Icons.clear,
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.symmetric(horizontal: 20.0),
          //                   child: Row(
          //                     children: [
          //                       Text(
          //                         "Add Credit/Debit Card",
          //                         style: Helper.getTheme(context).headline3,
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.symmetric(horizontal: 20.0),
          //                   child: Divider(
          //                     color: AppColor.placeholder.withOpacity(0.5),
          //                     thickness: 1.5,
          //                     height: 40,
          //                   ),
          //                 ),
          //                 const Padding(
          //                   padding: EdgeInsets.symmetric(horizontal: 20.0),
          //                   child: CustomTextInput(hintText: "card Number"),
          //                 ),
          //                 const SizedBox(
          //                   height: 20,
          //                 ),
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.symmetric(horizontal: 20.0),
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: const [
          //                       Text("Expiry"),
          //                       SizedBox(
          //                         height: 50,
          //                         width: 100,
          //                         child: CustomTextInput(
          //                           hintText: "MM",
          //                           // padding:  EdgeInsets.only(
          //                           //     left: 35),
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         height: 50,
          //                         width: 100,
          //                         child: CustomTextInput(
          //                           hintText: "YY",
          //                         ),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //                 const SizedBox(
          //                   height: 20,
          //                 ),
          //                 const Padding(
          //                   padding: EdgeInsets.symmetric(horizontal: 20.0),
          //                   child: CustomTextInput(hintText: "Security Code"),
          //                 ),
          //                 const SizedBox(
          //                   height: 20,
          //                 ),
          //                 const Padding(
          //                   padding: EdgeInsets.symmetric(horizontal: 20.0),
          //                   child: CustomTextInput(hintText: "First Name"),
          //                 ),
          //                 const SizedBox(
          //                   height: 20,
          //                 ),
          //                 const Padding(
          //                   padding: EdgeInsets.symmetric(horizontal: 20.0),
          //                   child: CustomTextInput(hintText: "Last Name"),
          //                 ),
          //                 const SizedBox(
          //                   height: 20,
          //                 ),
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.symmetric(horizontal: 20.0),
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       SizedBox(
          //                         width: Helper.getScreenWidth(context) * 0.4,
          //                         child: const Text(
          //                             "You can remove this card at anytime"),
          //                       ),
          //                       Switch(
          //                         value: false,
          //                         onChanged: (_) {},
          //                         thumbColor: MaterialStateProperty.all(
          //                           AppColor.secondary,
          //                         ),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //                 const SizedBox(
          //                   height: 30,
          //                 ),
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.symmetric(horizontal: 20.0),
          //                   child: SizedBox(
          //                     height: 50,
          //                     child: ElevatedButton(
          //                         onPressed: () {
          //                           Navigator.of(context).pop();
          //                         },
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.center,
          //                           children: const [
          //                             Icon(
          //                               Icons.add,
          //                             ),
          //                             SizedBox(width: 40),
          //                             Text("Add Card"),
          //                             SizedBox(width: 40),
          //                           ],
          //                         )),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           );
          //         });
          //   },
          //   child: Row(
          //     children: const [
          //       Icon(Icons.add),
          //       Text(
          //         "Add Card",
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
