import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/screens/home_screen.dart';
import 'package:semo/screens/producer_family.dart';
import 'package:semo/screens/profile.dart';
import 'package:http/http.dart' as http;
import 'package:semo/screens/wsl.dart';
import '../core/class/statusrequiest.dart';
import '../core/functions/handlingdata_controller.dart';
import '../core/services/services.dart';
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
            .setString("user_wallet", responseBody['data']['user_wallet']);
            myServices.sharedPreferences
            .setString("userphone", responseBody['data']['user_phone']);
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

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
