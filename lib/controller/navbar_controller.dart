import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/functions/redirect.dart';
import 'package:semo/screens/home_screen.dart';
import 'package:semo/screens/producer_family.dart';
import 'package:semo/screens/profile.dart';
import 'package:http/http.dart' as http;
import 'package:semo/screens/wsl.dart';
import '../core/class/statusrequiest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdata_controller.dart';
import '../core/services/services.dart';
import '../data/model/addressmodel_price.dart';
import '../linkapi.dart';
import '../screens/restaurant_navbar.dart';

abstract class NavBarController extends GetxController {
  changePage(int currentPage);
  getdata();
}

class NavBarControllerImp extends NavBarController {
  int currentPage = 0;
  late StatusRequiest statusRequiest;
  MyServices myServices = Get.find();
  List<AddressModelPrice> address = [];
  List<Widget> listpage = [
    const HomeScreen(),
    const Wsl(),
    const ProducerFamily(),
    const RestaurantNav(),
    const Profile(),
  ];
  @override
  // ignore: avoid_renaming_method_parameters
  changePage(int i) {
    currentPage = i;
    update();
  }

  @override
  getdata() async {
    statusRequiest = StatusRequiest.loading;
    var response = await http.post(Uri.parse(AppLink.users), body: {
      "userid": myServices.sharedPreferences.getInt('id').toString()
    }); //getData from "Data folder" not "controller folder"
    statusRequiest = handlingData(response);
    Map<String, dynamic> responseBody = json.decode(response.body);
    if (StatusRequiest.success == statusRequiest) {
      if (responseBody['status'] == "success") {
        myServices.sharedPreferences
            .setString("username", responseBody['data']['user_name']);
        myServices.sharedPreferences
            .setString("email", responseBody['data']['user_email']);
        myServices.sharedPreferences
            .setInt("user_wallet", responseBody['data']['user_wallet']);
        myServices.sharedPreferences
            .setString("userphone", responseBody['data']['user_phone']);
        myServices.sharedPreferences
            .setString("userwhats", responseBody['data']['users_whats'])
            .toString();
        myServices.sharedPreferences
            .setInt("userAprove", responseBody['data']['user_aprrove']);
        print('===========================================');
        print(myServices.sharedPreferences.getInt('userAprove'));
        Redirector.redirectUser();
        // myServices.sharedPreferences.setString("id",response['data']['user_id']);

        // users.addAll(response['users']);
        // print(users);
        // items.addAll(response['items']);
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    }
    update();
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
      if (myServices.sharedPreferences.getInt("id") !=null){
      Get.snackbar("مرحبا", "الرجاء اضافة موقع");
      Get.offAllNamed(AppRoutes.addressview);
      }
    }
    // End
    update();
  }

  @override
  void onInit() {
    getAddress();
    getdata();
    super.onInit();
  }
}
