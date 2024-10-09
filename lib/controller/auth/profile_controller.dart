import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import 'package:semo/core/constant/routes.dart';
import 'package:semo/core/services/services.dart';
import 'package:semo/data/datasource/remote/profile_data.dart';
import '../../core/class/statusrequiest.dart';
import '../../core/functions/handlingdata_controller.dart';
import '../../linkapi.dart';



abstract class ProfileController extends GetxController {
  initialData();
  // getdata();
  // goToItems(List categories, int selectedCat, String categoryid);
  // goToDetails(List items, int selecteditems, String itemsid);
}

class ProfileControllerImp extends ProfileController {
  MyServices myServices = Get.find();
  String? username;
  //  String? email;
  String? id;

  ProfileData homeData = ProfileData(Get.find());

  List users = [];

  late StatusRequiest statusRequiest;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getInt("id").toString();
  }

  @override
  void onInit() {
    // getdata();
    initialData();
    super.onInit();
  }

  // @override
  // getdata() async {
  //   statusRequiest = StatusRequiest.loading;
  //   var response = await http.post(Uri.parse(AppLink.users),body: {
  //     "userid":myServices.sharedPreferences.getInt('id').toString()
  //   }); //getData from "Data folder" not "controller folder"
  //   statusRequiest = handlingData(response);
  //   Map<String, dynamic> responseBody = json.decode(response.body);
  //   if (StatusRequiest.success == statusRequiest) {
  //     if (responseBody['status'] == "success") {
  //         myServices.sharedPreferences.setInt("id",responseBody['data']['user_id']);
  //         myServices.sharedPreferences.setString("username",responseBody['data']['user_name']);
  //         myServices.sharedPreferences.setString("email",responseBody['data']['user_email']);
  //         myServices.sharedPreferences.setInt("user_wallet",responseBody['data']['user_wallet']);
  //         // myServices.sharedPreferences.setString("id",response['data']['user_id']);
  //         Get.toNamed(AppRoutes.profile);

  //       // users.addAll(response['users']);
  //       // print(users);
  //       // items.addAll(response['items']);

  //       if (kDebugMode) {
  //         print(response);
  //       }
  //     } else {
  //       statusRequiest = StatusRequiest.faliure;
  //     }
  //   }
  //   update();
  // }
  signOut() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.navbar);
  }
}
