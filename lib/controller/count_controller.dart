import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/class/statusrequiest.dart';
import 'package:semo/core/services/services.dart';
import 'package:semo/data/datasource/remote/cart_data.dart';
import 'package:semo/data/model/cartmodel.dart';
import '../data/datasource/remote/address_data.dart';
import '../data/model/addressmodel_price.dart';
import '../linkapi.dart';

class CountController extends GetxController {
  String? selectedLocation;
  TextEditingController? controllercoupon;
  late AddressModelPrice addressModelPrice;
  AddressData addressData = AddressData(Get.find());
  List<AddressModelPrice> address = [];
  String? paymentMethod;
  String? addressid ;
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
        "usersid": myServices.sharedPreferences.get("id"),
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
  getTotalPrice() {
    final double addressPrice =
        double.tryParse(addressModelPrice.addresspricePrice ?? '0') ?? 0.0;
    return (priceorders - priceorders * discountcoupon! / 100) + addressPrice;
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



  

  @override
  void onInit() {
   loadData();
    priceorders;
    addressModelPrice = AddressModelPrice();
   
    super.onInit();
  }
}

