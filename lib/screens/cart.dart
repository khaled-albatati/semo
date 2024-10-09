import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/address/view_controller.dart';
import '../const/colors.dart';
import '../controller/cart_controller.dart';
import '../data/model/addressmodel.dart';
import '../widgets/checkout/address.dart';
import '../widgets/checkout/button.dart';
import '../widgets/checkout/payment.dart';
import '../widgets/checkout/price.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      controller.onInit();
    });
  }

  String? selectedLocation;
  CartController controller = Get.put(CartController());
  AddressViewController address = Get.put(AddressViewController());
  int? selectedOption;
  @override
  Widget build(BuildContext context) {
    final colors = address.data;
    return Scaffold(
        appBar: AppBar(
          title: const Text('اكمال الطلب'),
          centerTitle: true,
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const CustomTitle(title: 'اكمال الطلب'),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<AddressViewController>(
                      builder: (controllerx) => controller.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CheckoutAdress(
                              location: 'مواقعك',
                              widget: DropdownButton<String>(
                                hint: const Text('اختر موقع'),
                                value: controller.selectedLocation,
                                items: colors.map<DropdownMenuItem<String>>(
                                    (AddressModel value) {
                                  return DropdownMenuItem<String>(
                                    value: value.addressLong,
                                    child: Text(
                                      value.addressLong!,
                                      style: const TextStyle(fontSize: 12.0),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    controller.selectedLocation = newValue;
                                    final selectedLocationData =
                                        controller.address.firstWhere(
                                      (location) =>
                                          location.addressLong == newValue,
                                    );
                                    // if (selectedLocationData != null) {
                                    controller.addressModelPrice =
                                        selectedLocationData;
                                    // }
                                  });
                                },
                              )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 10,
                      width: double.infinity,
                      color: AppColor.placeholderBg,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CheckOutPayment(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: const Text('الدفع عند الاستلام'),
                          leading: Radio<int>(
                            value: 1,
                            groupValue: selectedOption,
                            onChanged: (int? value) {
                              setState(() {
                                selectedOption = value;
                                // print("Selected Option: $selectedOption");
                                controller.selectedPaymentMethod =
                                    selectedOption.toString();
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('عبر المحفظة'),
                          leading: Radio<int>(
                            value: 2,
                            groupValue: selectedOption,
                            onChanged: (int? value) {
                              setState(() {
                                selectedOption = value;
                                controller.selectedPaymentMethod =
                                    selectedOption.toString();
                                // print("Selected Option: $selectedOption");
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 10,
                      width: double.infinity,
                      color: AppColor.placeholderBg,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PriceCheckOut(
                      deliveryCost:
                          controller.addressModelPrice.addresspricePrice ?? 0.toInt(),
                      discount: controller.priceorders,
                      subtotal: controller.priceorders,
                      total: controller.getTotalPrice().toDouble(),
                    ),
                    Container(
                      height: 10,
                      width: double.infinity,
                      color: AppColor.placeholderBg,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonCheckOut(
                        text: 'اتمام الطلب',
                        onPressed: () {
                          if (controller.selectedPaymentMethod == '1') {
                            controller.checkout();
                          } else {
                            controller.checkoutWallet();
                          }
                        }),
                  ],
                  // ),
                ),
        ));
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:semo/controller/address/view_controller.dart';
// import 'package:semo/core/class/handling_dataview.dart';
// import '../const/colors.dart';
// import '../controller/cart_controller.dart';
// import '../data/model/addressmodel.dart';
// import '../widgets/checkout/address.dart';
// import '../widgets/checkout/button.dart';
// import '../widgets/checkout/payment.dart';
// import '../widgets/checkout/price.dart';

// class Cart extends StatefulWidget {
//   const Cart({super.key});
//   @override
//   State<Cart> createState() => _CartState();
// }

// class _CartState extends State<Cart> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 2), () {
//       controller.onInit();
//     });
//   }

//   String? selectedLocation;
//   CartController controller = Get.put(CartController());
//   AddressViewController address = Get.put(AddressViewController());
//   int? selectedOption;
//   @override
//   Widget build(BuildContext context) {
//     final colors = address.data;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('اكمال الطلب'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: GetBuilder<CartController>(
//           builder: (controller) => HandlingDataView(
//             statusRequiest: controller.statusRequiest,
//             widget: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // const CustomTitle(title: 'اكمال الطلب'),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 GetBuilder<AddressViewController>(
//                     builder: (x) => HandlingDataView(
//                           statusRequiest: x.statusRequest,
//                           widget: CheckoutAdress(
//                               location: 'مواقعك',
//                               widget: DropdownButton<String>(
//                                 hint: const Text('اختر موقع'),
//                                 value: controller.selectedLocation,
//                                 items: colors.map<DropdownMenuItem<String>>(
//                                     (AddressModel value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value.addressLong,
//                                     child: Text(
//                                       value.addressLong!,
//                                       style: const TextStyle(fontSize: 12.0),
//                                     ),
//                                   );
//                                 }).toList(),
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     controller.selectedLocation = newValue;
//                                     final selectedLocationData =
//                                         controller.address.firstWhere(
//                                       (location) =>
//                                           location.addressLong == newValue,
//                                     );
//                                     // if (selectedLocationData != null) {
//                                     controller.addressModelPrice =
//                                         selectedLocationData;
//                                     // }
//                                   });
//                                 },
//                               )),
//                         )),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   height: 10,
//                   width: double.infinity,
//                   color: AppColor.placeholderBg,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const CheckOutPayment(),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     ListTile(
//                       title: const Text('الدفع عند الاستلام'),
//                       leading: Radio<int>(
//                         value: 1,
//                         groupValue: selectedOption,
//                         onChanged: (int? value) {
//                           setState(() {
//                             selectedOption = value;
//                             // print("Selected Option: $selectedOption");
//                             controller.selectedPaymentMethod =
//                                 selectedOption.toString();
//                           });
//                         },
//                       ),
//                     ),
//                     ListTile(
//                       title: const Text('عبر المحفظة'),
//                       leading: Radio<int>(
//                         value: 2,
//                         groupValue: selectedOption,
//                         onChanged: (int? value) {
//                           setState(() {
//                             selectedOption = value;
//                             controller.selectedPaymentMethod =
//                                 selectedOption.toString();
//                             // print("Selected Option: $selectedOption");
//                           });
//                         },
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   height: 10,
//                   width: double.infinity,
//                   color: AppColor.placeholderBg,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 PriceCheckOut(
//                   deliveryCost:
//                       controller.addressModelPrice.addresspricePrice ?? '0',
//                   discount: '${controller.priceorders}%',
//                   subtotal: '${controller.priceorders}',
//                   total: '${controller.getTotalPrice()}',
//                 ),
//                 Container(
//                   height: 10,
//                   width: double.infinity,
//                   color: AppColor.placeholderBg,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ButtonCheckOut(
//                     text: 'اتمام الطلب',
//                     onPressed: () {
//                       if (controller.selectedPaymentMethod == '1') {
//                         controller.checkout();
//                       } else {
//                         controller.checkoutWallet();
//                       }
//                     }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
