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
  double deliveryPrice = 0.0; // To hold the calculated delivery price
  String? restaurantsLocation; // To hold the restaurant's location

  CartController controller = Get.put(CartController());
  AddressViewController address = Get.put(AddressViewController());
  String? selectedLocation;
  int? selectedOption;
  int? object;
  AddressModel? selectedAddress; // To hold the selected address

  @override
  void initState() {
    super.initState();
    // Get the restaurant's location from the arguments passed to this widget
    restaurantsLocation = Get.arguments['restaurants_location'];
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

  void fetchDeliveryPrice(AddressModel selectedAddress) {
    controller
        .fetchDeliveryPrice(restaurantsLocation!, selectedAddress.addressName!)
        .then((price) {
      setState(() {
        deliveryPrice = price;
        controller.addressModelPrice.addresspricePrice = deliveryPrice.toInt();
        controller.addressid = selectedAddress.addressId.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = address.data;
     Future<bool> onWillPop() async {
    print('back');
    return true; // This will allow the back navigation to proceed
  }

    return WillPopScope(
      onWillPop: controller.resetCart,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('اكمال الطلب'),
          centerTitle: true,
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      GetBuilder<AddressViewController>(
                        builder: (controllerx) => CheckoutAdress(
                          location: 'مواقعك',
                          widget: DropdownButton<AddressModel>(
                            hint: const Text('اختر موقع'),
                            value: selectedAddress,
                            items: colors.map<DropdownMenuItem<AddressModel>>(
                              (AddressModel address) {
                                return DropdownMenuItem<AddressModel>(
                                  value: address,
                                  child: Text(address.addressLong!),
                                );
                              },
                            ).toList(),
                            onChanged: (AddressModel? newValue) {
                              setState(() {
                                selectedAddress = newValue;

                                if (newValue != null) {
                                  // Call the function to fetch delivery price
                                  fetchDeliveryPrice(selectedAddress!);
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
                      ),
                      TextButton(
                        onPressed: () {
                          validateCoupon(couponController.text);
                        },
                        child: const Text('تأكيد الكود'),
                      ),
                      // const SizedBox(height: 10),
                      // Text(
                      //   'الخصم: ${discountAmount.toStringAsFixed(2)}',
                      //   style: const TextStyle(color: Colors.green, fontSize: 16),
                      // ),
                      // const SizedBox(height: 20),
                      // // Displaying the calculated delivery price
                      // Text(
                      //   'سعر التوصيل: ${deliveryPrice.toStringAsFixed(2)}',
                      //   style: const TextStyle(fontSize: 16, color: Colors.black),
                      // ),
                      PriceCheckOut(
                        deliveryCost: deliveryPrice.toInt(),
                        discount: discountAmount.toDouble(),
                        subtotal: controller.totalPrice,
                        total: controller
                            .getTotalPrice(discountAmount.toDouble())
                            .toString(),
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
      ),
    );
  }
}
