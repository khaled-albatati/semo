import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/constant/routes.dart';
import '../../core/class/statusrequiest.dart';
import '../../core/functions/handlingdata_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login.dart';
import '../../linkapi.dart';
import 'package:http/http.dart' as http;

abstract class DeleteController extends GetxController {
  MyServices myServices = Get.find();

  // late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController username;
  LoginData loginData = LoginData(Get.find());
  late StatusRequiest statusRequiest;
  bool isShowPassword = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  deleteAccount();
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }
}

class DeleteControllerImp extends DeleteController {
  //============AI =====================\\
  @override
  Future deleteAccount() async {
    statusRequiest = StatusRequiest.loading;
    try {
      var response = await http.post(Uri.parse(AppLink.deleteAccount), body: {
        'username': myServices.sharedPreferences.getString("username").toString(),
        'password': password.text,
      });
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        statusRequiest = handlingData(responseBody);
        if (statusRequiest == StatusRequiest.success) {
          myServices.sharedPreferences.clear();
          Get.offAllNamed(AppRoutes.login);
         Get.snackbar(responseBody['message'],''); 
        } else {
          Get.defaultDialog(title:responseBody['message'],);
          statusRequiest = StatusRequiest.faliure;
        }
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    update();
  }

  @override
  void onInit() {
    // phone = TextEditingController();
    username = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    // phone.dispose();
    username.dispose();
    password.dispose();
    super.dispose();
  }
}
