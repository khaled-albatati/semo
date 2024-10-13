import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:semo/core/class/statusrequiest.dart';
import 'package:semo/core/constant/routes.dart';
import 'package:semo/data/model/from_to.dart';
import 'package:semo/linkapi.dart';

import '../../core/functions/handlingdata_controller.dart';
import '../../core/services/services.dart';

class AddressToAddressController extends GetxController {
  // List categories = [] ;  //متغير لتخزين البيانات بعد جلبها من ال backend .
  List<AddressToAddress> address =
      []; //متغير لتخزين البيانات بعد جلبها من ال backend .
  String? selectedLocation;
  String? selectedLocation1;
  late TextEditingController details;
  // CategoriesModel? categoriesModel;
  // FoodHomeController? foodHomeController;
  late AddressToAddress addressToAddress;
  late StatusRequiest statusRequiest;
  late int price = 0;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    getLocations();
    fetchPrice();
    details = TextEditingController();
    sendLocations(price.toString());
    super.onInit();
  }

  Future getLocations() async {
    statusRequiest = StatusRequiest.loading;
    var response = await http.post(Uri.parse(AppLink.addressToAddress));
    statusRequiest = handlingData(response);

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(response.body);
      print(jsondata);
      List listdata = jsondata['data'];
      address.addAll(listdata.map((e) => AddressToAddress.fromJson(e)));
      statusRequiest = StatusRequiest.success;
    } else {
      statusRequiest = StatusRequiest.faliure;
    }

    update();
  }

  fetchPrice() async {
    update();
    try {
      final response = await http.post(Uri.parse(AppLink.addressPrice), body: {
        'source': selectedLocation,
        'destination': selectedLocation1,
      });

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        price = jsonData['price'];
        statusRequiest = StatusRequiest.success;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    update();
  }

  Future<void> sendLocations(String price) async {
    statusRequiest = StatusRequiest.loading;
    var response = await http.post(Uri.parse(AppLink.addressOrders), body: {
      "userid": myServices.sharedPreferences.getInt("id").toString(),
      "source": selectedLocation,
      "destination": selectedLocation1,
      "details": details.text,
      "price": price,
    });
    statusRequiest = handlingData(response);
    if (response.statusCode == 200) {
      Get.offAllNamed(AppRoutes.navbar);
      statusRequiest = StatusRequiest.success;
    } else {
      statusRequiest = StatusRequiest.faliure;
    }
    update();
  }

  @override
  void dispose() {
    super.dispose();
    selectedLocation;
    selectedLocation1;
    details;
    price;
  }
}
