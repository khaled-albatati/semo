import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/class/statusrequiest.dart';
import 'package:semo/core/constant/routes.dart';
import 'package:semo/core/services/services.dart';
import 'package:semo/data/datasource/remote/cart_data.dart';
import 'package:semo/data/model/cartmodel.dart';
import '../data/datasource/remote/address_data.dart';
import '../data/model/addressmodel_price.dart';
import '../linkapi.dart';

class CartController extends GetxController {
  String? selectedLocation;
  TextEditingController? controllercoupon;
  late AddressModelPrice addressModelPrice;
  AddressData addressData = AddressData(Get.find());
  List<AddressModelPrice> address = [];
  String? paymentMethod;
  String? addressid;
  int? discountcoupon = 0;
  String? couponname;
  late TextEditingController namecoupn;
  String? selectedPaymentMethod;
  String? couponid;
  CartData cartData = CartData(Get.find());
  late StatusRequiest statusRequiest;
  MyServices myServices = Get.find();
  List<CartModel> data = [];
  double priceorders = 0.0;
  // double deliverycost = 0.0;
  int totalcountitems = 0;

  bool isLoading = true;

  Future<void> loadData() async {
    // Simulating an asynchronous data loading operation
    await Future.delayed(const Duration(seconds: 2));
    await getAddress();
    await view();

    // Data loading complete, update isLoading
    isLoading = false;

    // Notify listeners that the data has changed
    update();
  }

