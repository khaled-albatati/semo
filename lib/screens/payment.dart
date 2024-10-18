// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../const/colors.dart';
// import '../controller/address/view_controller.dart';
// import '../controller/cart_controller.dart';
// import '../data/model/addressmodel.dart';
// import '../widgets/checkout/address.dart';
// import '../widgets/checkout/button.dart';
// import '../widgets/checkout/payment.dart';
// import '../widgets/checkout/price.dart';

// class Payment extends StatefulWidget {
//   const Payment({super.key});

//   @override
//   State<Payment> createState() => _PaymentState();
// }

// class _PaymentState extends State<Payment> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 2), () {
//       controller.onInit();
//     });
//   }

//   CartController controller = Get.put(CartController());
//   AddressViewController address = Get.put(AddressViewController());
//   String? selectedLocation;
//   int? selectedOption;
//   int? object;
//   // Inside your Payment widget
//   @override
//   Widget build(BuildContext context) {
//     final colors = address.data;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('اكمال الطلب'),
//         centerTitle: true,
//       ),
//       body: GetBuilder<CartController>(
//         builder: (controller) => controller.isLoading
//             ? const Center(child: CircularProgressIndicator())
//             : SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 10),
//                     GetBuilder<AddressViewController>(
//                       builder: (controllerx) => controller.isLoading
//                           ? const Center(child: CircularProgressIndicator())
//                           : CheckoutAdress(
//                               location: 'مواقعك',
//                               widget: DropdownButton<String>(
//                                 hint: const Text('اختر موقع'),
//                                 value: controller.selectedLocation,
//                                 items: colors.map<DropdownMenuItem<String>>(
//                                   (AddressModel address) {
//                                     return DropdownMenuItem<String>(
//                                       value: address.addressLong,
//                                       child: Text(
//                                         address.addressLong!,
//                                         style: const TextStyle(fontSize: 12.0),
//                                       ),
//                                     );
//                                   },
//                                 ).toList(), // No need for a Set if you're using a list directly
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     controller.selectedLocation = newValue;
//                                     // controller.addressModelPrice.addressId=1;
//                                     // print(newValue);

