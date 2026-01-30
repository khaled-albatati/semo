import 'package:get/get.dart';
import 'package:semo/core/constant/routes.dart';
import '../../core/class/statusrequiest.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/services/services.dart';
import '../../linkapi.dart';

abstract class ProfileController extends GetxController {
  updateProfile();
}

class ProfileControllerImp extends ProfileController {
  MyServices myServices = Get.find();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController whatsapp;
  late StatusRequiest statusRequiest;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    whatsapp = TextEditingController();
      username.text = myServices.sharedPreferences.getString('username') ?? '';
  email.text = myServices.sharedPreferences.getString('email') ?? '';
  phone.text = myServices.sharedPreferences.getString('userphone') ?? '';
  whatsapp.text = myServices.sharedPreferences.getString('userwhats') ?? '';
    
    // Initialize values if needed
    // username.text = ...; // Load existing data

    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    whatsapp.dispose();
    super.dispose();
  }

  @override
updateProfile() async {
  var formdata = formstate.currentState;
  if (formdata!.validate()) {
    // Retrieve user ID safely
    int? userId = myServices.sharedPreferences.getInt('id');
    if (userId == null) {
      Get.snackbar("خطأ", "لم يتم العثور على معرف المستخدم.");
      return; // Exit if user ID is not found
    }

    // Prepare the request body
    Map<String, String> requestBody = {
      'user_id': userId.toString(),
    };

    // Only add fields that have been modified
    // if (username.text != myServices.sharedPreferences.getString('username')) {
    //   requestBody['user_name'] = username.text;
    // }
    // if (email.text != myServices.sharedPreferences.getString('email')) {
    //   requestBody['user_email'] = email.text;
    // }
    // if (phone.text != myServices.sharedPreferences.getString('userphone')) {
    //   requestBody['user_phone'] = phone.text;
    // }
    // if (whatsapp.text != myServices.sharedPreferences.getString('userwhats')) {
    //   requestBody['users_whats'] = whatsapp.text;
    // }

    // Send the request to update the profile
    var response = await http.post(
      Uri.parse(AppLink.updateProfile),
      body: {
        "user_id":userId.toString(),
        "user_name":username.text,
        "user_email":email.text,
        "user_phone":phone.text,
        "users_whats":whatsapp.text,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = json.decode(response.body);
      String status = responseBody['status'];
      if (status == 'success') {
        Get.snackbar("نجاح", "تم تحديث الملف الشخصي بنجاح!");
         myServices.sharedPreferences
                .setString("username", responseBody['data']['user_name']);
                // print('object');
            myServices.sharedPreferences
                .setString("email", responseBody['data']['user_email']);
            myServices.sharedPreferences
                .setString("userphone", responseBody['data']['user_phone']);
            myServices.sharedPreferences
                .setString("userwhats", responseBody['data']['users_whats']);
        Get.offAllNamed(AppRoutes.navbar);
      } else {
        // Handle failure messages
        String errorMessage = responseBody['messages'].join('\n');
        Get.snackbar("خطأ", errorMessage);
      }
    } else {
      Get.snackbar("خطأ", "خطأ في الخادم. يرجى المحاولة مرة أخرى لاحقاً.");
    }
  }
}
  
  signOut() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.navbar);
  }
}