  Future add(String foodid) async {
    statusRequiest = StatusRequiest.loading;
    final userId = myServices.sharedPreferences.getString('id');
    try {
      var response = await http.post(Uri.parse(AppLink.cartadd), body: {
        "usersid": userId,
        "foodid": foodid,
      });
      // print(response.body);
      if (response.statusCode == 200) {
        statusRequiest = StatusRequiest.loading;
        update();

        // print("=============================== Controller $response ");

        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج الى السلة "));
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    update();
  }

  Future delete(String foodid) async {
    statusRequiest = StatusRequiest.loading;
    final userId = myServices.sharedPreferences.getString('id');
    try {
      var response = await http.post(Uri.parse(AppLink.cartdelete), body: {
        "usersid": userId,
        "foodid": foodid,
      });
      // print(response.body);
      if (response.statusCode == 200) {
        statusRequiest = StatusRequiest.loading;
        update();

        // print("=============================== Controller $response ");

        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازالة المنتج الى السلة "));
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    update();
  }

  getCountItems(foodid) async {
    statusRequiest = StatusRequiest.loading;
    try {
      final response = await http.post(Uri.parse(AppLink.cartgetcountitems),
          body: {
            'foodid': foodid,
            'usersid': myServices.sharedPreferences.getString('id')!
          });
      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        int countitems = 0;
        countitems = int.parse(jsondata['data']);
        // countitems=jsondata['data'];
        statusRequiest = StatusRequiest.success;
        return countitems;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    update();
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

////////////////////////Coupon start///////////////////////////////////
  // getTotalPrice() {
  //   final double addressPrice =
  //       double.tryParse(addressModelPrice.addresspricePrice ?? '0') ?? 0.0;
  //   return (priceorders - priceorders * discountcoupon! / 100) + addressPrice;
  // }
   getTotalPrice() {
  final int addressPrice = int.tryParse(addressModelPrice.addresspricePrice.toString()) ?? 0;
  
  // Ensure discountcoupon is not null and is a valid number
  final double discount = discountcoupon != null ? discountcoupon! / 100 : 0;

  // Calculate total price
  return (priceorders - (priceorders * discount)).round() + addressPrice;
}

  getAddress() async {
    // statusRequiest = StatusRequiest.loading;
    String x =  myServices.sharedPreferences.getInt('id').toString();
    print('=================================$x');
    var response = await http.post(Uri.parse(AppLink.addressViewPrice),
        body: {"usersid":x});

    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
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
      print('object');
      // Get.toNamed(AppRoutes.addressview);
    }
    // End
    update();
  }

////////////////////////Coupon End///////////////////////////////////
  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    // deliverycost=0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  checkOutKind() {}

  checkout() async {
    if (data.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
    if (selectedPaymentMethod == null) {
      return Get.snackbar("ملاحظة", "يرجى اختيار طريقة الدفع");
    }
    if (addressModelPrice.addressId == null) {
      return Get.snackbar("ملاحظة", "يرجى اختيار موقع استلام الطلب");
    }
    statusRequiest = StatusRequiest.loading;
    update();
    try {
      var response = await http.post(Uri.parse(AppLink.wallet), body: {
        "usersid": myServices.sharedPreferences.getString("id"),
        "addressid": addressModelPrice.addressId.toString(),
        "pricedelivery": addressModelPrice.addresspricePrice.toString(),
        "ordersprice": priceorders.toString(),
        "paymentmethod": "1",
      });
      if (response.statusCode == 200) {
        statusRequiest = StatusRequiest.success;
        // Get.offAllNamed(AppRoutes.navbar);
        Get.snackbar("تم", "تم الطلب بنجاح");
        goTruckingOrder();
      } else {
        statusRequiest = StatusRequiest.none;
        Get.snackbar("خطا", "حاول مرة اخرى");
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    // End
    update();
  }

  checkoutWallet() async {
    if (data.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
    if (selectedPaymentMethod == null) {
      return Get.snackbar("ملاحظة", "يرجى اختيار طريقة الدفع");
    }
    if (addressModelPrice.addressId == null) {
      return Get.snackbar("ملاحظة", "يرجى اختيار موقع استلام الطلب");
    }
    statusRequiest = StatusRequiest.loading;
    update();
    var response = await http.post(Uri.parse(AppLink.eWallet), body: {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressModelPrice.addressId.toString(),
      "pricedelivery": addressModelPrice.addresspricePrice.toString(),
      "ordersprice": priceorders.toString(),
      "paymentmethod": '2',
      // "user_referral_for":
      //     myServices.sharedPreferences.getString("user_referral_for"),
    });
    if (response.statusCode == 200) {
      if (response.body == "عذرا,المحفظه لديك اقل من تكلفة الحساب") {
        Get.snackbar("خطأ", "رصيد المحفظة غير كافي");
        // update();
      } else {
        goTruckingOrder();
        Get.snackbar("تم", "تم الدفع بنجاح");
      }
      statusRequiest = StatusRequiest.success;
    } else {
      statusRequiest = StatusRequiest.faliure;
      Get.snackbar("هناك خطأ", "حاول مرة اخرى");
    }
    update();
  }

  goTruckingOrder() {
    Get.offAllNamed(AppRoutes.orderspending);
  }

  @override
  void onInit() {
    loadData();
    priceorders;
    addressModelPrice = AddressModelPrice();
    controllercoupon = TextEditingController();
    namecoupn = TextEditingController();

    super.onInit();
  }
}



// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:semo/core/class/statusrequiest.dart';
// import 'package:semo/core/constant/routes.dart';
// import 'package:semo/core/services/services.dart';
// import 'package:semo/data/datasource/remote/cart_data.dart';
// import 'package:semo/data/model/cartmodel.dart';
// import '../data/datasource/remote/address_data.dart';
// import '../data/model/addressmodel_price.dart';
// import '../linkapi.dart';

// class CartController extends GetxController {
//   String? selectedLocation;
//   TextEditingController? controllercoupon;
//   late AddressModelPrice addressModelPrice;
//   AddressData addressData = AddressData(Get.find());
//   List<AddressModelPrice> address = [];
//   String? paymentMethod;
//   String? addressid ;
//   int? discountcoupon = 0;
//   String? couponname;
//   late TextEditingController namecoupn;
//   String? selectedPaymentMethod;
//   String? couponid;
//   CartData cartData = CartData(Get.find());
//   late StatusRequiest statusRequiest;
//   MyServices myServices = Get.find();
//   List<CartModel> data = [];
//   double priceorders = 0.0;
//   // double deliverycost = 0.0;
//   int totalcountitems = 0;

//   Future add(String foodid) async {
//     statusRequiest = StatusRequiest.loading;
//     final userId = myServices.sharedPreferences.getString('id');
//     try {
//       var response = await http.post(Uri.parse(AppLink.cartadd), body: {
//         "usersid": userId,
//         "foodid": foodid,
//       });
//       // print(response.body);
//       if (response.statusCode == 200) {
//         statusRequiest = StatusRequiest.loading;
//         update();

//         // print("=============================== Controller $response ");

//         Get.rawSnackbar(
//             title: "اشعار",
//             messageText: const Text("تم اضافة المنتج الى السلة "));
//       } else {
//         statusRequiest = StatusRequiest.faliure;
//       }
//     } catch (e) {
//       statusRequiest = StatusRequiest.serverException;
//     }
//     update();
//   }

//   Future delete(String foodid) async {
//     statusRequiest = StatusRequiest.loading;
//     final userId = myServices.sharedPreferences.getString('id');
//     try {
//       var response = await http.post(Uri.parse(AppLink.cartdelete), body: {
//         "usersid": userId,
//         "foodid": foodid,
//       });
//       // print(response.body);
//       if (response.statusCode == 200) {
//         statusRequiest = StatusRequiest.loading;
//         update();

//         // print("=============================== Controller $response ");

//         Get.rawSnackbar(
//             title: "اشعار",
//             messageText: const Text("تم ازالة المنتج الى السلة "));
//       } else {
//         statusRequiest = StatusRequiest.faliure;
//       }
//     } catch (e) {
//       statusRequiest = StatusRequiest.serverException;
//     }
//     update();
//   }

//   getCountItems(foodid) async {
//     statusRequiest = StatusRequiest.loading;
//     try {
//       final response = await http.post(Uri.parse(AppLink.cartgetcountitems),
//           body: {
//             'foodid': foodid,
//             'usersid': myServices.sharedPreferences.getString('id')!
//           });
//       if (response.statusCode == 200) {
//         final jsondata = jsonDecode(response.body);
//         int countitems = 0;
//         countitems = int.parse(jsondata['data']);
//         // countitems=jsondata['data'];
//         statusRequiest = StatusRequiest.success;
//         return countitems;
//       } else {
//         statusRequiest = StatusRequiest.faliure;
//       }
//     } catch (e) {
//       statusRequiest = StatusRequiest.serverException;
//     }
//     update();
//   }

//   Future view() async {
//     data.clear();
//     statusRequiest = StatusRequiest.loading;
//     update();
//     try {
//       var response = await http.post(Uri.parse(AppLink.cartview), body: {
//         "usersid": myServices.sharedPreferences.get("id"),
//       });
//       // print("=============================== Controller $response ");
//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         List dataresponse = responseData['datacart']['data'];
//         Map dataresponsecountprice = responseData['countprice'];
//         data.clear();
//         data.addAll(dataresponse.map((e) => CartModel.fromJson(e)).toList());
//         totalcountitems = int.parse(dataresponsecountprice['totalcount']);
//         priceorders = double.parse(dataresponsecountprice['totalprice']);
//       } else {
//         statusRequiest = StatusRequiest.faliure;
//       }
//     } catch (e) {
//       statusRequiest = StatusRequiest.serverException;
//     }

//     update();
//   }

// ////////////////////////Coupon start///////////////////////////////////
//   getTotalPrice() {
//     final double addressPrice =
//         double.tryParse(addressModelPrice.addresspricePrice ?? '0') ?? 0.0;
//     return (priceorders - priceorders * discountcoupon! / 100) + addressPrice;
//   }

//   getAddress() async {
//     statusRequiest = StatusRequiest.loading;

//     var response = await http.post(Uri.parse(AppLink.addressViewPrice),
//         body: {"usersid": myServices.sharedPreferences.getString('id')});

//     if (kDebugMode) {
//       print("=============================== Controller $response ");
//     }

//     if (response.statusCode == 200) {
//       final jsondata = jsonDecode(response.body);
//       // Start backend
//       List listdata = jsondata['data'];
//       address.addAll(listdata.map((e) => AddressModelPrice.fromJson(e)));
//       statusRequiest = StatusRequiest.success;
//       // if (data.isEmpty) {
//       //   return Get.snackbar("تنبيه", "no data");
//       // }
//     } else {
//       return Get.snackbar("تنبيه", "لايوجد عنوان");
//     }
//     // End
//     update();
//   }

// ////////////////////////Coupon End///////////////////////////////////
//   resetVarCart() {
//     totalcountitems = 0;
//     priceorders = 0.0;
//     // deliverycost=0.0;
//     data.clear();
//   }

//   refreshPage() {
//     resetVarCart();
//     view();
//   }

//   checkOutKind() {
   
//   }

//   checkout() async {
//     if (data.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
//     if (selectedPaymentMethod == null) {
//       return Get.snackbar("ملاحظة", "يرجى اختيار طريقة الدفع");
//     }
//     if (addressModelPrice.addressId == null){
//       return Get.snackbar("ملاحظة", "يرجى اختيار موقع استلام الطلب");
//     }
//     statusRequiest = StatusRequiest.loading;
//     update();
//     try {
//       var response = await http.post(Uri.parse(AppLink.wallet), body: {
//         "usersid": myServices.sharedPreferences.getString("id"),
//         "addressid": addressModelPrice.addressId.toString(),
//         "pricedelivery": addressModelPrice.addresspricePrice.toString(),
//         "ordersprice": priceorders.toString(),
//         "paymentmethod": "1",
//       });
//       if (response.statusCode == 200) {
//         statusRequiest = StatusRequiest.success;
//         // Get.offAllNamed(AppRoutes.navbar);
//         Get.snackbar("تم", "تم الدفع بنجاح");
//         goTruckingOrder();
//       } else {
//         statusRequiest = StatusRequiest.none;
//         Get.snackbar("خطا", "حاول مرة اخرى");
//       }
//     } catch (e) {
//       statusRequiest=StatusRequiest.serverException;
//     }
//     // End
//     update();
//   }

//   checkoutWallet() async {
//     if (data.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
//     if (selectedPaymentMethod == null) {
//       return Get.snackbar("ملاحظة", "يرجى اختيار طريقة الدفع");
//     }
//      if (addressModelPrice.addressId == null){
//       return Get.snackbar("ملاحظة", "يرجى اختيار موقع استلام الطلب");
//     }
//     statusRequiest = StatusRequiest.loading;
//     update();
//     var response = await http.post(Uri.parse(AppLink.eWallet), body: {
//       "usersid": myServices.sharedPreferences.getString("id"),
//       "addressid": addressModelPrice.addressId.toString(),
//       "pricedelivery":addressModelPrice.addresspricePrice.toString(),
//       "ordersprice": priceorders.toString(),
//       "paymentmethod": '2',
//       // "user_referral_for":
//       //     myServices.sharedPreferences.getString("user_referral_for"),
//     });
//     if (response.statusCode == 200) {
//      if (response.body == "عذرا,المحفظه لديك اقل من تكلفة الحساب") {
//       Get.snackbar("خطأ", "رصيد المحفظة غير كافي");
//       // update();
//     } else {
//     goTruckingOrder() ;
//       Get.snackbar("تم", "تم الدفع بنجاح");
//     }
//     statusRequiest = StatusRequiest.success;
//   } else {
//     statusRequiest = StatusRequiest.faliure;
//     Get.snackbar("هناك خطأ", "حاول مرة اخرى");
//   }
//   update();
// }

//   goTruckingOrder() {
//     Get.offAllNamed(AppRoutes.orderspending);
//   }

//   @override
//   void onInit() {
//     getAddress();
//     view();
//     priceorders;
//     addressModelPrice = AddressModelPrice();
//     controllercoupon = TextEditingController();
//     namecoupn = TextEditingController();

//     super.onInit();
//   }
// }