//                                     if (newValue != null) {
//                                       // Find the selected AddressModelPrice
//                                       var selectedAddress = colors.firstWhere(
//                                         (address) =>
//                                             address.addressLong == newValue,
//                                       );
//                                       controller.addressModelPrice.addressId =
//                                           selectedAddress.addressId;
//                                       controller.addressModelPrice
//                                               .addresspricePrice =
//                                           selectedAddress.addresspricePrice;
//                                       // Ensure selectedAddress is not null
//                                       // Access the price from AddressModelPrice
//                                       // print(
//                                       //     "Selected Price: ${selectedAddress.addresspricePrice}");
//                                     }
//                                   });
//                                 },
//                               ),
//                             ),
//                     ),
//                     const SizedBox(height: 10),
//                     Container(
//                       height: 10,
//                       width: double.infinity,
//                       color: AppColor.placeholderBg,
//                     ),
//                     const SizedBox(height: 20),
//                     const CheckOutPayment(),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         ListTile(
//                           title: const Text('الدفع عند الاستلام'),
//                           leading: Radio<int>(
//                             value: 1,
//                             groupValue: selectedOption,
//                             onChanged: (int? value) {
//                               setState(() {
//                                 selectedOption = value;
//                                 controller.selectedPaymentMethod =
//                                     selectedOption.toString();
//                               });
//                             },
//                           ),
//                         ),
//                         ListTile(
//                           title: const Text('عبر المحفظة'),
//                           leading: Radio<int>(
//                             value: 2,
//                             groupValue: selectedOption,
//                             onChanged: (int? value) {
//                               setState(() {
//                                 selectedOption = value;
//                                 controller.selectedPaymentMethod =
//                                     selectedOption.toString();
//                               });
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Container(
//                       height: 10,
//                       width: double.infinity,
//                       color: AppColor.placeholderBg,
//                     ),
//                     const SizedBox(height: 20),
//                     PriceCheckOut(
//                       deliveryCost:
//                           controller.addressModelPrice.addresspricePrice ?? 0,
//                       discount: controller.priceorders,
//                       subtotal: controller.totalPrice,
//                       total: controller.getTotalPrice().toString(),
//                     ),
//                     Container(
//                       height: 10,
//                       width: double.infinity,
//                       color: AppColor.placeholderBg,
//                     ),
//                     const SizedBox(height: 20),
//                     ButtonCheckOut(
//                       text: 'اتمام الطلب',
//                       onPressed: () {
//                         if (controller.selectedPaymentMethod == '1') {
//                           controller.checkout();
//                         } else {
//                           controller.checkoutWallet();
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/colors.dart';
import '../controller/address/view_controller.dart';
import '../controller/cart_controller.dart';
import '../data/model/addressmodel.dart';
import '../widgets/checkout/address.dart';
import '../widgets/checkout/button.dart';
import '../widgets/checkout/payment.dart';
import '../widgets/checkout/price.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
   final TextEditingController couponController = TextEditingController();
  int discountAmount = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      controller.onInit();
    });
  }

  void validateCoupon(String couponCode) {
    controller.validateCoupon(couponCode).then((discount) {
      setState(() {
        discountAmount = discount;
      });
    });
  }
  CartController controller = Get.put(CartController());
  AddressViewController address = Get.put(AddressViewController());
  String? selectedLocation;
  int? selectedOption;
  int? object;
  // Inside your Payment widget
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
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    GetBuilder<AddressViewController>(
                      builder: (controllerx) => controller.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CheckoutAdress(
                              location: 'مواقعك',
                              widget: DropdownButton<String>(
                                hint: const Text('اختر موقع'),
                                value: controller.selectedLocation,
                                items: colors.map<DropdownMenuItem<String>>(
                                  (AddressModel address) {
                                    return DropdownMenuItem<String>(
                                      value: address.addressLong,
                                      child: Text(
                                        address.addressLong!,
                                        style: const TextStyle(fontSize: 12.0),
                                      ),
                                    );
                                  },
                                ).toList(), // No need for a Set if you're using a list directly
                                onChanged: (String? newValue) {
                                  setState(() {
                                    controller.selectedLocation = newValue;
                                    // controller.addressModelPrice.addressId=1;
                                    // print(newValue);

                                    if (newValue != null) {
                                      // Find the selected AddressModelPrice
                                      var selectedAddress = colors.firstWhere(
                                        (address) =>
                                            address.addressLong == newValue,
                                      );
                                      controller.addressModelPrice.addressId =
                                          selectedAddress.addressId;
                                      controller.addressModelPrice
                                              .addresspricePrice =
                                          selectedAddress.addresspricePrice;
                                      // Ensure selectedAddress is not null
                                      // Access the price from AddressModelPrice
                                      // print(
                                      //     "Selected Price: ${selectedAddress.addresspricePrice}");
                                    }
                                  });
                                },
                              ),
                            ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 10,
                      width: double.infinity,
                      color: AppColor.placeholderBg,
                    ),
                    const SizedBox(height: 20),
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
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 10,
                      width: double.infinity,
                      color: AppColor.placeholderBg,
                    ),
                      const SizedBox(height: 20),
                  TextField(
                    controller: couponController,
                    decoration: const InputDecoration(
                      labelText: 'ادخل كود الخصم',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: validateCoupon,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'الخصم: ${discountAmount.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.green, fontSize: 16),
                  ),
                    const SizedBox(height: 20),
                    PriceCheckOut(
                      deliveryCost:
                          controller.addressModelPrice.addresspricePrice ?? 0,
                      discount: controller.priceorders,
                      subtotal: controller.totalPrice,
                      total: controller.getTotalPrice(discountAmount.toDouble()).toString(),
                    ),
                    Container(
                      height: 10,
                      width: double.infinity,
                      color: AppColor.placeholderBg,
                    ),
                    const SizedBox(height: 20),
                    ButtonCheckOut(
                      text: 'اتمام الطلب',
                      onPressed: () {
                        if (controller.selectedPaymentMethod == '1') {
                          controller.checkout(couponController.text);
                        } else {
                          controller.checkoutWallet(couponController.text);
                        }
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:semo/controller/payment_controller.dart';

// class Payment extends StatefulWidget {
//   const Payment({super.key});

//   @override
//   State<Payment> createState() => _PaymentState();
// }

// class _PaymentState extends State<Payment> {
  
//   @override
//   Widget build(BuildContext context) {
//   PaymentController controller=  Get.put(PaymentController());
//     return Scaffold(body: Center(child: Text(controller.arguments['order_price'].toString()),));
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:semo/controller/payment_controller.dart';

// import '../const/colors.dart';
// import '../controller/address/view_controller.dart';
// import '../controller/cart_controller.dart';
// import '../data/model/addressmodel.dart';
// import '../widgets/checkout/address.dart';
// import '../widgets/checkout/button.dart';
// import '../widgets/checkout/payment.dart';
// import '../widgets/checkout/price.dart';

// class Payment extends StatefulWidget {
//   const Payment({super.key});

//   @override
//   State<Payment> createState() => _PaymentState();
// }

// class _PaymentState extends State<Payment> {
  
// @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 2), () {
//       controller.onInit();
//     });
//   }
//     String dropdownvalue = 'Item 1';


//   // List of items in our dropdown menu
//   var items = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//   ];

//   String? selectedLocation;
//   CartController controller = Get.put(CartController());
//   AddressViewController address = Get.put(AddressViewController());
//   int? selectedOption;
//   @override
//   Widget build(BuildContext context) {
//     final colors = address.data;
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('اكمال الطلب'),
//           centerTitle: true,
//         ),
//         body: 
//         GetBuilder<CartController>(
//           builder: (controller) => controller.isLoading
//               ? const Center(child: CircularProgressIndicator())
//               :
//                Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // const CustomTitle(title: 'اكمال الطلب'),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     GetBuilder<AddressViewController>(
//                       builder: (controllerx) => controller.isLoading
//                           ? const Center(child: CircularProgressIndicator())
//                           : 
//                           CheckoutAdress(
//                               location: 'مواقعك',
//                               widget: 
                              
//                               DropdownButton<String>(
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
//               //                 )
//               //                  DropdownButton(
//               // // Initial Value
//               // value: dropdownvalue,


//               // // Down Arrow Icon
//               // icon: const Icon(Icons.keyboard_arrow_down),


//               // // Array list of items
//               // items: items.map((String items) {
//               //   return DropdownMenuItem(
//               //     value: items,
//               //     child: Text(items),
//               //   );
//               // }).toList(),
//               // // After selecting the desired option,it will
//               // // change button value to selected value
//               // onChanged: (String? newValue) {
//               //   setState(() {
//               //     dropdownvalue = newValue!;
//               //   });
//               // },)
//                               // ),
//                     // ),
//                               ))),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       height: 10,
//                       width: double.infinity,
//                       color: AppColor.placeholderBg,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const CheckOutPayment(),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         ListTile(
//                           title: const Text('الدفع عند الاستلام'),
//                           leading: Radio<int>(
//                             value: 1,
//                             groupValue: selectedOption,
//                             onChanged: (int? value) {
//                               setState(() {
//                                 selectedOption = value;
//                                 // print("Selected Option: $selectedOption");
//                                 controller.selectedPaymentMethod =
//                                     selectedOption.toString();
//                               });
//                             },
//                           ),
//                         ),
//                         ListTile(
//                           title: const Text('عبر المحفظة'),
//                           leading: Radio<int>(
//                             value: 2,
//                             groupValue: selectedOption,
//                             onChanged: (int? value) {
//                               setState(() {
//                                 selectedOption = value;
//                                 controller.selectedPaymentMethod =
//                                     selectedOption.toString();
//                                 // print("Selected Option: $selectedOption");
//                               });
//                             },
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       height: 10,
//                       width: double.infinity,
//                       color: AppColor.placeholderBg,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     PriceCheckOut(
//                       deliveryCost:
//                           controller.addressModelPrice.addresspricePrice ?? 0,
//                       discount: controller.priceorders,
//                       subtotal: controller.priceorders,
//                       total: controller.getTotalPrice.toString(),
//                     ),
//                     Container(
//                       height: 10,
//                       width: double.infinity,
//                       color: AppColor.placeholderBg,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     ButtonCheckOut(
//                         text: 'اتمام الطلب',
//                         onPressed: () {
//                           if (controller.selectedPaymentMethod == '1') {
//                             controller.checkout();
//                           } else {
//                             controller.checkoutWallet();
//                           }
//                         }),
//                   ],
//                   // ),
//                 // ),
//         )));
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:semo/controller/payment_controller.dart';

// // class Payment extends StatefulWidget {
// //   const Payment({super.key});

// //   @override
// //   State<Payment> createState() => _PaymentState();
// // }

// // class _PaymentState extends State<Payment> {
  
// //   @override
// //   Widget build(BuildContext context) {
// //   PaymentController controller=  Get.put(PaymentController());
// //     return Scaffold(body: Center(child: Text(controller.arguments['order_price'].toString()),));
// //   }
// // }