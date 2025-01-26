import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/class/statusrequiest.dart';
import 'package:semo/core/constant/routes.dart';
import 'package:semo/core/services/services.dart';
import 'package:semo/data/model/cartmodel.dart';
import '../data/model/addressmodel_price.dart';
import '../linkapi.dart';
import '../noti.dart';

class CartController extends GetxController {
  TextEditingController? controllercoupon;
  late AddressModelPrice addressModelPrice;
  List<AddressModelPrice> address = [];
  String? addressid;
  late TextEditingController namecoupn;
  String? selectedPaymentMethod;
  int? couponid;
  late StatusRequiest statusRequiest;
  MyServices myServices = Get.find();
  List<CartModel> data = [];
  double priceorders = 0.0;
  int totalcountitems = 0;
  double totalPrice = 0;
  bool isLoading = true;
  String restaurants_location = 'الديس';
  String notes = 'لايوجد';
  NotificationService noti = NotificationService();

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    await getAddress();
    await view();
    isLoading = false;
    update();
  }

  Future<bool> resetCart() async {
    try {
      final response = await http.post(Uri.parse(AppLink.cartReset), body: {
        'usersid': myServices.sharedPreferences.getInt('id').toString()
      });

      // statusRequiest = handlingData(response);
      if (response.statusCode == 200) {
        statusRequiest = StatusRequiest.success;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }

      // update();
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    return true;
  }

  



  Future view() async {
    data.clear();
    // statusRequiest = StatusRequiest.loading;
    update();
    try {
      var response = await http.post(Uri.parse(AppLink.cartview), body: {
        "usersid": myServices.sharedPreferences.getInt("id").toString(),
      });
      // print("=============================== Controller $response ");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        List dataresponse = responseData['datacart']['data'];
        Map dataresponsecountprice = responseData['countprice'];
        data.clear();
        data.addAll(dataresponse.map((e) => CartModel.fromJson(e)).toList());
        totalcountitems = int.parse(dataresponsecountprice['totalcount']);
        priceorders = double.parse(dataresponsecountprice['totalprice']);
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }

    update();
  }

  Future<int> validateCoupon(String couponCode) async {
    if (couponCode.isEmpty) return 0;

    int discountAmount = 0;
    try {
      var response = await http.post(
        Uri.parse(AppLink.checkcoupon),
        body: {
          "couponname": couponCode,
        },
      );

      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        String status = jsondata['status'];
        if (status == 'success') {
          couponid = jsondata['data']['coupon_id'];
          discountAmount = jsondata['data']['coupon_discount'];
        } else {
          Get.snackbar("خطأ", "كود الخصم غير صالح");
        }
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ في التحقق من الكود");
    }
    return discountAmount;
  }


  int getTotalPrice(double discount) {
    final int addressPrice =
        int.tryParse(addressModelPrice.addresspricePrice.toString()) ?? 0;
    return (totalPrice - discount).round() + addressPrice;
  }

  Future<void> checkout(String? couponCode) async {
    if (selectedPaymentMethod == null) {
      Get.snackbar("ملاحظة", "يرجى اختيار طريقة الدفع");
    }

    int discount = await validateCoupon(couponCode ?? '');
    try {
      var response = await http.post(Uri.parse(AppLink.wallet), body: {
        "usersid": myServices.sharedPreferences.getInt("id").toString(),
        "addressid": addressid.toString(),
        "pricedelivery": addressModelPrice.addresspricePrice.toString(),
        "ordersprice": totalPrice.toString(),
        "paymentmethod": "1",
        "couponid": couponid.toString(), // Include coupon code in request
        "coupondiscount": discount.toString(), // Include coupon code in request
        "notes": notes.toString(), // Include coupon code in request
      });
      if (response.statusCode == 200) {
        Get.snackbar("تم", "تم الطلب بنجاح");
        noti.sendFCMMessage("Admin", "طلب جديد", "");
        Get.offAllNamed(AppRoutes.navbar);
      } else {
        Get.snackbar("خطأ", "حاول مرة أخرى");
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ في عملية الدفع");
    }
  }

  getAddress() async {
    // statusRequiest = StatusRequiest.loading;
    String x = myServices.sharedPreferences.getInt('id').toString();
    // print('=================================$x');
    var response = await http
        .post(Uri.parse(AppLink.addressViewPrice), body: {"usersid": x});

    // print("=============================== Controller $response ");
    Map<String, dynamic> responseBody = json.decode(response.body);
    String status = responseBody['status'];
    if (status == 'success') {
      final jsondata = jsonDecode(response.body);
      // Start backend
      List listdata = jsondata['data'];
      address.addAll(listdata.map((e) => AddressModelPrice.fromJson(e)));
      statusRequiest = StatusRequiest.success;
      // if (data.isEmpty) {
      //   return Get.snackbar("تنبيه", "no data");
      // }
    } else {
      // print('object');
      Get.toNamed(AppRoutes.addressview);
    }
    // End
    update();
  }

////////////////////////Coupon End///////////////////////////////////
  Future<void> checkoutWallet(String? couponCode) async {
    if (selectedPaymentMethod == null) {
      Get.snackbar("ملاحظة", "يرجى اختيار طريقة الدفع");
    }
    // ignore: unused_local_variable
    int discount = await validateCoupon(couponCode ?? '');
    try {
      var response = await http.post(Uri.parse(AppLink.eWallet), body: {
        "usersid": myServices.sharedPreferences.getString("id"),
        "addressid": addressModelPrice.addressId.toString(),
        "pricedelivery": addressModelPrice.addresspricePrice.toString(),
        "ordersprice": totalPrice.toString(),
        "paymentmethod": '2',
        "couponid": couponCode, // Include coupon code in request
      });
      if (response.statusCode == 200) {
        Get.snackbar("تم", "تم الدفع بنجاح");
        print('wallet');
      } else {
        Get.snackbar("هناك خطأ", "حاول مرة أخرى");
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ في عملية الدفع");
    }
  }

  goTruckingOrder() {
    Get.offAllNamed(AppRoutes.orderspending);
  }


  Future<double> fetchDeliveryPrice(String source, String destination) async {
    try {
      final response = await http.post(
        Uri.parse(AppLink.addressPrice), // Replace with your actual endpoint
        body: {
          'source': restaurants_location,
          'destination': destination,
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['error'] == null) {
          return double.tryParse(data['price'].toString()) ?? 0.0;
        } else {
          Get.snackbar("Error", data['error']);
          return 0.0;
        }
      } else {
        Get.snackbar("Error", "Failed to fetch delivery price");
        return 0.0;
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
      return 0.0;
    }
  }

  @override
  void onInit() {
    loadData();
    totalPrice = Get.arguments['total_price'];
    restaurants_location = Get.arguments['restaurants_location'];
    notes = Get.arguments['notes'];
    priceorders;
    addressModelPrice = AddressModelPrice();
    controllercoupon = TextEditingController();
    namecoupn = TextEditingController();

    super.onInit();
  }
}
